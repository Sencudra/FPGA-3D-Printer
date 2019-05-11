#include "MechanicsController.h"
#include "PrinterController.h"

// Вспомогательные методы
uint32_t MechanicsController::zeroing(uint32_t number, uint32_t count, uint32_t direction)
//если direction=1, то обнуление левых count битов числа number
//иначе обнуление правых count битов числа number
{
    if (direction==1)
        return (number << count) >> count;
    else
        return (number >> count) << count;
};

uint32_t MechanicsController::create_number(bool state, uint32_t count)
{
    uint32_t a = 1;
    for (uint32_t i = 1; i <= count; i++)
        a *= 2;

    if (state)
        return a;
    else
        return (0xffffffff - a);
};

MechanicsController::MechanicsController() {
    // инициацизация памяти
    if((fd = open( "/dev/mem", (O_RDWR | O_SYNC))) == -1){
        printf("ERROR: could not open \"/dev/mem\"...\n");
    }

    virtual_base = mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, HW_REGS_BASE);

    if(virtual_base == MAP_FAILED) {
        printf("ERROR: mmap() failed...\n");
        close(fd);
    }

    addr_leds 				    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + LED_PIO_BASE) 				& (unsigned long)(HW_REGS_MASK)));
    addr_btns 				    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + BUTTON_PIO_BASE)			& (unsigned long)(HW_REGS_MASK)));
    addr_fans 				    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + FANS_BASE) 					& (unsigned long)(HW_REGS_MASK)));
    addr_flags_out 			    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + FLAGS_IN_BASE) 				& (unsigned long)(HW_REGS_MASK)));
    addr_flags_in 			    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + FLAGS_OUT_BASE) 			& (unsigned long)(HW_REGS_MASK)));
    addr_configuration_1        = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + CONFIGURATION_1_BASE) 		& (unsigned long)(HW_REGS_MASK)));
    addr_endstops 			    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + ENDSTOPS_BASE) 				& (unsigned long)(HW_REGS_MASK)));

    addr_temp_bed 			    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP_BED_BASE) 				& (unsigned long)(HW_REGS_MASK)));
    addr_temp0 				    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP0_BASE) 				& (unsigned long)(HW_REGS_MASK)));
    addr_temp1 				    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP1_BASE) 				& (unsigned long)(HW_REGS_MASK)));

    addr_temp_bed_bottom	    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP_BED_BOTTOM_BASE) 		& (unsigned long)(HW_REGS_MASK)));
    addr_temp_bed_upper		    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP_BED_UPPER_BASE) 		& (unsigned long)(HW_REGS_MASK)));
    addr_temp_e1_bottom		    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP_E1_BOTTOM_BASE) 		& (unsigned long)(HW_REGS_MASK)));
    addr_temp_e1_upper		    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + TEMP_E1_UPPER_BASE)         & (unsigned long)(HW_REGS_MASK)));

    addr_stepper_1_speed 	    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_1_SPEED_BASE) 	    & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_2_speed 	    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_2_SPEED_BASE) 	    & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_3_speed 	    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_3_SPEED_BASE) 	    & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_4_speed 	    = (uint32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_4_SPEED_BASE) 	    & (unsigned long)(HW_REGS_MASK)));

    addr_stepper_1_steps_out    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_1_STEPS_IN_BASE)   & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_2_steps_out    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_2_STEPS_IN_BASE)   & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_3_steps_out    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_3_STEPS_IN_BASE)   & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_4_steps_out    = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_4_STEPS_IN_BASE)   & (unsigned long)(HW_REGS_MASK)));

    addr_stepper_1_steps_in     = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_1_STEPS_OUT_BASE)   & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_2_steps_in     = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_2_STEPS_OUT_BASE)   & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_3_steps_in     = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_3_STEPS_OUT_BASE)   & (unsigned long)(HW_REGS_MASK)));
    addr_stepper_4_steps_in     = (int32_t *) (virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + STEPPER_4_STEPS_OUT_BASE)   & (unsigned long)(HW_REGS_MASK)));


    *addr_leds                  = uint32_t(0);
    *addr_fans                  = uint32_t(0);

    *addr_temp_bed_bottom       = int32_t(0);
    *addr_temp_bed_upper        = int32_t(0);
    *addr_temp_e1_bottom        = int32_t(0);
    *addr_temp_e1_upper         = int32_t(0);

    *addr_stepper_1_speed       = uint32_t(0);
    *addr_stepper_2_speed       = uint32_t(0);
    *addr_stepper_3_speed       = uint32_t(0);
    *addr_stepper_4_speed       = uint32_t(0);

    *addr_stepper_1_steps_in    = int32_t(0);
    *addr_stepper_2_steps_in    = int32_t(0);
    *addr_stepper_3_steps_in    = int32_t(0);
    *addr_stepper_4_steps_in    = int32_t(0);

    *addr_flags_in = uint32_t(1);

    set_configuration_1();
}

