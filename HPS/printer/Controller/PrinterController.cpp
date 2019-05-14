#include <tuple>
#include <chrono>

#include "PrinterController.h"
#include "GCodeParser.h"
#include "stl2gcode.h"

PrinterController::PrinterController() {
    mechanics.printer = this;
    screen.printer = this;

    //Считывание настроек экрана из файла
    restore_default_general_settings();
    restore_default_preset_settings();
    restore_default_movement_speed();
    restore_default_movement_steps();

    screen.initialise();

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
    //usleep(100000);
    update_parameters();
    screen.update();
    // экран может изменять состояния принтера
}

void PrinterController::slicing() {
    // state == Slicing
    // to_slice - путь к stl файлу
    stl2gcode stl2Gcode(to_slice, stl2GcodeParameters);
    to_print = to_slice.substr(0, to_slice.length() - 3) + "gcode";
    stl2Gcode.convert(to_print);
    state = Printing;
}

void PrinterController::printing() {
    // state == Printing
    gcodeParser parser(to_print);
    while ((!parser.is_done()) && (state != Stop_Printing)) {
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

        settings.common.processBar = parser.get_command_percentage();// передать на экран кол-во пройденных комманд
        update_parameters();
        screen.update();
        // обратобать события экрана

        while (state == Pause_Printing) {
            // обратобать события экрана
            screen.update();
        }
        
    }

    // Переключение на PRINTING_DONE
    screen.setCurrentScreen(ScreenController::Screen::PRINTING_DONE);

    state = Waiting;
    if (parser.is_done())
        settings.common.infoLine = PrinterVariables::Common::IDLE;
    else
        settings.common.infoLine = PrinterVariables::Common::ERROR; //TODO: изменить на нужный
    // если parser.is_done то все хорошо
    // иначе печать завершилась аварийно
}