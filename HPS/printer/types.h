#ifndef INC_3D_PRINTER_TYPES_H
#define INC_3D_PRINTER_TYPES_H

#include "configuration.h"


enum StateType {Waiting, 
                Slicing,
                Printing,
                Pause_Printing,
                Stop_Printing,
                ShuttingDown};

enum CoordinateSystemType {Relative, Absolute};

enum DrivingControl {   X_Minus,
                        X_Plus, 
                        Y_Minus, 
                        Y_Plus, 
                        Z_Minus, 
                        Z_Plus, 
                        E_Minus, 
                        E_Plus};

enum SlicingParameters {Layer_Width_Minus, 
                        Layer_Width_Plus, 
                        Base_Thicknes_Minus, 
                        Base_Thicknes_Plus, 
                        Filling_Density_Minus, 
                        Filling_Density_Plus};

enum SettingsPID {  PID_P_Minus=6, 
                    PID_P_Plus, 
                    PID_I_Minus, 
                    PID_I_Plus, 
                    PID_D_Minus, 
                    PID_D_Plus};

enum PreprintSetup {Nozzle_Plus=0, 
                    Nozzle_Minus, 
                    Pad_Plus, 
                    Pad_Minus,
                    Cooler_Minus,
                    Cooler_Plus};

enum SpeedSettings {Speed_X_Plus, 
                    Speed_X_Minus, 
                    Speed_Y_Plus, 
                    Speed_Y_Minus, 
                    Speed_Z_Plus, 
                    Speed_Z_Minus, 
                    Speed_E_Plus, 
                    Speed_E_Minus};

enum StepsSettings {Steps_X_Plus, 
                    Steps_X_Minus, 
                    Steps_Y_Plus, 
                    Steps_Y_Minus, 
                    Steps_Z_Plus, 
                    Steps_Z_Minus};

struct Position {
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float e = 0.0f;

    float s = default_speed;

    CoordinateSystemType xyz_type = Absolute;
    CoordinateSystemType extruder_type = Absolute;
};

struct PrinterVariables {

    /* Types */

    struct Status {
        // Errors / Для индикаторов ошибок
        bool isPadHot           = false; // Статус температуры стола
        bool isRodEmpty         = false; // Пруток закончился 
        bool isExtruderDirty    = false; //
        bool isRodBroken        = false; // Обрыв прутка
    };

    struct Common {

        /* Types */

        enum Preset { PLA, ABS, PVA, PRESET1, PRESET2, PRESET3 };
        enum InfoLine { IDLE, PAUSED, BLOCKED_SCREEN, ERROR }; // СЮДА НУЖНО ДОБАВИТЬ ВСЕ СТАТУСЫ
        enum Precision { P100 = 10000, P10 = 1000, P1 = 100, P01 = 10, P001 = 1};

        struct Element {
            bool isEnabled;
            int current;
            int set;
            int max;

            bool operator==(const Element& rhs) {
                bool compare =  isEnabled == rhs.isEnabled ||
                                current == rhs.current ||
                                set == rhs.set ||
                                max == rhs.max;
                return compare;
            }
            
        };

        /* Properties */

        Preset currentPreset      = PLA;  // Текущий выбранный пресет
        Precision currentPrecision = P1; // 100 10 1 0.1 0.01

        InfoLine infoLine   = IDLE;     // Информационная стока
        bool isThinking = false;        // Для вращающейся фигни
        int processBar  = 0;

        Element nozzle  = {false, 0, 0, MAX_TEMP};
        Element pad     = {false, 0, 0, MAX_TEMP};
        Element cooler  = {false, 0, 0, 100};

        float PID_P = 0.0f;
        float PID_I = 0.0f;
        float PID_D = 0.0f;

        bool isTemperatureAuto = false; // ?
    };

    // Slicer settings
    struct Slicer {
        float layerWidth       = 0.25f;
        float baseThicknes     = 0.1f;
        float fillingDensity   = 10; //в процентах
    };

    // Presets settings
    struct Presets {
    
        struct Set {
            int nozzle  = 0;
            int pad     = 0;
            int cooler  = 0;
        };

        Set PLA;
        Set ABS;
        Set PVA;
        Set Preset1;
        Set Preset2;
        Set Preset3;
    };

    // Movement settings
    struct Movement {

        struct Speed {
            float speedX = 100.0f;
            float speedY = 100.0f;
            float speedZ = 100.0f;
            float speedE = 100.0f;
        };

        struct Steps{
            float steps_x = 250.0f;
            float steps_y = 250.0f;
            float steps_z = 250.0f;
        };

        Speed speed;
        Steps steps;
    };

    /* Properties */

    Status status;
    Common common;
    Position position;

    Presets presets;
    Slicer slicer;
    Movement movement;
};

/* Helper function */

template<class T>
bool isValueChanged(T firstArg, T secondArg) {
    /*
        Checks is values changed. Use carefully.
    */
    return firstArg != secondArg;
}



#endif //INC_3D_PRINTER_TYPES_H
