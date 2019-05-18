#include "MechanicsController.h"
#include "PrinterController.h"

int32_t MechanicsController::voltage_adc(int32_t temp)
{
    if (temp >= 0 and temp <= MAX_TEMP)
    {
        int i = -1;
        while (temptable_11[++i][1] > temp);
        if (temp != temptable_11[i][1])
        {
            float k = (float)(temp - temptable_11[i][1])/(temptable_11[i-1][1] - temptable_11[i][1]);
            return (round((int)temptable_11[i][0] + (int)(temptable_11[i-1][0] - temptable_11[i][0])*k));
        }
        else
            return temptable_11[i][0];
    }
    return 3255;
}

int32_t MechanicsController::temperature_adc(int32_t volt)
{
    if (volt >= temptable_11[0][0] and volt <= 3255*oversampling_rate)
    {
        int i = -1;
        while (temptable_11[++i][0] < volt);
        if (volt != temptable_11[i][0])
        {
            float k = (float)((int)(volt - temptable_11[i][0]))/(int)((temptable_11[i-1][0] - temptable_11[i][0]));
            return (round(temptable_11[i][1] + (temptable_11[i-1][1] - temptable_11[i][1])*k));
        }
        else return temptable_11[i][1];
    }
    return 0;
}

void MechanicsController::move(int32_t da, int32_t db, int32_t dz, uint32_t sa, uint32_t sb, uint32_t sz, int32_t &ra,
                               int32_t &rb, int32_t &rz) {
    *addr_stepper_1_speed = sa;
    *addr_stepper_2_speed = sb;
    *addr_stepper_3_speed = sz;
    *addr_stepper_4_speed = 0;

    *addr_stepper_1_steps_in = da;
    *addr_stepper_2_steps_in = db;
    *addr_stepper_3_steps_in = dz;
    *addr_stepper_4_steps_in = 0;

    set_flags_in_start_driving_state(true);
    usleep(100);

    int k = 0;
    while (get_flags_out_stepper_state() || (k<100))
    {

        printer->update_parameters();
        printer->screen.update();
        int i = 0;
        while(i<100 && k<100)
        {
            usleep(1000);
            if (!get_flags_out_stepper_state())
                k = k + 1;
            else
                k = 0;
            i++;
        }
    }
    set_flags_in_start_driving_state(false);

    usleep(2);

    ra = *addr_stepper_1_steps_out;
    rb = *addr_stepper_2_steps_out;
    rz = *addr_stepper_3_steps_out;

    *addr_stepper_1_speed = 0;
    *addr_stepper_2_speed = 0;
    *addr_stepper_3_speed = 0;
    *addr_stepper_4_speed = 0;

    *addr_stepper_1_steps_in = 0;
    *addr_stepper_2_steps_in = 0;
    *addr_stepper_3_steps_in = 0;
    *addr_stepper_4_steps_in = 0;
}

void MechanicsController::move_extrude(int32_t da, int32_t db, int32_t dz, int32_t de, uint32_t sa, uint32_t sb,
                                       uint32_t sz, uint32_t se, int32_t &ra, int32_t &rb, int32_t &rz, int32_t &re)
{
    *addr_stepper_1_speed = sa;
    *addr_stepper_2_speed = sb;
    *addr_stepper_3_speed = sz;
    *addr_stepper_4_speed = se;

    *addr_stepper_1_steps_in = da;
    *addr_stepper_2_steps_in = db;
    *addr_stepper_3_steps_in = dz;
    *addr_stepper_4_steps_in = de;

    set_flags_in_start_driving_state(true);
    usleep(100);

    int k = 0;
    while (get_flags_out_stepper_state() || (k<100))
    {

        printer->update_parameters();
        printer->screen.update();
        int i = 0;
        while(i<100 && k<100)
        {
            usleep(1000);
            if (!get_flags_out_stepper_state())
                k = k + 1;
            else
                k = 0;
            i++;
        }
    }

    set_flags_in_start_driving_state(false);

    usleep(2);

    ra = *addr_stepper_1_steps_out;
    rb = *addr_stepper_2_steps_out;
    rz = *addr_stepper_3_steps_out;
    re = *addr_stepper_4_steps_out;

    *addr_stepper_1_speed = 0;
    *addr_stepper_2_speed = 0;
    *addr_stepper_3_speed = 0;
    *addr_stepper_4_speed = 0;

    *addr_stepper_1_steps_in = 0;
    *addr_stepper_2_steps_in = 0;
    *addr_stepper_3_steps_in = 0;
    *addr_stepper_4_steps_in = 0;
}

