#include "PrinterController.h"

void PrinterController::update_parameters()
{
    settings.common.nozzle.current     = mechanics.get_temp0();
    settings.common.nozzle.set         = position.temp_e0;
    settings.common.nozzle.isEnabled   = mechanics.get_flags_out_heating_extruder();

    settings.common.pad.current        = mechanics.get_temp_bed();
    settings.common.pad.set            = position.temp_bed;
    settings.common.pad.isEnabled      = mechanics.get_flags_out_heating_bed();

    settings.common.cooler.current    = 0;
    settings.common.cooler.set        = position.cooler;
    settings.common.cooler.isEnabled  = false;
}

void PrinterController::set_max_xyz(float max_x, float max_y, float max_z) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    int i = 0;
    bool settings_found = false;
    while (getline(f, line) && !settings_found) {
        i++;
        if (line.find("max_xyz") != string::npos) {
            settings_found = true;
            getline(f, line);
            ofstream temp;
            temp.open(to_settings);
            f.seekg(0, f.beg);
            for(int j = 0; j < i; j++) {
                getline(f, line);
                temp << line << endl;
            }
            temp << max_x <<endl;
            temp << max_y <<endl;
            temp << max_z <<endl;
            for(int j = 0; j < 3; j++) getline(f, line);
            while(!f.eof()) {
                getline(f, line);
                temp << line;
                if(!f.eof()) temp << endl;
            }
            f.clear();
            ifstream temp_read;
            temp_read.open(to_settings);
            ofstream test_write;
            test_write.open(to_settings);
            while(!temp_read.eof()) {
                temp_read >> line;
                test_write << line;
                if(!temp_read.eof()) test_write << endl;
            }

        }
    }
}

void PrinterController::set_preset(PrinterVariables::Common::Preset preset, int temp_nozzle, int temp_pad, int cooler) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    int i = 13 + preset*4 + 1;
    for(int j = 0; j<i; j++) getline(f, line);
    ofstream temp;
    temp.open(to_settings);
    f.seekg(0, f.beg);
    for(int j = 0; j < i; j++) {
        getline(f, line);
        temp << line << endl;
    }
    temp << temp_nozzle <<endl;
    temp << temp_pad <<endl;
    temp << cooler <<endl;
    for(int j = 0; j < 3; j++) getline(f, line);
    while(!f.eof()) {
        getline(f, line);
        temp << line;
        if(!f.eof()) temp << endl;
    }
    f.clear();
    ifstream temp_read;
    temp_read.open(to_settings);
    ofstream test_write;
    test_write.open(to_settings);
    while(!temp_read.eof()) {
        temp_read >> line;
        test_write << line;
        if (!temp_read.eof()) test_write << endl;
    }
}

void PrinterController::set_speed(float x, float y, float z, float e) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    int i = 0;
    bool settings_found = false;
    while (getline(f, line) && !settings_found) {
        i++;
        if (line.find("speed") != string::npos) {
            settings_found = true;
            getline(f, line);
            ofstream temp;
            temp.open(to_settings);
            f.seekg(0, f.beg);
            for (int j = 0; j < i; j++) {
                getline(f, line);
                temp << line << endl;
            }
            temp << x << endl;
            temp << y << endl;
            temp << z << endl;
            temp << e << endl;
            for (int j = 0; j < 4; j++) getline(f, line);
            while (!f.eof()) {
                getline(f, line);
                temp << line;
                if (!f.eof()) temp << endl;
            }
            f.clear();
            ifstream temp_read;
            temp_read.open(to_settings);
            ofstream test_write;
            test_write.open(to_settings);
            while (!temp_read.eof()) {
                temp_read >> line;
                test_write << line;
                if (!temp_read.eof()) test_write << endl;
            }
        }
    }
}

