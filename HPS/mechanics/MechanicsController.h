#ifndef INC_3D_PRINTER_MECHANICSCONTROLLER_H
#define INC_3D_PRINTER_MECHANICSCONTROLLER_H

#include <inttypes.h>


class PrinterController;

// Класс отвечает за механику, взаимодействие с verilog.
class MechanicsController {

    // методы раблоты с памятью
public:
    PrinterController* printer;

    MechanicsController();

    void move(int32_t da, int32_t db, int32_t dz, uint32_t sa, u_int32_t sb, uint32_t sz,
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

};


#endif //INC_3D_PRINTER_MECHANICSCONTROLLER_H
