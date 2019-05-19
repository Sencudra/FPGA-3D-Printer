#include "PrinterController.h"

void PrinterController::calc_steps_speed(float dx, float dy, float dz, float de,
                      uint32_t& speed_a, uint32_t& speed_b, uint32_t& speed_z, uint32_t& speed_e,
                      int32_t& steps_a, int32_t& steps_b, int32_t& steps_z, int32_t& steps_e) {

    float da = dx + dy; //расстояние, которое должен обработать двигатель a системы core xy
    float db = dx - dy; //расстояние, которое должен обработать двигатель b системы core xy

    //необходимое для движения количество микрошагов = число оборотов * количество микрошагов за оборот
    steps_a = (int32_t) round(da * DEFAULT_AXIS_STEPS_PER_UNIT[0]);
    steps_b = (int32_t) round(db * DEFAULT_AXIS_STEPS_PER_UNIT[1]);
    steps_e = (int32_t) round(de * DEFAULT_AXIS_STEPS_PER_UNIT[3]);
    steps_z = (int32_t) round(dz * DEFAULT_AXIS_STEPS_PER_UNIT[2]);

    //подсчет макс расстояния в микрошагах для опреодоления общего времени
    //позволяет настроить скорость и время для единовременного завершения работы двигателей
    float max = abs(steps_z);
    float speed = fmin(maxspeed, settings.position.s);
    float speedz = fmin(maxspeed_z, settings.position.s);
    float speede = fmin(maxspeed_e, settings.position.s);

    float n_speed = speed / 60.0;
    float n_speed_z = speedz / 60.0;
    float n_speed_e = speede / 60.0;

    float t = abs(dz/n_speed_z); //t - общее время при макс скорости в секундах
    if (abs(steps_a) > max)
    {   max = abs(steps_a);
        t = abs(da/n_speed);}
    if (abs(steps_b) > max)
    {   max = abs(steps_b);
        t = abs(db/n_speed);}
    if (abs(steps_e) >= max)
    {   max = abs(steps_e);
        t = abs(de/n_speed_e);}

    //скорость в микрошагах/с
    float a_speed = (steps_a) / t;
    float b_speed = (steps_b) / t;
    float e_speed = (steps_e) / t;
    float z_speed = (steps_z) / t;

    //коэффициент коррекции тактовой частоты по модулю, равный количеству необходимых для движения импульсов
    speed_a = (uint32_t) abs(frequency / a_speed);
    speed_b = (uint32_t) abs(frequency / b_speed);
    speed_e = (uint32_t) abs(frequency / e_speed);
    speed_z = (uint32_t) abs(frequency / z_speed);
}

void PrinterController::correction(int a_numofmicrosteps, int b_numofmicrosteps, int z_numofmicrosteps,
                                   int e_numofmicrosteps, float &dx, float &dy, float &dz, float &de)
{
    float da = a_numofmicrosteps / DEFAULT_AXIS_STEPS_PER_UNIT[0];
    float db = b_numofmicrosteps / DEFAULT_AXIS_STEPS_PER_UNIT[1];
    dx = (da + db) / 2;
    dy = (da - db) / 2;
    de = e_numofmicrosteps / DEFAULT_AXIS_STEPS_PER_UNIT[3];
    dz = z_numofmicrosteps / DEFAULT_AXIS_STEPS_PER_UNIT[2];
}

void PrinterController::gcode_G0(const Parameters& parameters) {
    gcode_G1(parameters);
}

