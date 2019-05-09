#include <iostream>
#include <cstring>

#include "ScreenController.h"
#include "PrinterController.h"
#include "uart.h"
#include "pages.h"

using namespace std;

//* Public Constructors and Destructors *//

ScreenController::ScreenController()
:uart(UART::getPort()) {

	// Initialising screen home page
	initializeScreen();
  	
	cout << "OK - ScreenController::ScreenController()" << endl;
}

ScreenController::~ScreenController() {
	delete currentPage;
}

//* Public Methods *//

void ScreenController::initialise() {

	// Copying struct from Printer source
	copiedSettings = printer->settings;

	// to measure time between update calls.
	sekundomer = clock();

	// update current screen
	currentPage->update();
}

void ScreenController::update() {

	// Evaluate time
	clock_t timeElapsedSinceLastUpdateCall = clock();
  	double elapsed_secs = double(timeElapsedSinceLastUpdateCall - sekundomer) / CLOCKS_PER_SEC;

  	// Update process
  	if (elapsed_secs >= 0.1) {

  		while (!uart.taskQueue.empty()) {
			vector<int> command = uart.taskQueue.front();
			uart.taskQueue.pop();
			interpretCommand(command);
		}
		currentPage->update();

		sekundomer = clock();

		// update copied settings with fresh data
		copiedSettings = printer->settings;
	}

}

void ScreenController::setCurrentScreen(Screen name) {
	/*
		Sets current sceren page
	*/

	delete currentPage;

	switch(name) {
	case LOADING:{ break;}
	case HOME:
	{ 
		currentPage = new HomePage(*this);
		break;
	}
	case PRINT:
	{ 
		currentPage = new PrintPage(*this);
		break;
	}
	case PRINT_SETUP:{ break;}
	case PRINTING:{ break;}
	case PRINTING_DONE:{ break;}
	case CONTROL:
	{ 
		currentPage = new ControlPage(*this);	
		break;
	}
	case SETTINGS:
	{ 
		currentPage = new SettingsPage(*this);
		break;
	}
	case SETTINGS_P:{ break;}
	case SETTINGS_M_SPE:{ break;}
	case SETTINGS_M_STE:{ break;}
	case WARNING:{ break;}
	}

	// update current page with actial data
	currentPage->update();

	cout << "OK - ScreenController::setCurrentScreen - Changing screen for " << name << endl;
}

//* Private methods *//

void ScreenController::initializeScreen() {
	uart.listen2port();
	currentPage = new HomePage(*this);
	cout << "OK - ScreenController::initializeUART - Initialized" << endl;
}

void ScreenController::interpretCommand(vector<int>& command) {

	CommandType code = static_cast<CommandType>(command.front());

	switch(code) {
		case TOUCH_EVENT:
			command.erase(command.begin());
			touchEvent(command);
			cout << "OK - ScreenController::interpretCommand - Touch event return data" << endl;
			break;
		case CURRENT_PAGE_RETURN:{

			cout << "OK - ScreenController::interpretCommand - Current page ID number returns" << endl;
			break;
		}
		case INVALID_INSTRUCTION:
		case SUCCESSFUL_INSTUCTION:
		case INVALID_COMPONENT_ID:
		case INVALID_PAGE_ID:
		case INVALID_PICTURE_ID:
		case INVALID_FONT_ID:
		case INVALID_BAUD_RATE:
		case INVALID_VARIABLE_NAME:
		case INVALID_VARIABLE_OPERATION:	
		case FAILED_TO_ASSIGN:
		case INVALID_PARAMETER_QUEANTITY:
		case FAILED_IO_OPERATION: {

			cout << "Notification of success/failure" << endl;
			break;
		}
		default: {
			cout << "ERROR - ScreenController::interpretCommand - Unknown code: " << command[0] << endl;
		}
	}

	cout << "COMMAND: ";
	for(auto symbol : command) {
		cout << symbol << " ";
	}

	cout << endl;
}

void ScreenController::touchEvent(vector<int>& command) {

	Screen code = static_cast<Screen>(command.front());
	command.erase(command.begin());

	currentPage->touch(command);
  
	switch(code) {
		case LOADING:{ break;}
		case HOME:{ break;}
		case PRINT:{ break;}
		case PRINT_SETUP:{ break;}
		case PRINTING:{ break;}
		case PRINTING_DONE:{ break;}
		case CONTROL:{ break;}
		case SETTINGS:{ break;}
		case SETTINGS_P:{ break;}
		case SETTINGS_M_SPE:{ break;}
		case SETTINGS_M_STE:{ break;}
		case WARNING:{ break;}
	}

}