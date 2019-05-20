#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"


HomePage::HomePage(ScreenController& controller) :
BasePage(controller) {

	isUpdateFirstTime = true;

	controller.uart.openScreen(UART::Screen::HOME);
	
	if (isScreenDebug) {
		cout << "OK - HomePage::HomePage" << endl;
	}

}


void HomePage::update() {
	updateStatusIndicators();
	updateDisplayIndicators();
	updatePresetBar();
	updateInfo();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
	
}

void HomePage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());
	const auto cpPreset = controller.copiedSettings.common.currentPreset;

	switch(code) {
		case Button::b_nav_print: {
			controller.setCurrentScreen(ScreenController::Screen::PRINT);
			break;
		}
		case Button::b_nav_control: {
			controller.setCurrentScreen(ScreenController::Screen::CONTROL);
			break;
		}
		case Button::b_nav_settings: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case Button::b_hotspot_1: {
			// CODE HERE
			// PrinterController method that enables/disables NOZZLE
			break;
		}
		case Button::b_hotspot_2: {
			// CODE HERE
			// PrinterController method that enables/disables PAD
			break;
		}
		case Button::b_hotspot_3: {
			// CODE HERE
			// PrinterController method that enables/disables FAN
			break;
		}
		
		// change_preset_start()
		case Button::b_preset_1:{
			if (isScreenDebug) 
				cout << "OK - HomePage::touch - Button PLA" << endl;

			controller.printer->change_preset_start(PrinterVariables::Common::Preset::PLA);
			if (cpPreset == PrinterVariables::Common::Preset::PLA) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_1), 
					UART::Attribute::VAL, 1);
			}
			break;
		}	
		case Button::b_preset_2:{
			if (isScreenDebug) 
				cout << "OK - HomePage::touch - Button ABS" << endl;

			controller.printer->change_preset_start(PrinterVariables::Common::Preset::ABS);
			if (cpPreset == PrinterVariables::Common::Preset::ABS) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_2), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_3:{
			if (isScreenDebug) 
				cout << "OK - HomePage::touch - Button PVA" << endl;

			controller.printer->change_preset_start(PrinterVariables::Common::Preset::PVA);
			if (cpPreset == PrinterVariables::Common::Preset::PVA) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_3), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_4:{
			if (isScreenDebug) 
				cout << "OK - HomePage::touch - Button PRESET1" << endl;

			controller.printer->change_preset_start(PrinterVariables::Common::Preset::PRESET1);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET1) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_4), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_5:{
			if (isScreenDebug) 
				cout << "OK - HomePage::touch - Button PRESET2" << endl;

			controller.printer->change_preset_start(PrinterVariables::Common::Preset::PRESET2);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET2) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_5), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_6: {
			if (isScreenDebug) 
				cout << "OK - HomePage::touch - Button PRESET3" << endl;
			
			controller.printer->change_preset_start(PrinterVariables::Common::Preset::PRESET3);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET3) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_6), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		default: {
			cout << "ERROR - HomePage::touch - Unknown code: " << command.front() << endl;
		}
		
	}
	if (isScreenDebug) cout << "OK - HomePage::touch - touch event proceded." << endl;
}

/* Private methods */

void HomePage::updateStatusIndicators() {

	const auto status = controller.printer->settings.status;
	const auto cpStatus = controller.copiedSettings.status;

	if (isUpdateFirstTime || isValueChanged<bool>(status.isPadHot,cpStatus.isPadHot)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_ind_1),
				UART::Attribute::PICC,
				status.isPadHot);
	}

	if (isUpdateFirstTime || isValueChanged<bool>(status.isRodEmpty,cpStatus.isRodEmpty)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_ind_2),
				UART::Attribute::PICC,
				status.isRodEmpty);
	}

	if (isUpdateFirstTime || isValueChanged<bool>(status.isExtruderDirty,cpStatus.isExtruderDirty)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_ind_3), 
				UART::Attribute::PICC, 
				status.isExtruderDirty);
	}

	if (isUpdateFirstTime || isValueChanged<bool>(status.isRodBroken,cpStatus.isRodBroken)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_ind_4), 
				UART::Attribute::PICC, 
				status.isRodBroken);
	}

}