void PrinterController::gcode_G1(const Parameters& parameters) {
    float dx = 0, dy = 0, dz = 0, de = 0;

    if (parameters.find('F'))
        settings.position.s = parameters['F'];
    if (settings.position.xyz_type == Absolute) {
        if (parameters.find('X')) {
            dx = parameters['X'] - settings.position.x;
        }
        if (parameters.find('Y')) {
            dy = parameters['Y'] - settings.position.y;
        }
        if (parameters.find('Z')) {
            dz = parameters['Z'] - settings.position.z;
        }
        if (parameters.find('E')) {
            de = parameters['E'] - settings.position.e;
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
    if (settings.position.x + dx < 0)
        dx = 0.0 - settings.position.x;
    if (settings.position.y + dy < 0)
        dy = 0.0 - settings.position.y;
    if (settings.position.z + dz < 0)
        dz = 0.0 - settings.position.z;

    int32_t steps_a = 0, steps_b = 0, steps_z = 0, steps_e = 0;
    uint32_t speed_a = 0, speed_b = 0, speed_z = 0, speed_e = 0;
    int32_t ra = 0, rb = 0, rz = 0, re = 0;

    calc_steps_speed(dx, dy, dz, de, speed_a, speed_b, speed_z, speed_e, steps_a, steps_b, steps_z, steps_e);

    float ddx = 0, ddy = 0, ddz = 0, dde = 0;

    correction(  steps_a, steps_b, steps_z, steps_e,
                 ddx, ddy, ddz, dde);

    settings.position.x += ddx;
    settings.position.y += ddy;
    settings.position.z += ddz;
    settings.position.e += dde;

    update_parameters();
    screen.update();

    mechanics.move_extrude( steps_a, steps_b, steps_z, steps_e,
                            speed_a, speed_b, speed_z, speed_e,
                            ra, rb, rz, re);

    correction(  ra, rb, rz, re,
                 dx, dy, dz, de);

    if (parameters.find('X')) {
        settings.position.x -= dx;
    }
    if (parameters.find('Y')) {
        settings.position.y -= dy;
    }
    if (parameters.find('Z')) {
        settings.position.z -= dz;
    }
    if (parameters.find('E')) {
        settings.position.e -= de;
    }

    bool xmin, xmax, ymin, ymax, zmin, zmax;
    mechanics.endstop_states(xmin, xmax, ymin, ymax, zmin, zmax);
    if (xmin)
        settings.position.x = 0;
    if (ymin)
        settings.position.y = 0;
    if (zmin)
        settings.position.z = 0;
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
        settings.position.s = parameters['F'];

    mechanics.auto_home(parameters.find('X'), parameters.find('Y'), parameters.find('Z'));

    if (parameters.find('X'))
        settings.position.x = 0;
    if (parameters.find('Y'))
        settings.position.y = 0;
    if (parameters.find('Z'))
        settings.position.z = 0;
    Parameters a = {{'Z', 0.3}};
    gcode_G0(a);
    a = {{'Z', 0}};
    gcode_G92(a);
}

void PrinterController::gcode_G90(const Parameters& parameters) {
    settings.position.xyz_type = Absolute;
}

void PrinterController::gcode_G91(const Parameters& parameters){
    settings.position.xyz_type = Relative;
}

void PrinterController::gcode_G92(const Parameters& parameters) {
    if (parameters.find('X'))
        settings.position.x = parameters['X'];
    if (parameters.find('Y'))
        settings.position.y = parameters['Y'];
    if (parameters.find('Z'))
        settings.position.z = parameters['Z'];
    if (parameters.find('E'))
        settings.position.e = parameters['E'];
}

void PrinterController::gcode_M17(const Parameters& parameters) {
    mechanics.enable_steppers();
}

void PrinterController::gcode_M18(const Parameters& parameters) {
    mechanics.disable_steppers();
}

void PrinterController::gcode_M82(const Parameters& parameters) {
    settings.position.extruder_type = Absolute;
}

void PrinterController::gcode_M83(const Parameters& parameters) {
    settings.position.extruder_type = Relative;
}

void PrinterController::gcode_M104(const Parameters& parameters) {
    if (parameters.find('S')) {
        settings.common.nozzle.set = parameters['S'];
        mechanics.set_hotend_temperature(parameters['S']);
    }
}

void PrinterController::gcode_M109(const Parameters& parameters) {
    if (parameters.find('S'))
        mechanics.wait_hotend_temperature(parameters['S']);
    else
        mechanics.wait_hotend_temperature(settings.common.nozzle.set);
}

void PrinterController::gcode_M140(const Parameters& parameters) {
    if (parameters.find('S')) {
        settings.common.pad.set = parameters['S'];
        mechanics.set_bed_temperature(parameters['S']);
    }
}

void PrinterController::gcode_M190(const Parameters& parameters) {
    if (parameters.find('S'))
        mechanics.wait_bed_temperature(parameters['S']);
    else
        mechanics.wait_bed_temperature(settings.common.pad.set);

}
