#ifndef INC_3D_PRINTER_PRINTERCONTROLLER_H
#define INC_3D_PRINTER_PRINTERCONTROLLER_H

#include <cstring>
#include <cmath>
#include <unistd.h>

#include "Dict.h"
#include "Types.h"
#include "Configuration.h"

#include "MechanicsController.h"
#include "ScreenController.h"
#include "stl2gcode_parameters.h"
#include "FileManager.h"

#include <iostream>
#include <fstream>

using namespace std;

class PrinterController {

    void calc_steps_speed(float dx, float dy, float dz, float de,
            uint32_t& speed_a, uint32_t& speed_b, uint32_t& speed_z, uint32_t& speed_e,
            int32_t& steps_a, int32_t& steps_b, int32_t& steps_z, int32_t& steps_e);
    void correction(int a_numofmicrosteps, int b_numofmicrosteps, int z_numofmicrosteps, int e_numofmicrosteps,
                    float& dx, float& dy, float& dz, float& de);

    //Работа с файлом настроек
    void set_pid(float pid_p, float pid_i, float pid_d);
    void set_preset(PrinterVariables::Common::Preset preset, int temp_nozzle, int temp_pad, int cooler);
    void set_speed(float x, float y, float z, float e);
    void set_max_xyz(float max_x, float max_y, float max_z);

    void get_pid(float& pid_p, float& pid_i, float& pid_d);
    void get_preset(PrinterVariables::Common::Preset preset, int& temp_nozzle, int& temp_pad, int& cooler);
    void get_speed(float& x, float& y, float& z, float& e);
    void get_max_xyz(float& max_x, float& max_y, float& max_z);

public:
    PrinterController();

    MechanicsController mechanics;
    ScreenController screen;
    FileManager fileManager;

    StateType state;
    PrinterVariables settings;
    stl2gcode_parameters stl2GcodeParameters;

    // пути к файлам для слайсинга/печати
    string to_slice;
    string to_print;
    // пути к файлам с настройками/вспомагательным
    const string to_settings = "settings.txt";
    const string extra_set = "temp.txt";

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

    //Методы для вызова с экрана
    void update_parameters(); //Обновить изменяющиеся параметры (температура, статус, др)
    void change_preset_start(PrinterVariables::Common::Preset preset); //Изменить пресет и запустить его
    void setNewPresetValue(PrinterVariables::Common::Preset preset); //Изменить пресет
    void setNewPrecisionValue(PrinterVariables::Common::Precision precision); //Изменить шкалу шага
    void home(); //Выполнить команду home(G28 X0 Y0 Z0)
    void control(DrivingControl d); //Изменить положение каретки
    void pause_printing();
    void block_screen();
    void abort_printing();
    void start_slicing(string path);
    void start_printing(string path);
    void print_settings(SlicingParameters sp);

    //Settings.General
    void change_general_settings(int sg); //PreprintSetup and SettingsPID
    void save_general_settings();
    void restore_default_general_settings();

    //Settings.preprint
    void change_preset_settings(PreprintSetup ps);
    void save_preset_settings();
    void restore_default_preset_settings();

    //Settings.Movement.Speed
    void change_movement_speed(SpeedSettings ps);
    void save_movement_speed();
    void restore_default_movement_speed();

    //Settings.Movement.Steps
    void change_movement_steps(StepsSettings ps);
    void save_movement_steps();
    void restore_default_movement_steps();

    void restore_default_presets();
    
};

#endif //INC_3D_PRINTER_PRINTERCONTROLLER_H