void HomePage::updateDisplayIndicators() {

	const auto nozzle 		= controller.printer->settings.common.nozzle;
	const auto pad 			= controller.printer->settings.common.pad;
	const auto cooler 		= controller.printer->settings.common.cooler;

	const auto cpNozzle 	= controller.copiedSettings.common.nozzle;
	const auto cpPad 		= controller.copiedSettings.common.pad;
	const auto cpCooler 	= controller.copiedSettings.common.cooler;

	/// MAX VALUES SHOULD NOT EQUAL 0
	int nozzlePicNotActive 	= minNotActive + (((float)nozzle.current / nozzle.max) * rangeNotActive);
	int nozzlePicActive 	= minActive + (((float)nozzle.current / nozzle.max) * rangeActive);

	int padPicNotActive 	= minNotActive + (((float)pad.current / pad.max) * rangeNotActive);
	int padPicActive 		= minActive + (((float)pad.current / pad.max) * rangeActive);
	
	int coolerPicNotActive 	= minNotActive + (((float)cooler.current / cooler.max) * rangeNotActive);
	int coolerPicActive 	= minActive + (((float)cooler.current / cooler.max) * rangeActive);

	// Error prevention

	if (nozzlePicActive > maxActive || nozzlePicNotActive > maxNotActive) {
		nozzlePicActive = maxActive;
		nozzlePicNotActive = maxNotActive;
	}
	if (padPicActive > maxActive || padPicNotActive > maxNotActive) {
		padPicActive = maxActive;
		padPicNotActive = maxNotActive;
	}
	if (coolerPicActive > maxActive || coolerPicNotActive > maxNotActive) {
		coolerPicActive = maxActive;
		coolerPicNotActive = maxNotActive;
	}

	int cpNozzlePicNotActive = minNotActive + (((float)cpNozzle.current / cpNozzle.max) * rangeNotActive);
	int cpNozzlePicActive 	= minActive + (((float)cpNozzle.current / cpNozzle.max) * rangeActive);

	int cpPadPicNotActive 	= minNotActive + (((float)cpPad.current / cpPad.max) * rangeNotActive);
	int cpPadPicActive 		= minActive + (((float)cpPad.current / cpPad.max) * rangeActive);
	
	int cpCoolerPicNotActive = minNotActive + (((float)cpCooler.current / cpCooler.max) * rangeNotActive);
	int cpCoolerPicActive 	= minActive + (((float)cpCooler.current / cpCooler.max) * rangeActive);

	if (cpNozzlePicActive > maxActive || cpNozzlePicNotActive > maxNotActive) {
		cpNozzlePicNotActive = maxNotActive;
		cpNozzlePicActive = maxActive;
	}
	if (cpPadPicActive > maxActive || cpPadPicNotActive > maxNotActive) {
		cpPadPicNotActive = maxNotActive;
		cpPadPicActive = maxActive;
	}
	if (cpCoolerPicActive > maxActive || cpCoolerPicNotActive > maxNotActive) {
		cpCoolerPicNotActive = maxNotActive;
		cpCoolerPicActive = maxActive;
	}

	// Nozzle
	if (isUpdateFirstTime || nozzle.isEnabled != cpNozzle.isEnabled) {
	controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_ind), 
				UART::Attribute::VAL, 
				nozzle.isEnabled);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_nozzle_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_nozzle_curr));
	}
	if (isUpdateFirstTime || nozzlePicNotActive != cpNozzlePicNotActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_ind), 
				UART::Attribute::PIC0, 
				nozzlePicNotActive);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_nozzle_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_nozzle_curr));
	}
	if (isUpdateFirstTime || nozzlePicActive != cpNozzlePicActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_ind), 
				UART::Attribute::PIC1, 
				nozzlePicActive);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_nozzle_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_nozzle_curr));
	}
	if (isUpdateFirstTime || nozzle.set != cpNozzle.set) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_set), 
				UART::Attribute::TXT, 
				nozzle.set);
	}
	if (isUpdateFirstTime || nozzle.current != cpNozzle.current) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_nozzle_curr), 
				UART::Attribute::VAL, 
				nozzle.current);
	}

	// Pad
	if (isUpdateFirstTime || pad.isEnabled != cpPad.isEnabled) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_ind), 
				UART::Attribute::VAL, 
				pad.isEnabled);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_pad_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_pad_curr));
	}
	if (isUpdateFirstTime || padPicNotActive != cpPadPicNotActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_ind), 
				UART::Attribute::PIC0, 
				padPicNotActive);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_pad_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_pad_curr));
	}
	if (isUpdateFirstTime || padPicActive != cpPadPicActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_ind), 
				UART::Attribute::PIC1, 
				padPicActive);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_pad_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_pad_curr));
	}
	if (isUpdateFirstTime || padPicActive != cpPadPicActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_set), 
				UART::Attribute::TXT, 
				pad.set);
	}
	if (isUpdateFirstTime || pad.current != cpPad.current) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_pad_curr), 
				UART::Attribute::VAL, 
				pad.current);
	}

	// Cooler
	if (isUpdateFirstTime || cooler.isEnabled != cpCooler.isEnabled) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_ind), 
				UART::Attribute::VAL, 
				cooler.isEnabled);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_fan_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_fan_curr));
	}
	if (isUpdateFirstTime || coolerPicNotActive != cpCoolerPicNotActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_ind), 
				UART::Attribute::PIC0, 
				coolerPicNotActive);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_fan_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_fan_curr));
	}
	if (isUpdateFirstTime || coolerPicActive != cpCoolerPicActive) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_ind), 
				UART::Attribute::PIC1, 
				coolerPicActive);
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_fan_set));
		controller.uart.refreshIndicator(indicator2string(Indicator::bi_fan_curr));
	}
	if (isUpdateFirstTime || cooler.set != cpCooler.set) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_set), 
				UART::Attribute::TXT, 
				cooler.set);
	}
	if (isUpdateFirstTime || cooler.current != cpCooler.current) {
		controller.uart.updateIndicator(indicator2string(Indicator::bi_fan_curr), 
				UART::Attribute::VAL, 
				cooler.current);
	}

}

