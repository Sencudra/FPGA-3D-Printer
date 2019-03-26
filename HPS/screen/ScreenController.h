#ifndef INC_3D_PRINTER_SCREENCONTROLLER_H
#define INC_3D_PRINTER_SCREENCONTROLLER_H

class PrinterController;

// Класс взаимодействия с экраном
class ScreenController {

public:
    PrinterController* printer;

    ScreenController();
};


#endif //INC_3D_PRINTER_SCREENCONTROLLER_H
