#ifndef INC_3D_PRINTER_PRINTERCONTROLLER_H
#define INC_3D_PRINTER_PRINTERCONTROLLER_H

#include <string>

#include "../screen/ScreenController.h"
#include "../mechanics/MechanicsController.h"
#include "dict.h"
#include "types.h"
#include "gcodeParser.h"

using namespace std;

class PrinterController {
public:
    PrinterController();

    MechanicsController mechanics;
    ScreenController screen;

    StateType state;
    Position position;

    // пути к файлам для слайсинга/печати
    string to_slice;
    string to_print;


    void main_loop();
    // методы отвечающие за состояния
    void waiting();
    void slicing();
    void printing();


    // список необходимых gcode комманд
    // сейчас функции возвращаю void, но потом должны возращать код ошибки
    void gcode_G0(const Parameters& parameters);
    void gcode_G1(const Parameters& parameters);
    void gcode_G4(const Parameters& parameters);
    void gcode_G28(const Parameters& parameters);
    void gcode_G90(const Parameters& parameters);
    void gcode_G91(const Parameters& parameters);
    void gcode_G92(const Parameters& parameters);
    void gcode_M17(const Parameters& parameters);
    void gcode_M18(const Parameters& parameters);
    void gcode_M82(const Parameters& parameters);
    void gcode_M83(const Parameters& parameters);
    void gcode_M104(const Parameters& parameters);
    void gcode_M109(const Parameters& parameters);
    void gcode_M140(const Parameters& parameters);
    void gcode_M190(const Parameters& parameters);


    dict<string, void(PrinterController::*)(const Parameters&)> gcode_commands = {
            {"G0", &PrinterController::gcode_G0},
            {"G1", &PrinterController::gcode_G1},
            {"G4", &PrinterController::gcode_G4},
            {"G28", &PrinterController::gcode_G28},
            {"G90", &PrinterController::gcode_G90},
            {"G91", &PrinterController::gcode_G91},
            {"G92", &PrinterController::gcode_G92},
            {"M17", &PrinterController::gcode_M17},
            {"M18", &PrinterController::gcode_M18},
            {"M82", &PrinterController::gcode_M82},
            {"M83", &PrinterController::gcode_M83},
            {"M104", &PrinterController::gcode_M104},
            {"M109", &PrinterController::gcode_M109},
            {"M140", &PrinterController::gcode_M140},
            {"M190", &PrinterController::gcode_M190},
    };

};


#endif //INC_3D_PRINTER_PRINTERCONTROLLER_H
