#ifndef INC_3D_PRINTER_SCREENCONTROLLER_H
#define INC_3D_PRINTER_SCREENCONTROLLER_H

#include <cstring>
#include <vector>
#include <ctime>

#include "types.h"
#include "config.h"

using namespace std;

class PrinterController;
class BasePage;
class UART;
class Printer;


// Class to work with Nextion Screen
class ScreenController {

public:

	/* Types */

	enum CommandType {

		// Notification on success/failure
		// To enable: bkcmd = 1

		INVALID_INSTRUCTION 		= 0, 	// Invalid instruction
		SUCCESSFUL_INSTUCTION 		= 1, 	// Successful execution of instruction
		INVALID_COMPONENT_ID 		= 2,	// Component ID invalid
		INVALID_PAGE_ID 			= 3,	// Page ID invalid
		INVALID_PICTURE_ID 			= 4, 	// Picture ID invalid
		INVALID_FONT_ID 			= 5, 	// Font ID invalid
		INVALID_BAUD_RATE 			= 17,	// Baud rate setting invalid
		INVALID_VARIABLE_NAME 		= 26, 	// Variable name invalid
		INVALID_VARIABLE_OPERATION	= 27, 	// Variable operation invalid
		FAILED_TO_ASSIGN 			= 28,	// Failed to assign
		INVALID_PARAMETER_QUEANTITY = 30,   // Parameter quantity invalid
		FAILED_IO_OPERATION			= 31, 	// IO operation failed

		// Data return format

		TOUCH_EVENT 				= 101, 	// Touch event return data
		CURRENT_PAGE_RETURN			= 102, 	// Current page ID number returns
	};

	enum Screen {

		// Screen type binding 

		LOADING 					= 0,
		HOME 						= 1,
		PRINT 						= 2, 
		PRINT_SETUP					= 3,
		PRINTING					= 4,
		PRINTING_DONE				= 5,
		CONTROL 					= 6,
		SETTINGS 					= 7,
		SETTINGS_P					= 8,
		SETTINGS_M_SPE				= 9,
		SETTINGS_M_STE				= 10,
		WARNING						= 11
	};

	/* Properties */
	PrinterController* printer;

	/* Contructors */
	ScreenController();
	~ScreenController();

	/* Methods */
	void initialise();
    void update();
    void setCurrentScreen(Screen name);

    // temp
    UART& uart;

    // Struct is used compare changes appeared
    // shoulld be private 
    PrinterVariables copiedSettings;

    BasePage* currentPage;

private:
    
    // to measure time elapsed since last update method call
    clock_t sekundomer;

	/* Methods */

	void initializeScreen();
	void interpretCommand(vector<int>& command);
	void touchEvent(vector<int>& command);
};

#endif //INC_3D_PRINTER_SCREENCONTROLLER_H
