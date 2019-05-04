#include "PrinterController.h"

#include <tuple>

PrinterController::PrinterController() {
    mechanics.printer = this;
    screen.printer = this;
    state = Waiting;
    waiting();
}

void PrinterController::main_loop() {
    while (state != ShuttingDown) {
        if (state == Waiting) {
            waiting();
        } else if (state == Slicing) {
            slicing();
        } else if (state == Printing) {
            printing();
        }
    }
}

void PrinterController::waiting() {
    // state == Waiting
    // работа с экраном: обратобать события экрана

    // экран может изменять состояния принтера
}

void PrinterController::slicing() {
    // state == Slicing
}

void PrinterController::printing() {
    // state == Printing
    gcodeParser parser(to_print);
    while (!parser.is_done() && state != Stop_Printing) {
        string command;
        Parameters parameters;
        tie(command, parameters) = parser.parse_command();

        if (gcode_commands.find(command)) {
            (this->*gcode_commands[command])(parameters);
            // auto error = (this->*gcode_commands[command])(parameters);
            // далее обработка ошибки
        } else {
            // передать на экран ошибку
        }

        // передать на экран кол-во пройденных комманд
        // обратобать события экрана

        while (state == Pause_Printing) {
            // обратобать события экрана
        }
    }

    // если parser.is_done то все хорошо
    // иначе печать завершилась аварийно
}