void MechanicsController::auto_home(bool x, bool y, bool z) {
    set_flags_in_homex(x);
    set_flags_in_homey(y);
    set_flags_in_homez(z);

    //надо подправить, т.к. нет скорости
    *addr_stepper_1_speed = uint32_t(abs(frequency / (((fmin(maxspeed, HOMING_FEEDRATE_XY))*DEFAULT_AXIS_STEPS_PER_UNIT[0]) / 60)));
    *addr_stepper_2_speed = uint32_t(abs(frequency / (((fmin(maxspeed, HOMING_FEEDRATE_XY))*DEFAULT_AXIS_STEPS_PER_UNIT[1]) / 60)));
    *addr_stepper_3_speed = uint32_t(abs(frequency / (((fmin(maxspeed, HOMING_FEEDRATE_Z))*DEFAULT_AXIS_STEPS_PER_UNIT[2]) / 60)));

    set_flags_in_start_homing_state(true);

    usleep(100);

    int k = 0;
    while (get_flags_out_stepper_state() || (k<100))
    {

        printer->update_parameters();
        printer->screen.update();
        int i = 0;
        while(i<100 && k<100)
        {
            usleep(1000);
            if (!get_flags_out_stepper_state())
                k = k + 1;
            else
                k = 0;
            i++;
        }
    }

    set_flags_in_start_homing_state(false);

    usleep(20);

    *addr_stepper_1_speed = 0;
    *addr_stepper_2_speed = 0;
    *addr_stepper_3_speed = 0;
}

void MechanicsController::enable_steppers() {
    set_flags_in_stepper_enabled(true);
}

void MechanicsController::disable_steppers() {
    set_flags_in_stepper_enabled(false);
}

void MechanicsController::set_hotend_temperature(int32_t t) {
    set_flags_in_heat_extruder_hold(false);
    set_flags_in_heat_extruder(false);
    set_temp_e1_upper(voltage_adc(t));
    set_flags_in_heat_extruder(true);
}

void MechanicsController::wait_hotend_temperature(int32_t t) {
    set_flags_in_heat_extruder(false);
    set_flags_in_heat_extruder_hold(false);
    set_temp_e1_bottom(voltage_adc(t - TEMP_DELTA));
    set_temp_e1_upper(voltage_adc(t));
    set_flags_in_heat_extruder_hold(true);
    usleep(2);
    while (get_flags_out_heating_extruder())
    {
        printer->update_parameters();
        printer->screen.update();
    }
}

void MechanicsController::set_bed_temperature(int32_t t) {
    set_flags_in_heat_bed_hold(false);
    set_flags_in_heat_bed(false);
    set_temp_bed_upper(voltage_adc(t));
    set_flags_in_heat_bed(true);
}

void MechanicsController::wait_bed_temperature(int32_t t) {
    set_flags_in_heat_bed(false);
    set_flags_in_heat_bed_hold(false);
    set_temp_bed_bottom(voltage_adc(t - TEMP_DELTA));
    set_temp_bed_upper(voltage_adc(t));
    set_flags_in_heat_bed_hold(true);
    usleep(2);
    while (get_flags_out_heating_bed())
    {
        printer->update_parameters();
        printer->screen.update();
    }
}
