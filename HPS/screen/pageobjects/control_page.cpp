#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "uart.h"

ControlPage::ControlPage(ScreenController& controller) :
BasePage(controller) {

	// take data from structures

	controller.uart.openScreen(UART::Screen::CONTROL);

	cout << "OK - ControlPage::ControlPage" << endl;
}

void ControlPage::update() {


	cout << "ControlPage::update" << endl;
}

void ControlPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {
		case b_nav_home:
		{
			controller.setCurrentScreen(ScreenController::Screen::HOME);
			break;
		}
		case b_nav_print:
		{
			controller.setCurrentScreen(ScreenController::Screen::PRINT);
			break;
		}
		case b_nav_settings:
		{
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case b_precis_1:
		case b_precis_2:
		case b_precis_3:
		case b_precis_4:
		case b_precis_5:
		case b_reset_def:
		case b_hor_up:
		case b_hor_down:
		case b_hor_left:
		case b_hor_right:
		case b_ver_up:
		case b_ver_down:
		case b_ext_up:
		case b_ext_down:
		case b_autocalib:

		default: {
			cout << "ERROR - ControlPage::touch - Unknown code: " << code << endl;
		}

	}

	cout << "OK - ControlPage::touch - touch event proceded." << endl;
}