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

struct s_settings_preprint_setup_preset{
    int32_t nozzle_temp = 0;
    int32_t pad_temp = 0;
    int32_t cooler = 0;
};

struct s_settings_preprint_setup{
    s_settings_preprint_setup_preset ABS;
    s_settings_preprint_setup_preset PLA;
    s_settings_preprint_setup_preset PVA;
    s_settings_preprint_setup_preset Preset1;
    s_settings_preprint_setup_preset Preset2;
    s_settings_preprint_setup_preset Preset3;
};

struct s_settings_general{
    int32_t nozzle_temp_max = 0;
    int32_t pad_temp_max = 0;
    int32_t cooler = 0;

    float PID_P = 0.0f;
    float PID_I = 0.0f;
    float PID_D = 0.0f;
};

struct s_settings_movement_speed{
    float speed_x = 100.0f;
    float speed_y = 100.0f;
    float speed_z = 100.0f;
    float speed_e = 100.0f;
};

struct s_settings_movement_steps{
    float steps_x = 250;
    float steps_y = 250;
    float steps_z = 250;
};

struct s_settings_movement{
    s_settings_movement_speed speed;
    s_settings_movement_steps steps;
};

struct s_settings{
    s_settings_general general;
    s_settings_preprint_setup preprint_setup;
    s_settings_movement movement;
};

struct s_stl_settings{
    float layer_width = 0.25f;
    float base_thicknes = 0.1f;
    float filling_density = 10; //в процентах
};

struct s_print{
    s_stl_settings stl_settings;
    string file_path;
};

struct s_contol{
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float e = 0.0f;
};

struct s_home{
    int32_t nozzle_temp = 0;
    int32_t pad_temp = 0;
    int32_t cooler = 0;
};

struct s_screen{
    s_print print;
    s_settings settings;
    s_contol control;
    s_home home;
};

#endif //INC_3D_PRINTER_TYPES_H
