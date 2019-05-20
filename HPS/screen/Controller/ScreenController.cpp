
// Список косяков:
// 0. Все
// 1. PID-P
// 


#include <iostream>
#include <cstring>

#include "ScreenController.h"
#include "PrinterController.h"
#include "uart.h"
#include "pages.h"

#include "config.h"

using namespace std;

//* Public Constructors and Destructors *//

ScreenController::ScreenController()
:uart(UART::getPort()) {

	// Initialising screen home page
	initializeScreen();
  	
	if (isScreenDebug) 
		cout << "OK - ScreenController::ScreenController()" << endl;
}

ScreenController::~ScreenController() {
	printer->fileManager.disconnectUSB();
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
		case LOADING:{ 
			currentPage = new LoadingPage(*this);
			break;
		}
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
		case PRINT_SETUP:
		{
			currentPage = new PrintSetupPage(*this);
			break;
		}
		case PRINTING:
		 { 
			currentPage = new PrintingPage(*this);
			break;
		}
		case PRINTING_DONE:
		{ 
			currentPage = new PrintingDonePage(*this);
			break;
		}
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
		case SETTINGS_P:
		{
			currentPage = new SettingsPresetsPage(*this);
			break;
		}
		case SETTINGS_M_SPE:
		{	
			currentPage = new SettingsMovSpeedPage(*this); 
			break;
		}
		case SETTINGS_M_STE:
		{
			currentPage = new SettingsMovStepsPage(*this); 
			break;
		}
	}

	// update current page with actial data
	currentPage->update();

	if (isScreenDebug) cout << "OK - ScreenController::setCurrentScreen - Changing screen for " << name << endl;
}

//* Private methods *//

void ScreenController::initializeScreen() {
	uart.listen2port();
	currentPage = new HomePage(*this);
	if (isScreenDebug) cout << "OK - ScreenController::initializeUART - Initialized" << endl;
}

void ScreenController::interpretCommand(vector<int>& command) {

	CommandType code = static_cast<CommandType>(command.front());

	switch(code) {
		case TOUCH_EVENT:
			command.erase(command.begin());
			touchEvent(command);
			if (isScreenDebug) cout << "OK - ScreenController::interpretCommand - Touch event return data" << endl;
			break;
		case CURRENT_PAGE_RETURN:{

			if (isScreenDebug) cout << "OK - ScreenController::interpretCommand - Current page ID number returns" << endl;
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

			if (isScreenDebug) cout << "Notification of success/failure" << endl;
			break;
		}
		default: {
			cout << "ERROR - ScreenController::interpretCommand - Unknown code: " << command[0] << endl;
		}
	}

}

void ScreenController::touchEvent(vector<int>& command) {

	command.erase(command.begin());
	currentPage->touch(command);
	
}