void PrinterController::set_pid(float pid_p, float pid_i, float pid_d) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    int i = 0;
    bool settings_found = false;
    while (getline(f, line) && !settings_found) {
        i++;
        if (line.find("pid") != string::npos) {
            settings_found = true;
            getline(f, line);
            ofstream temp;
            temp.open(to_settings);
            f.seekg(0, f.beg);
            for(int j = 0; j < i; j++) {
                getline(f, line);
                temp << line << endl;
            }
            temp << pid_p <<endl;
            temp << pid_i <<endl;
            temp << pid_d <<endl;
            for(int j = 0; j < 3; j++) getline(f, line);
            while(!f.eof()) {
                getline(f, line);
                temp << line;
                if(!f.eof()) temp << endl;
            }
            f.clear();
            ifstream temp_read;
            temp_read.open(to_settings);
            ofstream test_write;
            test_write.open(to_settings);
            while(!temp_read.eof()) {
                temp_read >> line;
                test_write << line;
                if(!temp_read.eof()) test_write << endl;
            }
        }
    }
}

void PrinterController::get_preset(PrinterVariables::Common::Preset preset, int& temp_nozzle, int& temp_pad, int& cooler) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    int i = 13 + preset*4 + 1;
    for(int j = 0; j<i; j++) getline(f, line);
    getline(f, line);
    temp_nozzle = stoi(line);
    getline(f, line);
    temp_pad = stoi(line);
    getline(f, line);
    cooler = stoi(line);
}

void PrinterController::get_max_xyz(float& max_x, float& max_y, float& max_z) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    bool settings_found = false;
    while (getline(f, line) && !settings_found) {
        if (line.find("max_xyz") != string::npos) {
            settings_found = true;
            getline(f, line);
            max_x = stof(line);
            getline(f, line);
            max_y = stof(line);
            getline(f, line);
            max_z = stof(line);
        }
    }
}

void PrinterController::get_pid(float& pid_p, float& pid_i, float& pid_d) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    bool settings_found = false;
    while (getline(f, line) && !settings_found) {
        if (line.find("pid") != string::npos) {
            settings_found = true;
            getline(f, line);
            pid_p = stof(line);
            getline(f, line);
            pid_i = stof(line);
            getline(f, line);
            pid_d = stof(line);
        }
    }
}

void PrinterController::get_speed(float& x, float& y, float& z, float& e) {
    fstream f;
    f.open(to_settings);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong settings file to_settings!");
    }
    // прочитать файл и найти свойства пресета
    string line;
    bool speed_found = false;
    while (getline(f, line) && !speed_found) {
        if (line.find("speed") != string::npos) {
            speed_found = true;
            getline(f, line);
            x = stof(line);
            getline(f, line);
            y = stof(line);
            getline(f, line);
            z = stof(line);
            getline(f, line);
            e = stof(line);
        }
    }
}

void PrinterController::change_preset_start(PrinterVariables::Common::Preset preset)
{
    Parameters a;
    settings.common.currentPreset = preset;
    get_preset(preset, position.temp_e0, position.temp_bed, position.cooler);
    a = {{'S', position.temp_e0}};
    gcode_M104(a);
    a = {{'S', position.temp_bed}};
    gcode_M140(a);
    screen.update();
}

void PrinterController::setNewPresetValue(PrinterVariables::Common::Preset preset)
{
    settings.common.currentPreset = preset;
    screen.update();
}

void PrinterController::setNewPrecisionValue(PrinterVariables::Common::Precision precision)
{
    settings.common.currentPrecision = precision;
    screen.update();
}

void PrinterController::home()
{
    Parameters a = {{'X', 0},
                    {'Y', 0},
                    {'Z', 0}};
    gcode_G28(a);
    screen.update();
}

void PrinterController::control(DrivingControl d)
{
    Parameters a;
    gcode_M83(a);
    gcode_G91(a);
    switch (d)
    {
        case X_Minus:
            a = {{'X', - settings.common.currentPrecision / 100}};
            break;
        case X_Plus:
            a = {{'X', settings.common.currentPrecision / 100}};
            break;
        case Y_Minus:
            a = {{'Y', - settings.common.currentPrecision / 100}};
            break;
        case Y_Plus:
            a = {{'Y', settings.common.currentPrecision / 100}};
            break;
        case Z_Minus:
            a = {{'Z', - settings.common.currentPrecision / 100}};
            break;
        case Z_Plus:
            a = {{'Z', settings.common.currentPrecision / 100}};
            break;
        case E_Minus:
            a = {{'E', - settings.common.currentPrecision / 100}};
            break;
        case E_Plus:
            a = {{'E', settings.common.currentPrecision / 100}};
            break;
        default:
            break;
    }
    screen.update();
    gcode_G1(a);
}