// методы работы с памятью
uint32_t MechanicsController::get_leds()
{
    return zeroing(*addr_leds, bit_count_uint32 - LED_PIO_DATA_WIDTH, 1);
}

uint32_t MechanicsController::get_btns()
{
    return zeroing(*addr_btns, bit_count_uint32 - BUTTON_PIO_DATA_WIDTH, 1);
}

uint32_t MechanicsController::get_fans()
{
    return zeroing(*addr_fans, bit_count_uint32 - FANS_DATA_WIDTH, 1);
}

uint32_t MechanicsController::get_endstops()
{
    return zeroing(*addr_endstops, bit_count_uint32 - ENDSTOPS_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp_bed()
{
    return zeroing(*addr_temp_bed, bit_count_uint32 - TEMP_BED_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp0()
{
    return zeroing(*addr_temp0, bit_count_uint32 - TEMP0_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp1()
{
    return zeroing(*addr_temp1, bit_count_uint32 - TEMP1_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp_bed_bottom()
{
    return zeroing(*addr_temp_bed_bottom, bit_count_uint32 - TEMP_BED_BOTTOM_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp_bed_upper()
{
    return zeroing(*addr_temp_bed_upper, bit_count_uint32 - TEMP_BED_UPPER_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp_e1_bottom()
{
    return zeroing(*addr_temp_e1_bottom, bit_count_uint32 - TEMP_E1_BOTTOM_DATA_WIDTH, 1);
}

int32_t MechanicsController::get_temp_e1_upper()
{
    return zeroing(*addr_temp_e1_upper, bit_count_uint32 - TEMP_E1_UPPER_DATA_WIDTH, 1);
}

void MechanicsController::set_temp_bed_bottom(int32_t temp)
{
    uint32_t a = zeroing(temp, bit_count_uint32 - (TEMP_BED_BOTTOM_DATA_WIDTH), 1);
    uint32_t b = zeroing(*addr_temp_bed_bottom, TEMP_BED_BOTTOM_DATA_WIDTH, 0);
    *addr_temp_bed_bottom = (b | a);
}

void MechanicsController::set_temp_bed_upper(int32_t temp)
{
    uint32_t a = zeroing(temp, bit_count_uint32 - (TEMP_BED_UPPER_DATA_WIDTH), 1);
    uint32_t b = zeroing(*addr_temp_bed_upper, TEMP_BED_UPPER_DATA_WIDTH, 0);
    *addr_temp_bed_upper = (b | a);
}

void MechanicsController::set_temp_e1_bottom(int32_t temp)
{
    uint32_t a = zeroing(temp, bit_count_uint32 - (TEMP_E1_BOTTOM_DATA_WIDTH+1), 1);
    uint32_t b = zeroing(*addr_temp_e1_bottom, TEMP_E1_BOTTOM_DATA_WIDTH, 0);
    *addr_temp_e1_bottom = (b | a);
}

void MechanicsController::set_temp_e1_upper(int32_t temp)
{
    uint32_t a = zeroing(temp, bit_count_uint32 - (TEMP_E1_UPPER_DATA_WIDTH), 1);
    uint32_t b = zeroing(*addr_temp_e1_upper, TEMP_E1_UPPER_DATA_WIDTH, 0);
    *addr_temp_e1_upper = (b | a);
}

void MechanicsController::set_leds(uint32_t ledss)
{
    uint32_t a = zeroing(ledss, bit_count_uint32 - (LED_PIO_DATA_WIDTH), 1);
    uint32_t b = zeroing(*addr_leds, LED_PIO_DATA_WIDTH, 0);
    *addr_leds = (b | a);
}

void MechanicsController::set_fans(uint32_t fanss)
{
    uint32_t a = zeroing(fanss, bit_count_uint32 - FANS_DATA_WIDTH, 1);
    uint32_t b = zeroing(*addr_fans, FANS_DATA_WIDTH, 0);
    *addr_fans = (b | a);
}

void MechanicsController::set_configuration_1()
{
    uint32_t a = 0;
    a += X_MIN_ENDSTOP_INVERTING    << configuration_1_inversion_xmin;
    a += X_MAX_ENDSTOP_INVERTING    << configuration_1_inversion_xmax;
    a += Y_MIN_ENDSTOP_INVERTING    << configuration_1_inversion_ymin;
    a += Y_MAX_ENDSTOP_INVERTING    << configuration_1_inversion_ymax;
    a += Z_MIN_ENDSTOP_INVERTING    << configuration_1_inversion_zmin;
    a += Z_MAX_ENDSTOP_INVERTING    << configuration_1_inversion_zmax;

    a += X_STEPPER_INVERTING        << configuration_1_inversion_stepper_1;
    a += Y_STEPPER_INVERTING        << configuration_1_inversion_stepper_2;
    a += Z_STEPPER_INVERTING        << configuration_1_inversion_stepper_3;
    a += E1_STEPPER_INVERTING       << configuration_1_inversion_stepper_4;

    *addr_configuration_1 = a;
}

bool MechanicsController::get_flags_in_stepper_enabled()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_stepper_enabled - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_start_driving_state()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_start_driving_state - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_homex()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_home_x - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_homey()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_home_y - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_homez()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_home_z - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}


bool MechanicsController::get_flags_in_start_homing_state()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_start_homing_state - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_heat_bed()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_heat_bed - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_heat_bed_hold()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_heat_bed_hold - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_heat_extruder()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_heat_extruder - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}

bool MechanicsController::get_flags_in_heat_extruder_hold()
{
    flags_in = *addr_flags_in;
    flags_in = flags_in << (bit_count_uint32 - flags_in_heat_extruder_hold - 1);
    flags_in = flags_in >> (bit_count_uint32 - 1);
    return (flags_in == 1);
}



void MechanicsController::set_flags_in_stepper_enabled(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_stepper_enabled);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_start_driving_state(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_start_driving_state);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_homex(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_home_x);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_homey(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_home_y);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_homez(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_home_z);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}


void MechanicsController::set_flags_in_start_homing_state(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_start_homing_state);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_heat_bed(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_heat_bed);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_heat_bed_hold(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_heat_bed_hold);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_heat_extruder(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_heat_extruder);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

void MechanicsController::set_flags_in_heat_extruder_hold(bool state)
{
    flags_in = *addr_flags_in;
    uint32_t a = create_number(state, flags_in_heat_extruder_hold);
    if (state)
        *addr_flags_in = (a | flags_in);
    else
        *addr_flags_in = (a & flags_in);
}

bool MechanicsController::get_flags_out_stepper_state()
{
    flags_out = *addr_flags_out;
    flags_out = flags_out << (bit_count_uint32 - flags_out_stepper_state - 1);
    flags_out = flags_out >> (bit_count_uint32 - 1);
    return (flags_out == 1);
}

bool MechanicsController::get_flags_out_heating_bed()
{
    flags_out = *addr_flags_out;
    flags_out = flags_out << (bit_count_uint32 - flags_out_heating_bed - 1);
    flags_out = flags_out >> (bit_count_uint32 - 1);
    return (flags_out == 1);
}

bool MechanicsController::get_flags_out_heating_extruder()
{
    flags_out = *addr_flags_out;
    flags_out = flags_out << (bit_count_uint32 - flags_out_heating_extruder - 1);
    flags_out = flags_out >> (bit_count_uint32 - 1);
    return (flags_out == 1);
}

bool MechanicsController::get_fan(int number)
{
    if (number < FANS_DATA_WIDTH){
        fans = get_leds();
        fans = fans << (bit_count_uint32 - number - 1);
        fans = fans >> (bit_count_uint32 - 1);
        return (fans == 1);
    }
    return false;
}

void MechanicsController::set_fan(int number, bool state)
{
    if (number < FANS_DATA_WIDTH){
        fans = get_fans();
        uint32_t a = create_number(state,  number);
        if (state)
            *addr_fans = (a | fans);
        else
            *addr_fans = (a & fans);
    }
}

bool MechanicsController::get_led(int number)
{
    if (number < LED_PIO_DATA_WIDTH){
        leds = get_leds();
        leds = leds << (bit_count_uint32 - number - 1);
        leds = leds >> (bit_count_uint32 - 1);
        return (leds == 1);
    }
    return false;
}

void MechanicsController::set_led(int number, bool state)
{
    if (number < LED_PIO_DATA_WIDTH){
        leds = get_leds();
        uint32_t a = create_number(state,  number);
        if (state)
            *addr_leds = (a | leds);
        else
            *addr_leds = (a & leds);
    }
}

bool MechanicsController::get_btn(int number)
{
    btns = get_btns();
    btns = btns << (bit_count_uint32 - number - 1);
    btns = btns >> (bit_count_uint32 - 1);
    return (btns == 1);
}


bool MechanicsController::get_endstop_xmin()
{
    endstops = get_endstops();
    endstops = endstops << (bit_count_uint32 - 0 - 1);
    endstops = endstops >> (bit_count_uint32 - 1);
    return (endstops == 1);
}

bool MechanicsController::get_endstop_xmax()
{
    endstops = get_endstops();
    endstops = endstops << (bit_count_uint32 - 1 - 1);
    endstops = endstops >> (bit_count_uint32 - 1);
    return (endstops == 1);
}

bool MechanicsController::get_endstop_ymin()
{
    endstops = get_endstops();
    endstops = endstops << (bit_count_uint32 - 2 - 1);
    endstops = endstops >> (bit_count_uint32 - 1);
    return (endstops == 1);
}

bool MechanicsController::get_endstop_ymax()
{
    endstops = get_endstops();
    endstops = endstops << (bit_count_uint32 - 3 - 1);
    endstops = endstops >> (bit_count_uint32 - 1);
    return (endstops == 1);
}

bool MechanicsController::get_endstop_zmin()
{
    endstops = get_endstops();
    endstops = endstops << (bit_count_uint32 - 4 - 1);
    endstops = endstops >> (bit_count_uint32 - 1);
    return (endstops == 1);
}

bool MechanicsController::get_endstop_zmax()
{
    endstops = get_endstops();
    endstops = endstops << (bit_count_uint32 - 5 - 1);
    endstops = endstops >> (bit_count_uint32 - 1);
    return (endstops == 1);
}

void MechanicsController::endstop_states(bool& xmin, bool& xmax,
                                         bool& ymin, bool& ymax,
                                         bool& zmin, bool& zmax)
{
    xmin = get_endstop_xmin();
    xmax = get_endstop_xmax();
    ymin = get_endstop_ymin();
    ymax = get_endstop_ymax();
    zmin = get_endstop_zmin();
    zmax = get_endstop_zmax();
}