#include "MechanicsController.h"

void MechanicsController::move(int32_t da, int32_t db, int32_t dz, uint32_t sa, u_int32_t sb, uint32_t sz, int32_t &ra,
                               int32_t &rb, int32_t &rz) {
    /*addr->set_stepper_1_speed(speed1);
    addr->set_stepper_2_speed(speed2);
    addr->set_stepper_3_speed(speed3);
    addr->set_stepper_4_speed(0);
    addr->set_stepper_1_steps_in(steps_count1);
    addr->set_stepper_2_steps_in(steps_count2);
    addr->set_stepper_3_steps_in(steps_count3);
    addr->set_stepper_4_steps_in(0);

    addr->set_flags_in_start_driving_state(true);
    while (addr->get_flags_out_stepper_state());
    addr->set_flags_in_start_driving_state(false);

    usleep(2);

    ra = addr->get_stepper_1_steps_out();
    rb = addr->get_stepper_2_steps_out();
    rz = addr->get_stepper_3_steps_out();

    addr->set_stepper_1_speed(0);
    addr->set_stepper_2_speed(0);
    addr->set_stepper_3_speed(0);

    addr->set_stepper_1_steps_in(0);
    addr->set_stepper_2_steps_in(0);
    addr->set_stepper_3_steps_in(0);*/
}

void MechanicsController::move_extrude(int32_t da, int32_t db, int32_t dz, int32_t de, uint32_t sa, uint32_t sb,
                                       uint32_t sz, uint32_t se, int32_t &ra, int32_t &rb, int32_t &rz, int32_t &re)
{

    /*addr->set_stepper_1_speed(speed1);
    addr->set_stepper_2_speed(speed2);
    addr->set_stepper_3_speed(speed3);
    addr->set_stepper_4_speed(speed4);
    addr->set_stepper_1_steps_in(steps_count1);
    addr->set_stepper_2_steps_in(steps_count2);
    addr->set_stepper_3_steps_in(steps_count3);
    addr->set_stepper_4_steps_in(steps_count4);

    addr->set_flags_in_start_driving_state(true);
    while (addr->get_flags_out_stepper_state());

    addr->set_flags_in_start_driving_state(false);

    usleep(2);

    ra = addr->get_stepper_1_steps_out();
    rb = addr->get_stepper_2_steps_out();
    rz = addr->get_stepper_3_steps_out();
    re = addr->get_stepper_4_steps_out();

    addr->set_stepper_1_speed(0);
    addr->set_stepper_2_speed(0);
    addr->set_stepper_3_speed(0);
    addr->set_stepper_4_speed(0);

    addr->set_stepper_1_steps_in(0);
    addr->set_stepper_2_steps_in(0);
    addr->set_stepper_3_steps_in(0);
    addr->set_stepper_4_steps_in(0);*/
}

void MechanicsController::auto_home(bool x, bool y, bool z) {
  /*  addr->set_flags_in_homex(x);
    addr->set_flags_in_homey(y);
    addr->set_flags_in_homez(z);

    //надо подправить, т.к. нет скорости
    addr->set_stepper_1_speed(((min(maxspeed, pos->get_pos_speed()))*stepsperrot*microsteps/rotlength)/60);
    addr->set_stepper_2_speed(((min(maxspeed, pos->get_pos_speed()))*stepsperrot*microsteps/rotlength)/60);
    addr->set_stepper_3_speed(((min(maxspeed, pos->get_pos_speed()))*stepsperrot*microsteps/rotlength)/60);

    addr->set_flags_in_start_homing_state(true);

    usleep(2);

    while (addr->get_flags_out_stepper_state());

    addr->set_flags_in_start_homing_state(false);

    usleep(2);

    addr->set_stepper_1_speed(0);
    addr->set_stepper_2_speed(0);
    addr->set_stepper_3_speed(0);*/
}

void MechanicsController::enable_steppers() {
//    addr->set_flags_in_stepper_enabled(true);
}

void MechanicsController::disable_steppers() {
//    addr->set_flags_in_stepper_enabled(false);
}

void MechanicsController::set_hotend_temperature(int32_t t) {
    /*addr->set_flags_in_heat_extruder_hold(false);
    addr->set_flags_in_heat_extruder(false);
    addr->set_temp_e1_upper(voltage_adc(temp));
    addr->set_flags_in_heat_extruder(true);*/
}

void MechanicsController::wait_hotend_temperature(int32_t t) {
    /*addr->set_flags_in_heat_extruder(false);
    addr->set_flags_in_heat_extruder_hold(false);
    addr->set_temp_e1_bottom(voltage_adc(temp - TEMP_DELTA));
    addr->set_temp_e1_upper(voltage_adc(temp + TEMP_DELTA));
    addr->set_flags_in_heat_extruder_hold(true);
    usleep(2);
    while (addr->get_flags_out_heating_extruder());*/
}

void MechanicsController::set_bed_temperature(int32_t t) {
    /*addr->set_flags_in_heat_bed_hold(false);
    addr->set_flags_in_heat_bed(false);
    addr->set_temp_bed_upper(voltage_adc(temp));
    addr->set_flags_in_heat_bed(true);*/
}

void MechanicsController::wait_bed_temperature(int32_t t) {
    /*addr->set_flags_in_heat_bed(false);
    addr->set_flags_in_heat_bed_hold(false);
    addr->set_temp_bed_bottom(voltage_adc(temp - TEMP_DELTA));
    addr->set_temp_bed_upper(voltage_adc(temp + TEMP_DELTA));
    addr->set_flags_in_heat_bed_hold(true);
    usleep(2);
    while (addr->get_flags_out_heating_bed());*/
}
