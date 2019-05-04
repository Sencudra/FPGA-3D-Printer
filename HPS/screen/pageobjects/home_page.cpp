#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "uart.h"


// Home page
HomePage::HomePage(ScreenController& controller) :
BasePage(controller) {

	// take data from structures

	controller.uart.write2port("page HOME\xff\xff\xff");

	cout << "OK - HomePage::HomePage" << endl;
}


void HomePage::update() {

	// i_ind_1
	// i_ind_2
	// i_ind_3
	// i_ind_4

	// bi_nozzle_ind
	// bi_nozzle_set
	// bi_nozzle_curr
	// bi_pad_ind
	// bi_pad_set
	// bi_pad_curr
	// bi_fan_ind
	// bi_fan_set
	// bi_fan_curr

	// i_gif_loading
	// i_info_text

	// v_preset_id
	cout << "HomePage::update" << endl;
}

void HomePage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {
		case b_nav_print: {
			controller.setCurrentScreen(ScreenController::Screen::PRINT);
			break;
		}
		case b_nav_control: {
			controller.setCurrentScreen(ScreenController::Screen::CONTROL);
			break;
		}
		case b_nav_settings: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case b_hotspot_1:
		case b_hotspot_2:
		case b_hotspot_3: {

			// PRINTER REQUIRED
			// enable/disable indicators:
			// bi_nozzle_ind
			// bi_nozzle_set
			// bi_nozzle_curr
			// bi_pad_ind
			// bi_pad_set
			// bi_pad_curr
			// bi_fan_ind
			// bi_fan_set
			// bi_fan_curr

			break;
		}
		case b_preset_1:
		case b_preset_2:
		case b_preset_3:
		case b_preset_4:
		case b_preset_5:
		case b_preset_6: {
			// enable preset
			break;
		}

		default: {
			cout << "ERROR - HomePage::touch - Unknown code: " << code << endl;
		}

	}

	cout << "OK - HomePage::touch - touch event proceded." << endl;
}