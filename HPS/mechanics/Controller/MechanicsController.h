#ifndef INC_3D_PRINTER_MECHANICSCONTROLLER_H
#define INC_3D_PRINTER_MECHANICSCONTROLLER_H

#define HW_REGS_BASE (ALT_STM_OFST)
#define HW_REGS_SPAN (0x04000000)
#define HW_REGS_MASK (HW_REGS_SPAN - 1)

#define bit_count_uint32 32

#include <inttypes.h>
#include <cmath>
#include <fcntl.h>

#include "hwlib.h"
#include "unistd.h"
#include <stdio.h>

// sys
#include "sys/mman.h"

// socal
#include "socal.h"
#include "hps.h"
#include "alt_gpio.h"

#include "HPS_Header.h"
#include "TemperatureADC.h"
#include "Configuration.h"

using namespace std;

//Flags
//=======================================================
// Описание битов флагов
// flags_in[0]:  вкл/выкл stepper (0 - двигатель выключен, 1 - двигатель включен)
// flags_in[1]:  выполнить движение corexy, оси z и экструдера (0 - игнорировать количество шагов, 1 - выполнить движение по количеству шагов)
// flags_in[2]:  команда HOME по оси x
// flags_in[3]:  команда HOME по оси y
// flags_in[4]:  команда HOME по оси z
// flags_in[5]:  выполнить команду HOME (0 - игнорировать количество шагов, 1 - выполнить команду HOME)

// flags_in[6]:	нагреть стол до указанной температуры
// flags_in[7]:	нагреть стол до указанной температуры и ее удержание
//
// flags_in[8]:	нагреть экструдер до указанной температуры
// flags_in[9]:	нагреть экструдер до указанной температуры и ее удержание
// -------------
// flags_out[0]:  выполняется движение по осям или экструдеру (0 - двигатель стоит, 1 - выполняется повор)
// flags_out[1]:	происходит нагрев стола
// flags_out[2]:	происходит нагрев экструдера
//=======================================================

//flags_in
const uint32_t flags_in_stepper_enabled = 0;
const uint32_t flags_in_start_driving_state = 1;
const uint32_t flags_in_home_x = 2;
const uint32_t flags_in_home_y = 3;
const uint32_t flags_in_home_z = 4;
const uint32_t flags_in_start_homing_state = 5;
const uint32_t flags_in_heat_bed = 6;
const uint32_t flags_in_heat_bed_hold = 7;
const uint32_t flags_in_heat_extruder = 8;
const uint32_t flags_in_heat_extruder_hold = 9;

//flags_out
const uint32_t flags_out_stepper_state = 0;
const uint32_t flags_out_heating_bed = 1;
const uint32_t flags_out_heating_extruder = 2;

//configuration_1
//=======================================================
//	[0]:  инверсия концевика xmin (0 - нет инверсии, 1 - есть инверсия)
//	[1]:  инверсия концевика xmax (0 - нет инверсии, 1 - есть инверсия)
//	[2]:  инверсия концевика ymin (0 - нет инверсии, 1 - есть инверсия)
//	[3]:  инверсия концевика ymax (0 - нет инверсии, 1 - есть инверсия)
//	[4]:  инверсия концевика zmin (0 - нет инверсии, 1 - есть инверсия)
//	[5]:  инверсия концевика zmax (0 - нет инверсии, 1 - есть инверсия)
//
//	[6]:	инверсия двигателя 1 (corexy)
//	[7]:	инверсия двигателя 2 (corexy)
//	[8]:	инверсия двигателя оси z
//	[9]:	инверсия двигателя экструдера
//=======================================================
const uint32_t configuration_1_inversion_xmin = 0;
const uint32_t configuration_1_inversion_xmax = 1;
const uint32_t configuration_1_inversion_ymin = 2;
const uint32_t configuration_1_inversion_ymax = 3;
const uint32_t configuration_1_inversion_zmin = 4;
const uint32_t configuration_1_inversion_zmax = 5;
const uint32_t configuration_1_inversion_stepper_1 = 6;
const uint32_t configuration_1_inversion_stepper_2 = 7;
const uint32_t configuration_1_inversion_stepper_3 = 8;
const uint32_t configuration_1_inversion_stepper_4 = 9;

class PrinterController;

// Класс отвечает за механику, взаимодействие с verilog.
class MechanicsController {

    //Вспомогательные методы
    int32_t voltage_adc(int32_t temp);
    uint32_t zeroing(uint32_t number, uint32_t count, uint32_t direction);
    uint32_t create_number(bool state, uint32_t count);

