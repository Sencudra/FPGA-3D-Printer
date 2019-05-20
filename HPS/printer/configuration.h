#ifndef INC_3D_PRINTER_CONFIGURATION_H
#define INC_3D_PRINTER_CONFIGURATION_H

#include <cstdint>

//Убрал public, так как компилятор на него ругался
static const bool X_MIN_ENDSTOP_INVERTING = true; // set to true to invert the logic of the endstop.
static const bool Y_MIN_ENDSTOP_INVERTING = true; // set to true to invert the logic of the endstop.
static const bool Z_MIN_ENDSTOP_INVERTING = true; // set to true to invert the logic of the endstop.
static const bool X_MAX_ENDSTOP_INVERTING = true; // set to true to invert the logic of the endstop.
static const bool Y_MAX_ENDSTOP_INVERTING = true; // set to true to invert the logic of the endstop.
static const bool Z_MAX_ENDSTOP_INVERTING = true; // set to true to invert the logic of the endstop.


static const bool X_STEPPER_INVERTING = false; // set to true to invert the logic of the stepper.
static const bool Y_STEPPER_INVERTING = false; // set to true to invert the logic of the stepper.
static const bool Z_STEPPER_INVERTING = false; // set to true to invert the logic of the stepper.
static const bool E1_STEPPER_INVERTING = true; // set to true to invert the logic of the stepper.

/*
* Дефолтные параметры шаговых двигателей
*/
static const float rotlength =  40; // количество мм на оборот шкива
static const int stepsperrot =  200; // количество шагов на оборот двигателя
static const int microsteps = 16; // количество микрошагов на шаг
static const float maxspeed = 8000; // максимальная скорость 8000 mm/min
static const float maxspeed_z = 2000; // максимальная скорость 2000 mm/min
static const float maxspeed_e = 400; // максимальная скорость 400 mm/min
static const int frequency = 1000000; //тактовая частота двигателя
static const float default_speed = 4000; //скорость по умолчанию

static const int circlelength = 8; //длина одного оборота винта оси Z
static const float h = 2; //расстояние между соседними витками винта оси Z

/*
* Default Axis Steps Per Unit (steps/mm)
* Override with M92
* X, Y, Z, E0 [, E1[, E2[, E3[, E4]]]]
*/
static const float DEFAULT_AXIS_STEPS_PER_UNIT[4] = {(200*16)/(2.0*20), (200*16)/(2.0*20), 200*8/2.0, 92.0}; //микрошагов/мм

// X and Y axis travel speed (mm/m) between probes
static const float XY_PROBE_SPEED = 8000;

static const int32_t TEMP_DELTA = 4;
static const int32_t MAX_TEMP = 300;

// Homing speeds (mm/m)
static const float HOMING_FEEDRATE_XY = (30*60);//(50*60);
static const float HOMING_FEEDRATE_Z = (3*60);

#endif //INC_3D_PRINTER_CONFIGURATION_H