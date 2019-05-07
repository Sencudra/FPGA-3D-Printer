#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "PrinterController.h"
#include "uart.h"


// Home page
HomePage::HomePage(ScreenController& controller) :
BasePage(controller) {

	controller.uart.openScreen(UART::Screen::HOME);
	
	cout << "OK - HomePage::HomePage" << endl;
}


void HomePage::update() {

	updateStatusIndicators();
	updateDisplayIndicators();



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

/* Private methods */

string HomePage::indicator2string(const Indicator& code) const {
	switch(code) {
		case i_ind_1: 
			return "i_ind_1";
		case i_ind_2: 
			return "i_ind_2";
		case i_ind_3: 
			return "i_ind_3";
		case i_ind_4: 
			return "i_ind_4";
		case bi_nozzle_ind: 
			return "bi_nozzle_ind";
		case bi_nozzle_set: 
			return "bi_nozzle_set";
		case bi_nozzle_curr: 
			return "bi_nozzle_curr";
		case bi_pad_ind: 
			return "bi_pad_ind";
		case bi_pad_set: 
			return "bi_pad_set";
		case bi_pad_curr: 
			return "bi_pad_curr";
		case bi_fan_ind: 
			return "bi_fan_ind";
		case bi_fan_set: 
			return "bi_fan_set";
		case bi_fan_curr: 
			return "bi_fan_curr";
		case i_gif_loading: 
			return "i_gif_loading";
		case i_info_text: 
			return "i_info_text";
		default: {
			cout << "ERROR - HomePage::Indicator2String" << endl;
			return "";
		} 
	}
}

void HomePage::updateStatusIndicators() {

	const auto status = controller.printer->settings.status;

	controller.uart.updateIndicator(indicator2string(Indicator::i_ind_1),
					UART::Attribute::PICC,
					status.isPadHot);

	controller.uart.updateIndicator(indicator2string(Indicator::i_ind_2),
					UART::Attribute::PICC,
					status.isRodEmpty);

	controller.uart.updateIndicator(indicator2string(Indicator::i_ind_3), 
					UART::Attribute::PICC, 
					status.isExtruderDirty);

	controller.uart.updateIndicator(indicator2string(Indicator::i_ind_4), 
					UART::Attribute::PICC, 
					status.isRodBroken);
}

void HomePage::updateDisplayIndicators() {

	const int minNotActive = 67;
	const int maxNotActive = 179;
	const int rangeNotActive = maxNotActive - minNotActive;

	const int minActive = 180;
	const int maxActive = 290;
	const int rangeActive = maxActive - minActive;

	const auto nozzle 		= controller.printer->settings.common.nozzle;
	const auto pad 			= controller.printer->settings.common.pad;
	const auto cooler 		= controller.printer->settings.common.cooller;

	int nozzlePicNotActive 	= minNotActive + (nozzle.current / nozzle.max) * rangeNotActive;
	int nozzlePicActive 	= minActive + (nozzle.current / nozzle.max) * rangeActive;

	int padPicNotActive 	= minNotActive + (pad.current / pad.max) * rangeNotActive;
	int padPicActive 		= minActive + (pad.current / pad.max) * rangeActive;
	
	int coolerPicNotActive 	= minNotActive + (cooler.current / cooler.max) * rangeNotActive;
	int coolerPicActive 	= minActive + (cooler.current / cooler.max) * rangeActive;

	controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_ind), 
					UART::Attribute::PICC0, 
					nozzlePicNotActive);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_ind), 
					UART::Attribute::PICC1, 
					nozzlePicActive);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_ind), 
					UART::Attribute::VAL, 
					nozzle.isEnabled);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_set), 
					UART::Attribute::TXT, 
					nozzle.set);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_curr), 
					UART::Attribute::VAL, 
					nozzle.current);

	controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_ind), 
					UART::Attribute::PICC0, 
					padPicNotActive);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_ind), 
					UART::Attribute::PICC1, 
					padPicActive);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_ind), 
					UART::Attribute::VAL, 
					pad.isEnabled);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_set), 
					UART::Attribute::TXT, 
					pad.set);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_curr), 
					UART::Attribute::VAL, 
					pad.current);

	controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_ind), 
					UART::Attribute::PICC0, 
					coolerPicNotActive);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_ind), 
					UART::Attribute::PICC1, 
					coolerPicActive);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_ind), 
					UART::Attribute::VAL, 
					cooler.isEnabled);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_set), 
					UART::Attribute::TXT, 
					cooler.set);
	controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_curr), 
					UART::Attribute::VAL, 
					cooler.current);
}