void HomePage::updatePresetBar() {

	const auto preset = controller.printer->settings.common.currentPreset;
	const auto cpPreset = controller.copiedSettings.common.currentPreset;

	if(isUpdateFirstTime || preset != cpPreset) {

		// getting buttons active state
		bool presetOneActive = preset == PrinterVariables::Common::Preset::PLA;
		bool presetTwoActive = preset == PrinterVariables::Common::Preset::ABS;
		bool presetThreeActive = preset == PrinterVariables::Common::Preset::PVA;
		bool presetFourActive = preset == PrinterVariables::Common::Preset::PRESET1;
		bool presetFiveActive = preset == PrinterVariables::Common::Preset::PRESET2;
		bool presetSixActive = preset == PrinterVariables::Common::Preset::PRESET3;

		// checking only for changed buttons
		if (cpPreset == PrinterVariables::Common::Preset::PLA || 
			preset == PrinterVariables::Common::Preset::PLA) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_preset_1), 
				UART::Attribute::VAL, 
				presetOneActive);			
		}

		if (cpPreset == PrinterVariables::Common::Preset::ABS || 
			preset == PrinterVariables::Common::Preset::ABS) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_preset_2), 
				UART::Attribute::VAL, 
				presetTwoActive);
		}

		if (cpPreset == PrinterVariables::Common::Preset::PVA || 
		preset == PrinterVariables::Common::Preset::PVA) {	
			controller.uart.updateIndicator(indicator2string(Indicator::b_preset_3), 
				UART::Attribute::VAL, 
				presetThreeActive);
		}

		if (cpPreset == PrinterVariables::Common::Preset::PRESET1 || 
			preset == PrinterVariables::Common::Preset::PRESET1) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_preset_4), 
				UART::Attribute::VAL, 
				presetFourActive);
		}	

		if (cpPreset == PrinterVariables::Common::Preset::PRESET2 || 
			preset == PrinterVariables::Common::Preset::PRESET2) {	
			controller.uart.updateIndicator(indicator2string(Indicator::b_preset_5), 
				UART::Attribute::VAL, 
				presetFiveActive);
		}

		if (cpPreset == PrinterVariables::Common::Preset::PRESET3 || 
			preset == PrinterVariables::Common::Preset::PRESET3) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_preset_6), 
				UART::Attribute::VAL, 
				presetSixActive);
		}

	}

}

void HomePage::updateInfo() {

	const auto infoLine = controller.printer->settings.common.infoLine;
	const auto cpInfoLine = controller.copiedSettings.common.infoLine;

	const auto isThinking = controller.printer->settings.common.isThinking;
	const auto cpIsThinking = controller.copiedSettings.common.isThinking;

	if (isUpdateFirstTime || isThinking != cpIsThinking) {
		controller.uart.updateTimer(isThinking);
	}

	if (isUpdateFirstTime || infoLine != cpInfoLine) {
		// CODE FOR INFO LINE
	}

}

string HomePage::indicator2string(const Indicator& code) const {

	switch(code) {
		case Indicator::i_ind_1: 
			return "i_ind_1";
		case Indicator::i_ind_2: 
			return "i_ind_2";
		case Indicator::i_ind_3: 
			return "i_ind_3";
		case Indicator::i_ind_4: 
			return "i_ind_4";
		case Indicator::bi_nozzle_ind: 
			return "bi_nozzle_ind";
		case Indicator::bi_nozzle_set: 
			return "bi_nozzle_set";
		case Indicator::bi_nozzle_curr: 
			return "bi_nozzle_curr";
		case Indicator::bi_pad_ind: 
			return "bi_pad_ind";
		case Indicator::bi_pad_set: 
			return "bi_pad_set";
		case Indicator::bi_pad_curr: 
			return "bi_pad_curr";
		case Indicator::bi_fan_ind: 
			return "bi_fan_ind";
		case Indicator::bi_fan_set: 
			return "bi_fan_set";
		case Indicator::bi_fan_curr: 
			return "bi_fan_curr";
		case Indicator::i_gif_loading: 
			return "i_gif_loading";
		case Indicator::i_info_text: 
			return "i_info_text";
		case Indicator::b_preset_1:
			return "b_preset_1";
		case Indicator::b_preset_2:
			return "b_preset_2";
		case Indicator::b_preset_3:
			return "b_preset_3";
		case Indicator::b_preset_4:
			return "b_preset_4";
		case Indicator::b_preset_5:
			return "b_preset_5";
		case Indicator::b_preset_6:
			return "b_preset_6";
		default: {
			cout << "ERROR - HomePage::Indicator2String" << endl;
			return "";
		}

	}

}