void PrinterController::pause_printing()
{
    state = Pause_Printing;
    settings.common.infoLine = PrinterVariables::Common::PAUSED;
    screen.update();
}

void PrinterController::block_screen()
{
    settings.common.infoLine = PrinterVariables::Common::BLOCKED_SCREEN;
    screen.update();
}

void PrinterController::abort_printing()
{
    state = Stop_Printing;
    settings.common.infoLine = PrinterVariables::Common::IDLE;
    screen.update();
}

void PrinterController::start_slicing(string path)
{
    to_slice = path;
    state = Slicing;
}

void PrinterController::print_settings(SlicingParameters sp)
{
    switch (sp)
    {
        case Layer_Width_Minus:
            settings.slicer.layerWidth -= settings.common.currentPrecision / 100;
            if (settings.slicer.layerWidth < 0)
                settings.slicer.layerWidth = 0;
            break;
        case Layer_Width_Plus:
            settings.slicer.layerWidth += settings.common.currentPrecision / 100;
            break;
        case Base_Thicknes_Minus:
            settings.slicer.baseThicknes -= settings.common.currentPrecision / 100;
            if (settings.slicer.baseThicknes < 0)
                settings.slicer.baseThicknes = 0;
            break;
        case Base_Thicknes_Plus:
            settings.slicer.baseThicknes += settings.common.currentPrecision / 100;
            break;
        case Filling_Density_Minus:
            settings.slicer.fillingDensity -= settings.common.currentPrecision / 100;
            if (settings.slicer.fillingDensity < 0)
                settings.slicer.fillingDensity = 0;
            break;
        case Filling_Density_Plus:
            settings.slicer.fillingDensity -= settings.common.currentPrecision / 100;
            break;
        default:
            break;
    }
    screen.update();
}

void PrinterController::change_general_settings(int sg)
{
    switch (sg)
    {   //Проблема: какую команду использовать. нагреть до указанной температуры или ожидать нагрева и поддерживать?
        case Nozzle_Minus:
            position.temp_e0 -= int(settings.common.currentPrecision / 100);
            //Нагреть
            break;
        case Nozzle_Plus:
            position.temp_e0 += int(settings.common.currentPrecision / 100);
            //Нагреть
            break;
        case Pad_Minus:
            position.temp_bed -= int(settings.common.currentPrecision / 100);
            //Нагреть
            break;
        case Pad_Plus:
            position.temp_bed += int(settings.common.currentPrecision / 100);
            //Нагреть
            break;
        case Cooler_Minus:
            break;
        case Cooler_Plus:
            break;
        case PID_P_Minus:
            settings.common.PID_P -= settings.common.currentPrecision / 100;
            break;
        case PID_P_Plus:
            settings.common.PID_P += settings.common.currentPrecision / 100;
            break;
        case PID_I_Minus:
            settings.common.PID_I -= settings.common.currentPrecision / 100;
            break;
        case PID_I_Plus:
            settings.common.PID_I += settings.common.currentPrecision / 100;
            break;
        case PID_D_Minus:
            settings.common.PID_D -= settings.common.currentPrecision / 100;
            break;
        case PID_D_Plus:
            settings.common.PID_D += settings.common.currentPrecision / 100;
            break;
        default:
            break;
    }
    screen.update();
}

void PrinterController::save_general_settings()
{
    set_pid(settings.common.PID_P, settings.common.PID_I, settings.common.PID_D);
}

void PrinterController::restore_default_general_settings()
{
    get_pid(settings.common.PID_P, settings.common.PID_I, settings.common.PID_D);
    screen.update();
}

