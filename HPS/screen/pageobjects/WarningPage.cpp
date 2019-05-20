#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"

/* Constructors and destructors */

WarningPage::WarningPage(ScreenController& controller, 
			const ScreenController::Screen ok, 
			const ScreenController::Screen cancel, 
			const Reason reason) :
BasePage(controller) {

	this->ok = ok;
	this->cancel = cancel;
	this->reason = reason;

	cout << "Reason:" << reas2int(reason) << endl; 

	controller.uart.openScreen(UART::Screen::WARNING);
	controller.uart.updateIndicator(indicator2string(Indicator::i_message),
				UART::Attribute::PIC,
				reas2int(reason));
	cout << "OK - WarningPage::WarningPage" << endl;

	delete controller.currentPage;
	controller.currentPage = this;
}

WarningPage::~WarningPage() {	}


void WarningPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {
		case Button::b_confirm: {

			switch (reason) {
				case Reason::FOR_PRINT_GCODE: {
					cout << "FOR_GCODE" << endl;
					controller.printer->start_printing(controller.printer->to_print);
					break;
				}
				case Reason::FOR_PRINT: {
					cout << "FOR_PRINT" << endl;
					controller.printer->start_slicing(controller.printer->to_slice);
					break;
				}
				case Reason::FOR_ABORT: {
					cout << "FOR_ABORT" << endl;
					controller.printer->abort_printing();
					break;
				}
				case Reason::FOR_CONTROL_HOME: {
					cout << "FOR_CONTROL_HOME" << endl;
					controller.printer->home();
					break;
				}
			}
			controller.setCurrentScreen(ok);
			break;
		}
		case Button::b_cancel: {
			controller.setCurrentScreen(cancel);
			break;
		}	
		default: {
			cout << "ERROR - WarningPage::touch - Unknown code: " << command.front() << endl;
		}
		
	}
	if (isScreenDebug) cout << "OK - WarningPage::touch - touch event proceded." << endl;
}

string WarningPage::indicator2string(const Indicator& code) const {

	switch(code) {
		case Indicator::i_message:
			return "i_message";
		default: {
			cout << "ERROR - WarningPage::Indicator2String" << endl;
			return "";
		}

	}

}

int WarningPage::reas2int(const Reason& reason) const {
	switch(reason) {
		case Reason::FOR_PRINT:
		case Reason::FOR_PRINT_GCODE:
			return 555;
		case Reason::FOR_ABORT:
			return 553;
		case Reason::FOR_CANCELING_SETUP:
			return 552;
		case Reason::FOR_CONTROL_HOME:
			return 554;
		default:
			return 554;
		}

}