#ifndef INC_3D_PRINTER_TYPES_H
#define INC_3D_PRINTER_TYPES_H


enum StateType {Waiting, Slicing, Printing, Pause_Printing, Stop_Printing, ShuttingDown};

enum CoordinateSystemType {Relative, Absolute};

struct Position {
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float e = 0.0f;

    float s = 0.0f;
    //добавить отдельно для оси Z?

    CoordinateSystemType xyz_type = Absolute;
    CoordinateSystemType extruder_type = Absolute;

    int32_t temp_bed = 0;
    int32_t temp_e0 = 0;
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
        enum Precision { P100, P10, P1, P01, P001};

        struct Element {
            bool isEnabled;
            int current;
            int set;
            int max;
        };

        /* Properties */

        Preset current; // Текущий выбранный пресет
        Precision precision; // 100 10 1 0.1 0.01

        InfoLine info   = IDLE;     // Информационная стока
        bool isThinking = false;    // Для вращающейся фигни
        int processBar  = 0;        

        Element nozzle  = {false, 0, 0, 300}; 
        Element pad     = {false, 0, 0, 300};
        Element cooller = {false, 0, 0, 100};

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
            int coller  = 0;
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

#endif //INC_3D_PRINTER_TYPES_H