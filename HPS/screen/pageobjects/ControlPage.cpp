#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"

ControlPage::ControlPage(ScreenController& controller) :
BasePage(controller) {

	isUpdateFirstTime = true;

	controller.uart.openScreen(UART::Screen::CONTROL);

	cout << "OK - ControlPage::ControlPage" << endl;
}

void ControlPage::update() {

	updatePrecisionBar();
	updateInfo();
	updateVariables();

	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
	
}

void ControlPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());
	const auto cpPrecision = controller.copiedSettings.common.currentPrecision;

	switch(code) {
		case Button::b_nav_home: {
			controller.setCurrentScreen(ScreenController::Screen::HOME);
			break;
		}
		case Button::b_nav_print: {
			controller.setCurrentScreen(ScreenController::Screen::PRINT);
			break;
		}
		case Button::b_nav_settings: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case Button::b_precis_1: {
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P100);
			if (cpPrecision == PrinterVariables::Common::Precision::P100) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_1), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_2: {
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P10);
			if (cpPrecision == PrinterVariables::Common::Precision::P10) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_2), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_3: {
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P1);
			if (cpPrecision == PrinterVariables::Common::Precision::P1) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_3), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_4: {
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P01);
			if (cpPrecision == PrinterVariables::Common::Precision::P01) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_4), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_5: {
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P001);
			if (cpPrecision == PrinterVariables::Common::Precision::P001) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_5), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_reset_def: {
			BasePage* warning = new WarningPage(
						controller,
						ScreenController::Screen::CONTROL,
						ScreenController::Screen::CONTROL,
						WarningPage::Reason::FOR_CONTROL_HOME);
			break;
		}
		case Button::b_hor_up: {
			controller.printer->control(DrivingControl::Y_Plus);
			break;
		}
		case Button::b_hor_down: {
			controller.printer->control(DrivingControl::Y_Minus);
			break;
		}
		case Button::b_hor_left: {
			controller.printer->control(DrivingControl::X_Minus);
			break;
		}
		case Button::b_hor_right: {
			controller.printer->control(DrivingControl::X_Plus);
			break;
		}
		case Button::b_ver_up: {
			controller.printer->control(DrivingControl::Z_Plus);
			break;
		}
		case Button::b_ver_down: {
			controller.printer->control(DrivingControl::Z_Minus);
			break;
		}
		case Button::b_ext_up: {
			controller.printer->control(DrivingControl::E_Plus);
			break;
		}
		case Button::b_ext_down: {
			controller.printer->control(DrivingControl::E_Minus);
			break;
		}
		case Button::b_autocalib: {
			// TODO
			//controller.printer->home();
			break;
		}
		default: {
			cout << "ERROR - ControlPage::touch - Unknown code: " << (int) code << endl;
		}

	}

	if (isScreenDebug) cout << "OK - ControlPage::touch - touch event proceded." << endl;
}

/* Private methods */

void ControlPage::updatePrecisionBar() {
	// // { P100 = 10000, P10 = 1000, P1 = 100, P01 = 10, P001 = 1};

	const auto precision = controller.printer->settings.common.currentPrecision;
	const auto cpPrecision = controller.copiedSettings.common.currentPrecision;

	if(isUpdateFirstTime || precision != cpPrecision) {

		// getting buttons active state
		bool precisionOneActive = precision == PrinterVariables::Common::Precision::P100;
		bool precisionTwoActive = precision == PrinterVariables::Common::Precision::P10;
		bool precisionThreeActive = precision == PrinterVariables::Common::Precision::P1;
		bool precisionFourActive = precision == PrinterVariables::Common::Precision::P01;
		bool precisionFiveActive = precision == PrinterVariables::Common::Precision::P001;

		// checking only for changed buttons
		if (cpPrecision == PrinterVariables::Common::Precision::P100 || 
			precision == PrinterVariables::Common::Precision::P100) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_precis_1), 
				UART::Attribute::VAL, 
				precisionOneActive);			
		}

		if (cpPrecision == PrinterVariables::Common::Precision::P10 || 
			precision == PrinterVariables::Common::Precision::P10) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_precis_2), 
				UART::Attribute::VAL, 
				precisionTwoActive);
		}

		if (cpPrecision == PrinterVariables::Common::Precision::P1 || 
		precision == PrinterVariables::Common::Precision::P1) {	
			controller.uart.updateIndicator(indicator2string(Indicator::b_precis_3), 
				UART::Attribute::VAL, 
				precisionThreeActive);
		}

		if (cpPrecision == PrinterVariables::Common::Precision::P01 || 
			precision == PrinterVariables::Common::Precision::P01) {
			controller.uart.updateIndicator(indicator2string(Indicator::b_precis_4), 
				UART::Attribute::VAL, 
				precisionFourActive);
		}	

		if (cpPrecision == PrinterVariables::Common::Precision::P001 || 
			precision == PrinterVariables::Common::Precision::P001) {	
			controller.uart.updateIndicator(indicator2string(Indicator::b_precis_5), 
				UART::Attribute::VAL, 
				precisionFiveActive);
		}

	}

}

void ControlPage::updateInfo() {

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

void ControlPage::updateVariables() {
	const auto parametrs = controller.printer->settings.position;
	const auto cpParametrs = controller.copiedSettings.position;

	if (isUpdateFirstTime || isValueChanged<float>(parametrs.x, cpParametrs.x)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_x),
				UART::Attribute::TXT,
				parametrs.x);
	}
	if (isUpdateFirstTime || isValueChanged<float>(parametrs.y, cpParametrs.z)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_y),
				UART::Attribute::TXT,
				parametrs.y);
	}
	if (isUpdateFirstTime || isValueChanged<float>(parametrs.y, cpParametrs.z)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_z),
				UART::Attribute::TXT,
				parametrs.z);
	}
	if (isUpdateFirstTime || isValueChanged<float>(parametrs.y, cpParametrs.z)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_e),
				UART::Attribute::TXT,
				parametrs.e);
	}

}

string ControlPage::indicator2string(const Indicator& code) const {

	switch(code) {
		case Indicator::i_gif_loading:
			return "i_gif_loading";
		case Indicator::i_info_text:
			return "i_info_text";
		case Indicator::i_x:
			return "i_x";
		case Indicator::i_y:
			return "i_y";
		case Indicator::i_z:
			return "i_z";
		case Indicator::i_e:
			return "i_e";
		case Indicator::b_precis_1:
			return "b_precis_1";
		case Indicator::b_precis_2:
			return "b_precis_2";
		case Indicator::b_precis_3:
			return "b_precis_3";
		case Indicator::b_precis_4:
			return "b_precis_4";
		case Indicator::b_precis_5:
			return "b_precis_5";
		default: {
			cout << "ERROR - PrintingPage::Indicator2String" << endl;
			return "";
		}

	}

}
