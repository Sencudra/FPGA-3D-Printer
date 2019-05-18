#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"
#include "types.h"

SettingsMovStepsPage::SettingsMovStepsPage(ScreenController& controller) :
BasePage(controller) {
	isUpdateFirstTime = true;
	controller.uart.openScreen(UART::Screen::SETTINGS_M_STE);
	if (isScreenDebug) cout << "OK - SettingsMovStepsPage::SettingsMovStepsPage" << endl;
}

void SettingsMovStepsPage::update() {
	updatePrecisionBar();
	updateIndicators();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
}

void SettingsMovStepsPage::touch(vector<int>& command) {

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
		case Button::b_speed: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS_M_SPE);
			break;
		}

		case Button::b_r1_minus: {
			controller.printer->change_movement_steps(StepsSettings::Steps_X_Minus);
			break;
		}
		case Button::b_r2_minus: {
			controller.printer->change_movement_steps(StepsSettings::Steps_Y_Minus);
			break;
		}
		case Button::b_r3_minus: {
			controller.printer->change_movement_steps(StepsSettings::Steps_Z_Minus);
			break;
		}
		case Button::b_r1_plus: {
			controller.printer->change_movement_steps(StepsSettings::Steps_X_Plus);
			break;
		}
		case Button::b_r2_plus: {
			controller.printer->change_movement_steps(StepsSettings::Steps_Y_Plus);
			break;
		}
		case Button::b_r3_plus: {
			controller.printer->change_movement_steps(StepsSettings::Steps_Z_Plus);
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
				
			} else {
				cout << "SHOULD RUN controller.printer->save_movement_steps();" << endl;
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

void SettingsMovStepsPage::updateIndicators() {
	const auto steps = controller.printer->settings.movement.steps;
	const auto cpSteps = controller.copiedSettings.movement.steps;

	if (isUpdateFirstTime || isValueChanged<float>(steps.steps_x, cpSteps.steps_x)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_x),
				UART::Attribute::TXT,
				steps.steps_x);
		cout << "ASDF" << endl;
	}
	if (isUpdateFirstTime || isValueChanged<float>(steps.steps_y, cpSteps.steps_y)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_y),
				UART::Attribute::TXT,
				steps.steps_y);
	}
	if (isUpdateFirstTime || isValueChanged<float>(steps.steps_z, cpSteps.steps_z)) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_z),
				UART::Attribute::TXT,
				steps.steps_z);
	}

}

void SettingsMovStepsPage::updatePrecisionBar() {
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

string SettingsMovStepsPage::indicator2string(const Indicator& code) const {
	switch(code) {
		case Indicator::b_precis_1:
			return "bt6";
		case Indicator::b_precis_2:
			return "bt7";
		case Indicator::b_precis_3:
			return "bt8";
		case Indicator::b_precis_4:
			return "bt9";
		case Indicator::b_precis_5:
			return "bt10";
		case Indicator::i_x:
			return "t0";
		case Indicator::i_y:
			return "t1";
		case Indicator::i_z:
			return "t2";
		case Indicator::i_e:
			return "i_e";
		default: {
			cout << "ERROR - SettingsMovStepsPage::Indicator2String" << endl;
			return "";
		}

	}

}