void PrinterController::change_preset_settings(PreprintSetup ps)
{
    int i = 0;
    switch (ps)
    {
        case Nozzle_Minus:
            i += int(settings.common.currentPrecision / 100);
            switch (settings.common.currentPreset)
            {
                case PrinterVariables::Common::PLA:
                    settings.presets.PLA.nozzle -= i;
                    break;
                case PrinterVariables::Common::ABS:
                    settings.presets.ABS.nozzle -= i;
                    break;
                case PrinterVariables::Common::PVA:
                    settings.presets.PVA.nozzle -= i;
                    break;
                case PrinterVariables::Common::PRESET1:
                    settings.presets.Preset1.nozzle -= i;
                    break;
                case PrinterVariables::Common::PRESET2:
                    settings.presets.Preset2.nozzle -= i;
                    break;
                case PrinterVariables::Common::PRESET3:
                    settings.presets.Preset3.nozzle -= i;
                    break;
                default:
                    break;
            }
            break;
        case Nozzle_Plus:
            i -= int(settings.common.currentPrecision / 100);
            switch (settings.common.currentPreset)
            {
                case PrinterVariables::Common::PLA:
                    settings.presets.PLA.nozzle -= i;
                    break;
                case PrinterVariables::Common::ABS:
                    settings.presets.ABS.nozzle -= i;
                    break;
                case PrinterVariables::Common::PVA:
                    settings.presets.PVA.nozzle -= i;
                    break;
                case PrinterVariables::Common::PRESET1:
                    settings.presets.Preset1.nozzle -= i;
                    break;
                case PrinterVariables::Common::PRESET2:
                    settings.presets.Preset2.nozzle -= i;
                    break;
                case PrinterVariables::Common::PRESET3:
                    settings.presets.Preset3.nozzle -= i;
                    break;
                default:
                    break;
            }
            break;
        case Pad_Minus:
            i += int(settings.common.currentPrecision / 100);
            switch (settings.common.currentPreset)
            {
                case PrinterVariables::Common::PLA:
                    settings.presets.PLA.pad -= i;
                    break;
                case PrinterVariables::Common::ABS:
                    settings.presets.ABS.pad -= i;
                    break;
                case PrinterVariables::Common::PVA:
                    settings.presets.PVA.pad -= i;
                    break;
                case PrinterVariables::Common::PRESET1:
                    settings.presets.Preset1.pad -= i;
                    break;
                case PrinterVariables::Common::PRESET2:
                    settings.presets.Preset2.pad -= i;
                    break;
                case PrinterVariables::Common::PRESET3:
                    settings.presets.Preset3.pad -= i;
                    break;
                default:
                    break;
            }
            break;
        case Pad_Plus:
            i -= int(settings.common.currentPrecision / 100);
            switch (settings.common.currentPreset)
            {
                case PrinterVariables::Common::PLA:
                    settings.presets.PLA.pad -= i;
                    break;
                case PrinterVariables::Common::ABS:
                    settings.presets.ABS.pad -= i;
                    break;
                case PrinterVariables::Common::PVA:
                    settings.presets.PVA.pad -= i;
                    break;
                case PrinterVariables::Common::PRESET1:
                    settings.presets.Preset1.pad -= i;
                    break;
                case PrinterVariables::Common::PRESET2:
                    settings.presets.Preset2.pad -= i;
                    break;
                case PrinterVariables::Common::PRESET3:
                    settings.presets.Preset3.pad -= i;
                    break;
                default:
                    break;
            }
            break;
        case Cooler_Minus:
            break;
        case Cooler_Plus:
            break;
        default:
            break;
    }
    screen.update();
}

void PrinterController::save_preset_settings()
{
    switch (settings.common.currentPreset)
    {
        case PrinterVariables::Common::PLA:
            set_preset(settings.common.currentPreset, settings.presets.PLA.nozzle, settings.presets.PLA.pad, settings.presets.PLA.cooler);
            break;
        case PrinterVariables::Common::ABS:
            set_preset(settings.common.currentPreset, settings.presets.ABS.nozzle, settings.presets.ABS.pad, settings.presets.ABS.cooler);
            break;
        case PrinterVariables::Common::PVA:
            set_preset(settings.common.currentPreset, settings.presets.PVA.nozzle, settings.presets.PVA.pad, settings.presets.PVA.cooler);
            break;
        case PrinterVariables::Common::PRESET1:
            set_preset(settings.common.currentPreset, settings.presets.Preset1.nozzle, settings.presets.Preset1.pad, settings.presets.Preset1.cooler);
            break;
        case PrinterVariables::Common::PRESET2:
            set_preset(settings.common.currentPreset, settings.presets.Preset2.nozzle, settings.presets.Preset2.pad, settings.presets.Preset2.cooler);
            break;
        case PrinterVariables::Common::PRESET3:
            set_preset(settings.common.currentPreset, settings.presets.Preset3.nozzle, settings.presets.Preset3.pad, settings.presets.Preset3.cooler);
            break;
        default:
            break;
    }
}

