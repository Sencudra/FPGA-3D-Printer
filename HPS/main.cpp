#include "PrinterController.h"

using namespace std;

int main() {

  	PrinterController printer;
  	printer.state = Printing;
  	printer.to_print = "file.txt";
  	printer.main_loop();
    //TODO: quartus включение только !=0
    //TODO: quartus signal=1 только когда нужно начинать двигаться
    return 0;
}
