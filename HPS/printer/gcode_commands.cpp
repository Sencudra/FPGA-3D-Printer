#include "PrinterController.h"

void PrinterController::calc_steps_speed(float dx, float dy, float dz, float de,
                      uint32_t& speed_a, uint32_t& speed_b, uint32_t& speed_z, uint32_t& speed_e,
                      int32_t& steps_a, int32_t& steps_b, int32_t& steps_z, int32_t& steps_e) {
    //TODO: написать функцию
}

void PrinterController::gcode_G0(const Parameters& parameters) {

}

void PrinterController::gcode_G1(const Parameters& parameters) {
    float dx = 0, dy = 0, dz = 0, de = 0;
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

    int32_t steps_a, steps_b, steps_z, steps_e;
    uint32_t speed_a, speed_b, speed_z, speed_e;
    calc_steps_speed(dx, dy, dz, de, speed_a, speed_b, speed_z, speed_e, steps_a, steps_b, steps_z, steps_e);

    mechanics.move_extrude(steps_a, steps_b, steps_z, steps_e, speed_a, speed_b, speed_z, speed_e);
    // sleep
    // TODO: и так далее
}

void PrinterController::gcode_G4(const Parameters &parameters) {

}

void PrinterController::gcode_G28(const Parameters& parameters) {

}

void PrinterController::gcode_G90(const Parameters& parameters) {
    position.xyz_type = Absolute;
}

void PrinterController::gcode_G91(const Parameters& parameters){
    position.xyz_type = Relative;
}

void PrinterController::gcode_G92(const Parameters& parameters) {

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