    //переменные
    int fd;
    void* virtual_base;
    uint32_t* addr_leds;
    uint32_t* addr_btns;
    uint32_t* addr_fans;
    uint32_t* addr_flags_in;
    uint32_t* addr_flags_out;
    uint32_t* addr_endstops;
    uint32_t* addr_configuration_1;

    int32_t* addr_temp_bed;
    int32_t* addr_temp0;
    int32_t* addr_temp1;

    int32_t* addr_temp_bed_bottom;
    int32_t* addr_temp_bed_upper;
    int32_t* addr_temp_e1_bottom;
    int32_t* addr_temp_e1_upper;

    uint32_t* addr_stepper_1_speed;
    uint32_t* addr_stepper_2_speed;
    uint32_t* addr_stepper_3_speed;
    uint32_t* addr_stepper_4_speed;

    int32_t* addr_stepper_1_steps_in;
    int32_t* addr_stepper_2_steps_in;
    int32_t* addr_stepper_3_steps_in;
    int32_t* addr_stepper_4_steps_in;

    int32_t* addr_stepper_1_steps_out;
    int32_t* addr_stepper_2_steps_out;
    int32_t* addr_stepper_3_steps_out;
    int32_t* addr_stepper_4_steps_out;

    uint32_t flags_in;
    uint32_t flags_out;
    uint32_t endstops;
    uint32_t fans;
    uint32_t leds;
    uint32_t btns;

    // методы раблоты с памятью
    uint32_t get_leds();
    uint32_t get_btns();
    uint32_t get_endstops();
    uint32_t get_fans();

    void set_leds(uint32_t ledss);
    void set_fans(uint32_t fanss);

    int32_t get_temp_bed_bottom();
    int32_t get_temp_bed_upper();
    int32_t get_temp_e1_bottom();
    int32_t get_temp_e1_upper();

    void set_temp_bed_bottom(int32_t temp);
    void set_temp_bed_upper(int32_t temp);
    void set_temp_e1_bottom(int32_t temp);
    void set_temp_e1_upper(int32_t temp);

    //flags_in
    bool get_flags_in_stepper_enabled();
    bool get_flags_in_start_driving_state();
    bool get_flags_in_homex();
    bool get_flags_in_homey();
    bool get_flags_in_homez();
    bool get_flags_in_start_homing_state();
    bool get_flags_in_heat_bed();
    bool get_flags_in_heat_bed_hold();
    bool get_flags_in_heat_extruder();
    bool get_flags_in_heat_extruder_hold();

    void set_flags_in_stepper_enabled(bool state);
    void set_flags_in_start_driving_state(bool state);
    void set_flags_in_homex(bool state);
    void set_flags_in_homey(bool state);
    void set_flags_in_homez(bool state);
    void set_flags_in_start_homing_state(bool state);
    void set_flags_in_heat_bed(bool state);
    void set_flags_in_heat_bed_hold(bool state);
    void set_flags_in_heat_extruder(bool state);
    void set_flags_in_heat_extruder_hold(bool state);

    //flags_out
    bool get_flags_out_stepper_state();


    void set_configuration_1();

    //fans
    bool get_fan(int number);
    void set_fan(int number, bool state);

    //leds
    bool get_led(int number);
    void set_led(int number, bool state);

    //btns
    bool get_btn(int number);

    //endstops
    bool get_endstop_xmin();
    bool get_endstop_xmax();
    bool get_endstop_ymin();
    bool get_endstop_ymax();
    bool get_endstop_zmin();
    bool get_endstop_zmax();

public:
    PrinterController* printer;

    MechanicsController();

    int32_t temperature_adc(int32_t volt);

    void move(int32_t da, int32_t db, int32_t dz, uint32_t sa, uint32_t sb, uint32_t sz,
               int32_t& ra, int32_t& rb, int32_t& rz);
    void move_extrude(int32_t da, int32_t db, int32_t dz, int32_t de, uint32_t sa, uint32_t sb,
                        uint32_t sz, uint32_t se, int32_t& ra, int32_t& rb, int32_t& rz, int32_t& re);
    void auto_home(bool x, bool y, bool z);
    void enable_steppers();
    void disable_steppers();
    void set_hotend_temperature(int32_t t);
    void wait_hotend_temperature(int32_t t);
    void set_bed_temperature(int32_t t);
    void wait_bed_temperature(int32_t t);
    void endstop_states(bool& xmin, bool& xmax,
                        bool& ymin, bool& ymax,
                        bool& zmin, bool& zmax);

    int32_t get_temp_bed();
    int32_t get_temp0();
    int32_t get_temp1();

    bool get_flags_out_heating_bed();
    bool get_flags_out_heating_extruder();
};

#endif //INC_3D_PRINTER_MECHANICSCONTROLLER_H