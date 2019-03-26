#ifndef INC_3D_PRINTER_MECHANICSCONTROLLER_H
#define INC_3D_PRINTER_MECHANICSCONTROLLER_H

class PrinterController;


// Класс отвечает за механику, взаимодействие с verilog.
class MechanicsController {
public:
    PrinterController* printer;

    MechanicsController();
};


#endif //INC_3D_PRINTER_MECHANICSCONTROLLER_H
