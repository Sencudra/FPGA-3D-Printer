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

	updateindicators();

	cout << "SettingsPage::update" << endl;
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
			cout << "Button PRECISION 100" << endl;
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P100);
			if (cpPrecision == PrinterVariables::Common::Precision::P100) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_1), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_2: {
			cout << "Button PRECISION 10" << endl;
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P10);
			if (cpPrecision == PrinterVariables::Common::Precision::P10) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_2), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_3: {
			cout << "Button PRECISION 1" << endl;
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P1);
			if (cpPrecision == PrinterVariables::Common::Precision::P1) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_3), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_4: {
			cout << "Button PRECISION 0.1" << endl;
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P01);
			if (cpPrecision == PrinterVariables::Common::Precision::P01) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_4), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_precis_5: {
			cout << "Button PRECISION 0.01" << endl;
			controller.printer->setNewPrecisionValue(PrinterVariables::Common::Precision::P001);
			if (cpPrecision == PrinterVariables::Common::Precision::P001) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_precis_5), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_reset_def: {
			controller.printer->restore_default_general_settings();
			break;
		}
		case Button::b_save: {
			controller.printer->save_general_settings();
			break;
		}
		case Button::b_r1_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}

		case Button::b_r2_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r3_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r4_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r5_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r6_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r7_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r8_minus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r1_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r2_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r3_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r4_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r5_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r6_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r7_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_r8_plus: {
			//controller.printer->change_general_settings(0);
			break;
		}
		case Button::b_temp_auto: {
			// CODE HERE
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
	const auto parametrs = controller.printer->settings.position;
	const auto cpParametrs = controller.copiedSettings.position;

	if (isUpdateFirstTime || isValueChanged<float>(parametrs.x, cpParametrs.x)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_x),
				UART::Attribute::TXT,
				parametrs.x);
	}
}

string SettingsPage::indicator2string(const Indicator& code) const {
	switch(code) {
		case Indicator::i_gif_loading:
			return "i_gif_loading";
		case Indicator::i_nozzle:
			return "i_nozzle";
		case Indicator::i_gif_loading:
			return "i_pad";
		case Indicator::i_gif_loading:
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
		default: {
			cout << "ERROR - ControlPage::Indicator2String" << endl;
			return "";
		}

	}

}