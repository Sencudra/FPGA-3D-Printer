#include "PrinterController.h"

using namespace std;

int main() {

  	PrinterController printer;
  	printer.state = Printing;
    printer.to_print = "file.txt";
  	printer.main_loop();

    return 0;
}
