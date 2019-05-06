#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "uart.h"

PrintPage::PrintPage(ScreenController& controller) :
BasePage(controller) {

	// take data from structures

	controller.uart.openScreen(UART::Screen::PRINT);

	cout << "OK - PrintPage::PrintPage" << endl;
}

void PrintPage::update() {


	cout << "PrintPage::update" << endl;
}

void PrintPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {
		case b_nav_home:
		{
			controller.setCurrentScreen(ScreenController::Screen::HOME);
			break;
		}
		case b_nav_control:
		{
			controller.setCurrentScreen(ScreenController::Screen::CONTROL);
			break;
		}
		case b_nav_settings:
		{
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case b_page_next:
		case b_page_prev:
		case b_manager_icon:
		case bi_mang_line:
		case bi_file_name_2:
		case bi_file_name_3:
		case bi_file_name_4:
		case bi_file_name_5:
		case bi_file_name_6:

		default: {
			cout << "ERROR - PrintPage::touch - Unknown code: " << code << endl;
		}

	}

	cout << "OK - PrintPage::touch - touch event proceded." << endl;
}