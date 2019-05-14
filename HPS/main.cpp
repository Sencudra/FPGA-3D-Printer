#include "PrinterController.h"
#include "config.h"

// Global variable
bool isScreenDebug;

int main(int argc, char *argv[]) {

	std::cout << "OK - main() - Running with flags: ";

	// cout flags
	for (int i = 1; i < argc; ++i) {
        std::cout << argv[i] << std::endl;
    }

    // screen debug mode
    if (argc == 2 && strcmp(argv[1], "-sd") == 0) {
    	std::cout << "OK - main() - Running in screen debug mode" << std::endl;
    	isScreenDebug = true;
    } else {
    	std::cout << "OK - main() - Running regularly" << std::endl;
    	isScreenDebug = false;
    }

  	PrinterController printer;
  	printer.main_loop();
    return 0;
}