void PrinterController::restore_default_preset_settings()
{
    switch (settings.common.currentPreset)
    {
        case PrinterVariables::Common::PLA:
            get_preset(settings.common.currentPreset, settings.presets.PLA.nozzle, settings.presets.PLA.pad, settings.presets.PLA.cooler);
            break;
        case PrinterVariables::Common::ABS:
            get_preset(settings.common.currentPreset, settings.presets.ABS.nozzle, settings.presets.ABS.pad, settings.presets.ABS.cooler);
            break;
        case PrinterVariables::Common::PVA:
            get_preset(settings.common.currentPreset, settings.presets.PVA.nozzle, settings.presets.PVA.pad, settings.presets.PVA.cooler);
            break;
        case PrinterVariables::Common::PRESET1:
            get_preset(settings.common.currentPreset, settings.presets.Preset1.nozzle, settings.presets.Preset1.pad, settings.presets.Preset1.cooler);
            break;
        case PrinterVariables::Common::PRESET2:
            get_preset(settings.common.currentPreset, settings.presets.Preset2.nozzle, settings.presets.Preset2.pad, settings.presets.Preset2.cooler);
            break;
        case PrinterVariables::Common::PRESET3:
            get_preset(settings.common.currentPreset, settings.presets.Preset3.nozzle, settings.presets.Preset3.pad, settings.presets.Preset3.cooler);
            break;
        default:
            break;
    }
    screen.update();
}

void PrinterController::change_movement_speed(SpeedSettings ps)
{
    switch (ps)
    {
        case Speed_X_Minus:
            settings.movement.speed.speedX -= settings.common.currentPrecision / 100;
            break;
        case Speed_X_Plus:
            settings.movement.speed.speedX += settings.common.currentPrecision / 100;
            break;
        case Speed_Y_Minus:
            settings.movement.speed.speedY -= settings.common.currentPrecision / 100;
            break;
        case Speed_Y_Plus:
            settings.movement.speed.speedY += settings.common.currentPrecision / 100;
            break;
        case Speed_Z_Minus:
            settings.movement.speed.speedZ -= settings.common.currentPrecision / 100;
            break;
        case Speed_Z_Plus:
            settings.movement.speed.speedZ += settings.common.currentPrecision / 100;
            break;
        case Speed_E_Minus:
            settings.movement.speed.speedE += settings.common.currentPrecision / 100;
            break;
        case Speed_E_Plus:
            settings.movement.speed.speedE += settings.common.currentPrecision / 100;
            break;
        default:
            break;
    }
    screen.update();
}

void PrinterController::save_movement_speed()
{
    set_speed(settings.movement.speed.speedX, settings.movement.speed.speedY, settings.movement.speed.speedZ, settings.movement.speed.speedE);
}

void PrinterController::restore_default_movement_speed()
{
    get_speed(settings.movement.speed.speedX, settings.movement.speed.speedY, settings.movement.speed.speedZ, settings.movement.speed.speedE);
    screen.update();
}

void PrinterController::change_movement_steps(StepsSettings ps)
{
    switch (ps)
    {
        case Speed_X_Minus:
            settings.movement.steps.steps_x -= settings.common.currentPrecision / 100;
            break;
        case Speed_X_Plus:
            settings.movement.steps.steps_x += settings.common.currentPrecision / 100;
            break;
        case Speed_Y_Minus:
            settings.movement.steps.steps_y -= settings.common.currentPrecision / 100;
            break;
        case Speed_Y_Plus:
            settings.movement.steps.steps_y += settings.common.currentPrecision / 100;
            break;
        case Speed_Z_Minus:
            settings.movement.steps.steps_z -= settings.common.currentPrecision / 100;
            break;
        case Speed_Z_Plus:
            settings.movement.steps.steps_z += settings.common.currentPrecision / 100;
            break;
        default:
            break;
    }
    screen.update();
}

void PrinterController::save_movement_steps()
{
    set_max_xyz(settings.movement.steps.steps_x, settings.movement.steps.steps_y, settings.movement.steps.steps_z);
}

void PrinterController::restore_default_movement_steps()
{
    get_max_xyz(settings.movement.steps.steps_x, settings.movement.steps.steps_y, settings.movement.steps.steps_z);
    screen.update();
}