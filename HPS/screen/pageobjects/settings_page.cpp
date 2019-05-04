#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "uart.h"

SettingsPage::SettingsPage(ScreenController& controller) :
BasePage(controller) {

	// take data from structures
	cout << "OK - Error ?" << endl;
	controller.uart.write2port("page SETTINGS");
	controller.uart.write2port("\xff\xff\xff");

	cout << "OK - SettingsPage::SettingsPage" << endl;
}

void SettingsPage::update() {


	cout << "SettingsPage::update" << endl;
}

void SettingsPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {

		case b_preprint:
		{
			break;
		}
		case b_mov: 	
		{
			break;
		}
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
		case b_nav_control: 
		{
			controller.setCurrentScreen(ScreenController::Screen::CONTROL);
			break;
		}
		case b_precis_1:
		case b_precis_2:
		case b_precis_3:
		case b_precis_4:
		case b_precis_5:
		{
			break;
		}
		case b_reset_def:
		{

			break;
		}
		case b_save:
		{

			break;
		}
		case b_r1_minus:
		case b_r2_minus:
		case b_r3_minus:
		case b_r4_minus:
		case b_r5_minus:
		case b_r6_minus:
		case b_r7_minus:
		case b_r8_minus:
		{

			break;
		}
		case b_r1_plus:
		case b_r2_plus:
		case b_r3_plus:
		case b_r4_plus:
		case b_r5_plus:
		case b_r6_plus:
		case b_r7_plus:
		case b_r8_plus:
		case b_temp_auto:
		
		default: {
			cout << "ERROR - SettingsPage::touch - Unknown code: " << code << endl;
		}

	}

	cout << "OK - SettingsPage::touch - touch event proceded." << endl;
}