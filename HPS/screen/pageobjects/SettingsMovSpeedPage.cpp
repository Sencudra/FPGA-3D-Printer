#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"
#include "types.h"

SettingsMovSpeedPage::SettingsMovSpeedPage(ScreenController& controller) :
BasePage(controller) {
	isUpdateFirstTime = true;
	controller.uart.openScreen(UART::Screen::SETTINGS_M_SPE);
	cout << "OK - SettingsMovSpeedPage::SettingsMovSpeedPage" << endl;
}

void SettingsMovSpeedPage::update() {
	updatePrecisionBar();
	updateIndicators();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
}

void SettingsMovSpeedPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());
	const auto cpPrecision = controller.copiedSettings.common.currentPrecision;

	switch(code) {
		case Button::b_general: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case Button::b_preprint: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS_P);
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
		case Button::b_steps: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS_M_STE);
			break;
		}

		case Button::b_r1_minus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_X_Minus);
			break;
		}
		case Button::b_r2_minus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_Y_Minus);
			break;
		}
		case Button::b_r3_minus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_Z_Minus);
			break;
		}
		case Button::b_r4_minus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_E_Minus);
			break;
		}
		case Button::b_r1_plus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_X_Plus);
			break;
		}
		case Button::b_r2_plus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_Y_Plus);
			break;
		}
		case Button::b_r3_plus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_Z_Plus);
			break;
		}
		case Button::b_r4_plus: {
			controller.printer->change_movement_speed(SpeedSettings::Speed_E_Plus);
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
			if (!isScreenDebug) {
				controller.printer->restore_default_movement_steps();
			}
			break;
		}
		case Button::b_save: {
			if (!isScreenDebug) {
				controller.printer->save_movement_steps();
			}
			break;
		}
		default: {
			cout << "ERROR - SettingsPage::touch - Unknown code: " << (int) code << endl;
		}

	}

	cout << "OK - SettingsPage::touch - touch event proceded." << endl;
}

/* Private methods */

void SettingsMovSpeedPage::updateIndicators() {
	const auto speed = controller.printer->settings.movement.speed;
	const auto cpSpeed = controller.copiedSettings.movement.speed;

	if (isUpdateFirstTime || isValueChanged<float>(speed.speedX, cpSpeed.speedX)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_x),
				UART::Attribute::TXT,
				speed.speedX);
	}
	if (isUpdateFirstTime || isValueChanged<float>(speed.speedY, cpSpeed.speedY)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_y),
				UART::Attribute::TXT,
				speed.speedY);
	}
	if (isUpdateFirstTime || isValueChanged<float>(speed.speedZ, cpSpeed.speedZ)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_z),
				UART::Attribute::TXT,
				speed.speedZ);
	}
	if (isUpdateFirstTime || isValueChanged<float>(speed.speedE, cpSpeed.speedE)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_e),
				UART::Attribute::TXT,
				speed.speedE);
	}

}

void SettingsMovSpeedPage::updatePrecisionBar() {
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

string SettingsMovSpeedPage::indicator2string(const Indicator& code) const {
	switch(code) {
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
		case Indicator::i_x:
			return "i_x";
		case Indicator::i_y:
			return "i_y";
		case Indicator::i_z:
			return "i_z";
		case Indicator::i_e:
			return "i_e";
		default: {
			cout << "ERROR - SettingsMovSpeedPage::Indicator2String" << endl;
			return "";
		}

	}

}
