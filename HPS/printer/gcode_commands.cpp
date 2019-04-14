#include "PrinterController.h"

void PrinterController::calc_steps_speed(float dx, float dy, float dz, float de,
                      uint32_t& speed_a, uint32_t& speed_b, uint32_t& speed_z, uint32_t& speed_e,
                      int32_t& steps_a, int32_t& steps_b, int32_t& steps_z, int32_t& steps_e) {
    //TODO: написать функцию
}

void PrinterController::correction(int a_numofmicrosteps, int b_numofmicrosteps, int z_numofmicrosteps,
                                   int e_numofmicrosteps, float &dx, float &dy, float &dz, float &de)
{
    da = a_numofmicrosteps * rotlength / stepsperrot / microsteps;
    db = b_numofmicrosteps * rotlength / stepsperrot / microsteps;
    dx = (da + db) / 2;
    dy = (da - db) / 2;
    de = e_numofmicrosteps * rotlength / stepsperrot / microsteps;
    dl = z_numofmicrosteps * rotlength / stepsperrot / microsteps;
    dz = dl * h / circlelength;
}

int32_t PrinterController::voltage_adc(int32_t temp)
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

int32_t PrinterController::temperature_adc(int32_t volt)
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

void PrinterController::gcode_G0(const Parameters& parameters) {
    gcode_G1(parameters);
}

void PrinterController::gcode_G1(const Parameters& parameters) {

    float dx = 0, dy = 0, dz = 0, de = 0;
    if (parameters.find('F'))
        position.s = parameters['F'];
    if (position.xyz_type == Absolute) {
        if (parameters.find('X')) {
            dx = parameters['X'] - position.x;
        }
        if (parameters.find('Y')) {
            dy = parameters['Y'] - position.y;
        }
        if (parameters.find('Z')) {
            dz = parameters['Z'] - position.z;
        }
        if (parameters.find('E')) {
            de = parameters['E'] - position.e;
        }
    } else {
        if (parameters.find('X')) {
            dx = parameters['X'];
        }
        if (parameters.find('Y')) {
            dy = parameters['Y'];
        }
        if (parameters.find('Z')) {
            dz = parameters['Z'];
        }
        if (parameters.find('E')) {
            de = parameters['E'];
        }
    }

    // каретка не может уйти в минус по координатам
    if (position.x + dx < 0)
        dx = 0 - position.x;
    if (position.y + dy < 0)
        dy = 0 - position.y;
    if (position.z + dz < 0)
        dz = 0 - position.z;

    position.x += dx;
    position.y += dy;
    position.z += dz;
    position.e += de;


    int32_t steps_a, steps_b, steps_z, steps_e;
    uint32_t speed_a, speed_b, speed_z, speed_e;
    int32_t ra, rb, rz, re;

    calc_steps_speed(dx, dy, dz, de, speed_a, speed_b, speed_z, speed_e, steps_a, steps_b, steps_z, steps_e);

    mechanics.move_extrude(steps_a, steps_b, steps_z, steps_e, speed_a, speed_b, speed_z, speed_e,
                            ra, rb, rz, re);

    correction(  ra, rb, rz, re,
                 dx, dy, dz, de);

    position.x -= dx;
    position.y -= dy;
    position.z -= dz;
    position.e -= de;
    bool xmin, xmax, ymin, ymax, zmin, zmax;
    mechanics.get_endstops(xmin, xmax, ymin, ymax, zmin, zmax);
    if (xmin)
        position.x = 0;
    if (ymin)
        position.y = 0;
    if (zmin)
        position.z = 0;
}

void PrinterController::gcode_G4(const Parameters &parameters) {
    if (parameters.find('S')) {
        sleep(parameters['S']);
    } else
    {
        if (parameters.find('P')) {
            usleep(parameters['P']);
        }
    }
}

void PrinterController::gcode_G28(const Parameters& parameters) {
    if (parameters.find('F'))
        position.s = parameters['F'];

    auto_home(parameters.find('X'), parameters.find('Y'), parameters.find('Z'));

    if (parameters.find('X'))
        position.x = 0;
    if (parameters.find('Y'))
        position.y = 0;
    if (parameters.find('Z'))
        position.z = 0;
}

void PrinterController::gcode_G90(const Parameters& parameters) {
    position.xyz_type = Absolute;
}

void PrinterController::gcode_G91(const Parameters& parameters){
    position.xyz_type = Relative;
}

void PrinterController::gcode_G92(const Parameters& parameters) {
    if (parameters.find('X'))
        position.x = parameters['X'];
    if (parameters.find('Y'))
        position.y = parameters['Y'];
    if (parameters.find('Z'))
        position.z = parameters['Z'];
    if (parameters.find('E'))
        position.e = parameters['E'];
}

void PrinterController::gcode_M17(const Parameters& parameters) {

}

void PrinterController::gcode_M18(const Parameters& parameters) {

}

void PrinterController::gcode_M82(const Parameters& parameters) {
    position.extruder_type = Absolute;
}

void PrinterController::gcode_M83(const Parameters& parameters) {
    position.extruder_type = Relative;
}

void PrinterController::gcode_M104(const Parameters& parameters) {

}

void PrinterController::gcode_M109(const Parameters& parameters) {

}

void PrinterController::gcode_M140(const Parameters& parameters) {

}

void PrinterController::gcode_M190(const Parameters& parameters) {

}
