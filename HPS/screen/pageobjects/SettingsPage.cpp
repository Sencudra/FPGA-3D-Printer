#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"
#include "types.h"

SettingsPage::SettingsPage(ScreenController& controller) :
BasePage(controller) {
	isUpdateFirstTime = true;
	controller.uart.openScreen(UART::Screen::SETTINGS);
	cout << "OK - SettingsPage::SettingsPage" << endl;
}

void SettingsPage::update() {
	updatePrecisionBar();
	updateIndicators();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
}

void SettingsPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());
	const auto cpPrecision = controller.copiedSettings.common.currentPrecision;

	switch(code) {
		case Button::b_preprint: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS_P);
			break;
		}
		case Button::b_mov: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS_M_SPE);
			break;
		}
		case Button::b_nav_home: {
			controller.setCurrentScreen(ScreenController::Screen::HOME);
			break;
		}
		case Button::b_nav_print: {
			controller.setCurrentScreen(ScreenController::Screen::PRINT);
			break;
		}
		case Button::b_nav_control: {
			controller.setCurrentScreen(ScreenController::Screen::CONTROL);
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
			if (!isScreenDebug)
				controller.printer->restore_default_general_settings();
			break;
		}
		case Button::b_save: {
			if (!isScreenDebug)
				controller.printer->save_general_settings();
			break;
		}
		case Button::b_r1_minus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(1);
			break;
		}
		case Button::b_r2_minus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(3);
			break;
		}
		case Button::b_r3_minus: {
			// if (isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r4_minus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(6);
			break;
		}
		case Button::b_r5_minus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(8);
			break;
		}
		case Button::b_r6_minus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(10);
			break;
		}
		case Button::b_r7_minus: {
			// if (!isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r8_minus: {
			// if (!isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r1_plus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r2_plus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(2);
			break;
		}
		case Button::b_r3_plus: {
			// if (!isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r4_plus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(7);
			break;
		}
		case Button::b_r5_plus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(9);
			break;
		}
		case Button::b_r6_plus: {
			if (!isScreenDebug)
				controller.printer->change_general_settings(11);
			break;
		}
		case Button::b_r7_plus: {
			// if (!isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r8_plus: {
			// if (!isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_temp_auto: {
			// if (!isScreenDebug)
			// 	controller.printer->change_general_settings(0);
			break;
		}
		default: {
			cout << "ERROR - SettingsPage::touch - Unknown code: " << (int) code << endl;
		}

	}

	cout << "OK - SettingsPage::touch - touch event proceded." << endl;
}

/* Private types */

void SettingsPage::updateIndicators() {

	const auto parametrs = controller.printer->settings.common;
	const auto cpParametrs = controller.copiedSettings.common;

	if (isUpdateFirstTime || isValueChanged<int>(parametrs.nozzle.set, cpParametrs.nozzle.set)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_nozzle),
				UART::Attribute::TXT,
				parametrs.nozzle.set);
	}
	if (isUpdateFirstTime || isValueChanged<int>(parametrs.pad.set, cpParametrs.pad.set)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_pad),
				UART::Attribute::TXT,
				parametrs.pad.set);
	}
	if (isUpdateFirstTime || isValueChanged<int>(parametrs.cooler.set, cpParametrs.cooler.set)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_cooler),
				UART::Attribute::TXT,
				parametrs.cooler.set);
	}
	if (isUpdateFirstTime || isValueChanged<float>(parametrs.PID_P, cpParametrs.PID_P)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_PID_P),
				UART::Attribute::TXT,
				parametrs.PID_P);
	}
	if (isUpdateFirstTime || isValueChanged<float>(parametrs.PID_I, cpParametrs.PID_I)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_PID_I),
				UART::Attribute::TXT,
				parametrs.PID_I);
	}
	if (isUpdateFirstTime || isValueChanged<float>(parametrs.PID_D, cpParametrs.PID_D)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_PID_D),
				UART::Attribute::TXT,
				parametrs.PID_D);
	}
	if (isUpdateFirstTime || isValueChanged<bool>(parametrs.isTemperatureAuto, parametrs.isTemperatureAuto)) {
		controller.uart.updateIndicator(indicator2string(Indicator::b_temp_auto),
				UART::Attribute::VAL,
				parametrs.isTemperatureAuto);
	}
	// ????
	if (isUpdateFirstTime || isValueChanged<int>(1, 1)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_temp_min),
				UART::Attribute::TXT,
				0);
	}
	if (isUpdateFirstTime || isValueChanged<int>(1, 1)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_temp_min),
				UART::Attribute::TXT,
				0);
	}

}

void SettingsPage::updatePrecisionBar() {
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

string SettingsPage::indicator2string(const Indicator& code) const {
	switch(code) {
		case Indicator::i_nozzle:
			return "i_nozzle";
		case Indicator::i_pad:
			return "i_pad";
		case Indicator::i_cooler:
			return "i_cooler";
		case Indicator::i_PID_P:
			return "i_PID_P";
		case Indicator::i_PID_I:
			return "i_PID_I";
		case Indicator::i_PID_D:
			return "i_PID_D";
		case Indicator::i_temp_min:
			return "i_temp_min";
		case Indicator::i_temp_max:
			return "i_temp_max";
		case Indicator::b_temp_auto:
			return "b_temp_auto";
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
			cout << "ERROR - SettingsPage::Indicator2String" << endl;
			return "";
		}

	}

}
