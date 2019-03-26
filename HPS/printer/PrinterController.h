#ifndef INC_3D_PRINTER_PRINTERCONTROLLER_H
#define INC_3D_PRINTER_PRINTERCONTROLLER_H

#include <string>

#include "../screen/ScreenController.h"
#include "../mechanics/MechanicsController.h"
#include "dict.h"
#include "gcodeParser.h"

using namespace std;


class PrinterController {

public:
    enum StateType {Waiting, Slicing, Printing, Pause_Printing, Stop_Printing, ShuttingDown};

    MechanicsController mechanics;
    ScreenController screen;

    StateType state;

    // пути к файлам для слайсинга/печати
    string to_slice;
    string to_print;


    PrinterController();

    void main_loop();
    // методы отвечающие за состояния
    void waiting();
    void slicing();
    void printing();


    // список необходимых gcode комманд
    typedef dict<char, float> Parameters;
    void gcode_G0(const Parameters& parameters);
    void gcode_G1(const Parameters& parameters);

    dict<string, void(PrinterController::*)(const Parameters&)> gcode_commands_index = {
            {"G0", &PrinterController::gcode_G0},
            {"G1", &PrinterController::gcode_G1}
    };

};


#endif //INC_3D_PRINTER_PRINTERCONTROLLER_H
