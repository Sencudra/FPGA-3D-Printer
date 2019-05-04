#include "PrinterController.h"

void PrinterController::calc_steps_speed(float dx, float dy, float dz, float de,
                      uint32_t& speed_a, uint32_t& speed_b, uint32_t& speed_z, uint32_t& speed_e,
                      int32_t& steps_a, int32_t& steps_b, int32_t& steps_z, int32_t& steps_e) {
    float diag; //гипотенуза, относительно которой высчитывается общее время для x и y
    float da = dx + dy; //расстояние, которое должен обработать двигатель a системы core xy
    float db = dx - dy; //расстояние, которое должен обработать двигатель b системы core xy
    diag = sqrt(dx * dx + dy * dy);
    float dl = dz / h * circlelength; //расстояние, которое должен обработать двигатель на оси z

    //необходимое для движения количество микрошагов = число оборотов * количество микрошагов за оборот
    steps_a = trunc(da / rotlength * stepsperrot * microsteps);
    steps_b = trunc(db / rotlength * stepsperrot * microsteps);
    steps_e = trunc(de / rotlength * stepsperrot * microsteps);
    steps_z = trunc(dl / rotlength * stepsperrot * microsteps);

    //подсчет макс расстояния в микрошагах для опреодоления общего времени
    //позволяет настроить скорость и время для единовременного завершения работы двигателей
    float max = abs(steps_z);
    float speed = fmin(maxspeed, position.s);
    speed = floor(speed/60);
    float t = abs(dl/speed); //t - общее время при макс скорости в секундах
    if (abs(steps_a) > max)
    {   max = abs(steps_a);
        t = abs(da/speed);}
    if (abs(steps_b) > max)
    {   max = abs(steps_b);
        t = abs(db/speed);}
    if (abs(steps_e) >= max)
    {   max = abs(steps_e);
        t = abs(de/speed);}

    //скорость в микрошагах/с
    float a_speed = (steps_a)/t;
    float b_speed = (steps_b)/t;
    float e_speed = (steps_e)/t;
    float z_speed = (steps_z)/t;

    //коэффициент коррекции тактовой частоты по модулю, равный количеству необходимых для движения импульсов
    speed_a = ceil(abs(frequency / a_speed));
    speed_b = ceil(abs(frequency / b_speed));
    speed_e = ceil(abs(frequency / e_speed));
    speed_z = ceil(abs(frequency / z_speed));
}

void PrinterController::correction(int a_numofmicrosteps, int b_numofmicrosteps, int z_numofmicrosteps,
                                   int e_numofmicrosteps, float &dx, float &dy, float &dz, float &de)
{
    float da = a_numofmicrosteps * rotlength / stepsperrot / microsteps;
    float db = b_numofmicrosteps * rotlength / stepsperrot / microsteps;
    dx = (da + db) / 2;
    dy = (da - db) / 2;
    de = e_numofmicrosteps * rotlength / stepsperrot / microsteps;
    float dl = z_numofmicrosteps * rotlength / stepsperrot / microsteps;
    dz = dl * h / circlelength;
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
    mechanics.endstop_states(xmin, xmax, ymin, ymax, zmin, zmax);
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

    mechanics.auto_home(parameters.find('X'), parameters.find('Y'), parameters.find('Z'));

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
    mechanics.enable_steppers();
}

void PrinterController::gcode_M18(const Parameters& parameters) {
    mechanics.disable_steppers();
}

void PrinterController::gcode_M82(const Parameters& parameters) {
    position.extruder_type = Absolute;
}

void PrinterController::gcode_M83(const Parameters& parameters) {
    position.extruder_type = Relative;
}

void PrinterController::gcode_M104(const Parameters& parameters) {
    if (parameters.find('S')) {
        position.temp_e0 = parameters['S'];
        mechanics.set_hotend_temperature(parameters['S']);
    }
}

void PrinterController::gcode_M109(const Parameters& parameters) {
    if (parameters.find('S'))
        mechanics.wait_hotend_temperature(parameters['S']);
    else
        mechanics.wait_hotend_temperature(position.temp_e0);
}

void PrinterController::gcode_M140(const Parameters& parameters) {
    if (parameters.find('S'))
        position.temp_bed = parameters['S'];
        mechanics.set_bed_temperature(parameters['S']);
}

void PrinterController::gcode_M190(const Parameters& parameters) {
    //температура необязательная. Исправить
    if (parameters.find('S'))
        mechanics.wait_bed_temperature(parameters['S']);
    else
        mechanics.wait_bed_temperature(position.temp_bed);
}