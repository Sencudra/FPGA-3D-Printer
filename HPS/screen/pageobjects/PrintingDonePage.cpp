#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"

/* Constructors and destructors */

PrintingDonePage::PrintingDonePage(ScreenController& controller) :
BasePage(controller) {
	isUpdateFirstTime = true;
	controller.uart.openScreen(UART::Screen::PRINTING_DONE);	
	if (isScreenDebug) cout << "OK - PrintingDonePage::PrintingDonePage" << endl;
}

/* Public methods */

void PrintingDonePage::update() {
	updatePositionInfo();
	updatePresetInfo();
	updateStatusIndicators();
	updateDisplayIndicators();
	updateInfo();
	updateProcessbar();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
	
}

void PrintingDonePage::updateInfo() {

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

void PrintingDonePage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {
		case Button::b_home: {
			controller.setCurrentScreen(ScreenController::Screen::HOME);
			break;
		}		
		default: {
			cout << "ERROR - PrintingDonePage::touch - Unknown code: " << command.front() << endl;
		}
		
	}
	if (isScreenDebug) cout << "OK - PrintingDonePage::touch - touch event proceded." << endl;
}

/* Private methods */

void PrintingDonePage::updatePositionInfo() {
	const auto position = controller.printer->settings.position;
	const auto cpPosition = controller.copiedSettings.position;

	if (isUpdateFirstTime || isValueChanged<float>(position.x, cpPosition.x)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_info_pos_x),
				UART::Attribute::TXT,
				position.x);
	}
	if (isUpdateFirstTime || isValueChanged<float>(position.y, cpPosition.y)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_info_pos_y),
				UART::Attribute::TXT,
				position.y);
	}
	if (isUpdateFirstTime || isValueChanged<float>(position.z, cpPosition.z)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_info_pos_z),
				UART::Attribute::TXT,
				position.z);
	}

}

void PrintingDonePage::updatePresetInfo() {

	const auto preset = controller.printer->settings.common.currentPreset;
	const auto cpPreset = controller.copiedSettings.common.currentPreset;

	if (isUpdateFirstTime || preset != cpPreset) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_preset),
				UART::Attribute::TXT,
				preset2string(preset));
	}

}

void PrintingDonePage::updateStatusIndicators() {

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

void PrintingDonePage::updateDisplayIndicators() {

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

void PrintingDonePage::updateProcessbar() {
	const auto bar = controller.printer->settings.common.processBar;
	const auto cpBar = controller.copiedSettings.common.processBar;

	if (isUpdateFirstTime || isValueChanged<int>(bar,cpBar)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_process), 
				UART::Attribute::VAL, 
				bar);
	}

}

std::string PrintingDonePage::preset2string(const PrinterVariables::Common::Preset& preset) const {
	switch(preset) {
		case PrinterVariables::Common::Preset::PLA:
			return "PLA";
		case PrinterVariables::Common::Preset::ABS:
			return "ABS";
		case PrinterVariables::Common::Preset::PVA:
			return "PVA";
		case PrinterVariables::Common::Preset::PRESET1:
			return "P1";
		case PrinterVariables::Common::Preset::PRESET2:
			return "P2";
		case PrinterVariables::Common::Preset::PRESET3:
			return "P3";
		default:
			return ":D";
	}

}

string PrintingDonePage::indicator2string(const Indicator& code) const {

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
		case Indicator::i_process:
			return "i_process";
		case Indicator::i_info_pos_x:
			return "i_info_pos_x";
		case Indicator::i_info_pos_y:
			return "i_info_pos_y";
		case Indicator::i_info_pos_z:
			return "i_info_pos_z";
		case Indicator::i_preset:
			return "i_preset";
		default: {
			cout << "ERROR - PrintingDonePage::Indicator2String" << endl;
			return "";
		}

	}

}
