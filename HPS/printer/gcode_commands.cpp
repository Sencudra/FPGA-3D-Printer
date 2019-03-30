#include "PrinterController.h"

void PrinterController::gcode_G0(const Parameters& parameters) {

}

void PrinterController::gcode_G1(const Parameters& parameters) {

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
