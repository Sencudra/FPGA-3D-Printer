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

    CoordinateSystemType xyz_type = Absolute;
    CoordinateSystemType extruder_type = Absolute;
};

#endif //INC_3D_PRINTER_TYPES_H
