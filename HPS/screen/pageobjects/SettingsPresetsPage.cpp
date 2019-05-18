#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"
#include "types.h"

SettingsPresetsPage::SettingsPresetsPage(ScreenController& controller) :
BasePage(controller) {
	isUpdateFirstTime = true;
	controller.uart.openScreen(UART::Screen::SETTINGS_P);
	cout << "OK - SettingsPresetsPage::SettingsPresetsPage" << endl;
}

void SettingsPresetsPage::update() {
	updatePresetBar();
	updatePrecisionBar();
	updateIndicators();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
}

void SettingsPresetsPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());
	const auto cpPrecision = controller.copiedSettings.common.currentPrecision;
	const auto cpPreset = controller.copiedSettings.common.currentPreset;

	switch(code) {
		case Button::b_general: {
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
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

		case Button::b_preset_1: {
			isUpdateFirstTime = true;
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PLA);
			if (cpPreset == PrinterVariables::Common::Preset::PLA) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_1), 
					UART::Attribute::VAL, 1);
					isUpdateFirstTime = true;
			}
			break;				
		}
		case Button::b_preset_2: {
			isUpdateFirstTime = true;
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::ABS);
			if (cpPreset == PrinterVariables::Common::Preset::ABS) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_2), 
					UART::Attribute::VAL, 1);
					

			}
			break;
		}
		case Button::b_preset_3: {
			isUpdateFirstTime = true;
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PVA);
			if (cpPreset == PrinterVariables::Common::Preset::PVA) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_3), 
					UART::Attribute::VAL, 1);
					
			}
			break;
		}
		case Button::b_preset_4: {
			isUpdateFirstTime = true;
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PRESET1);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET1) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_4), 
					UART::Attribute::VAL, 1);
					
			}
			break;
		}
		case Button::b_preset_5: {
			isUpdateFirstTime = true;
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PRESET2);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET2) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_5), 
					UART::Attribute::VAL, 1);
					
			}
			break;
		}
		case Button::b_preset_6: {
			isUpdateFirstTime = true;
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PRESET3);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET3) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_6), 
					UART::Attribute::VAL, 1);

			}
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

		case Button::b_r1_minus: {
			controller.printer->change_preset_settings(PreprintSetup::Nozzle_Minus);
			isUpdateFirstTime = true;
			break;
		}
		case Button::b_r2_minus: {
			controller.printer->change_preset_settings(PreprintSetup::Pad_Minus);
			isUpdateFirstTime = true;
			break;
		}
		case Button::b_r3_minus: {
			controller.printer->change_preset_settings(PreprintSetup::Cooler_Plus);
			isUpdateFirstTime = true;
			break;
		}
		case Button::b_r1_plus: {
			controller.printer->change_preset_settings(PreprintSetup::Nozzle_Plus);
			isUpdateFirstTime = true;
			break;
		}
		case Button::b_r2_plus: {
			controller.printer->change_preset_settings(PreprintSetup::Pad_Plus);
			isUpdateFirstTime = true;
			break;
		}
		case Button::b_r3_plus: {
			controller.printer->change_preset_settings(PreprintSetup::Cooler_Plus);
			isUpdateFirstTime = true;
			break;
		}
		case Button::b_reset_def: {
			controller.printer->restore_default_preset_settings();
			break;
		}
		case Button::b_save: {
			controller.printer->save_preset_settings();
			break;
		}
		default: {
			cout << "ERROR - SettingsPresetsPage::touch - Unknown code: " << (int) code << endl;
		}

	}

	cout << "OK - SettingsPresetsPage::touch - touch event proceded." << endl;
}

/* Private types */

void SettingsPresetsPage::updateIndicators() {
	const auto preset = controller.printer->settings.common.currentPreset;
	const auto cpPreset = controller.copiedSettings.common.currentPreset;

	const auto presetLib = controller.printer->settings.presets;
	const auto cpPresetLib = controller.copiedSettings.presets;

	int cpNozzle;
	int cpPad;
	int cpCooler;

	int nozzle;
	int pad;
	int cooler;

	bool isChanged = false;

	if (isUpdateFirstTime || preset != cpPreset) {
		switch(preset) {
			case PrinterVariables::Common::Preset::PLA: {
				cpNozzle 	= cpPresetLib.PLA.nozzle;
				cpPad 		= cpPresetLib.PLA.pad;
		 		cpCooler 	= cpPresetLib.PLA.cooler;
				nozzle 		= presetLib.PLA.nozzle;
				pad 		= presetLib.PLA.pad;
				cooler 		= presetLib.PLA.cooler;
				isChanged 	= true;
				break;
			}
			case PrinterVariables::Common::Preset::ABS: {
				cpNozzle 	= cpPresetLib.ABS.nozzle;
				cpPad 		= cpPresetLib.ABS.pad;
		 		cpCooler 	= cpPresetLib.ABS.cooler;
				nozzle 		= presetLib.ABS.nozzle;
				pad 		= presetLib.ABS.pad;
				cooler 		= presetLib.ABS.cooler;
				isChanged 	= true;
				break;
			}
			case PrinterVariables::Common::Preset::PVA: {
				cpNozzle 	= cpPresetLib.PVA.nozzle;
				cpPad 		= cpPresetLib.PVA.pad;
		 		cpCooler 	= cpPresetLib.PVA.cooler;
				nozzle 		= presetLib.PVA.nozzle;
				pad 		= presetLib.PVA.pad;
				cooler 		= presetLib.PVA.cooler;
				isChanged 	= true;
				break;
			}
			case PrinterVariables::Common::Preset::PRESET1: {
				cpNozzle 	= cpPresetLib.Preset1.nozzle;
				cpPad 		= cpPresetLib.Preset1.pad;
		 		cpCooler 	= cpPresetLib.Preset1.cooler;
				nozzle 		= presetLib.Preset1.nozzle;
				pad 		= presetLib.Preset1.pad;
				cooler 		= presetLib.Preset1.cooler;
				isChanged 	= true;
				break;
			}
			case PrinterVariables::Common::Preset::PRESET2: {
				cpNozzle 	= cpPresetLib.Preset2.nozzle;
				cpPad 		= cpPresetLib.Preset2.pad;
		 		cpCooler 	= cpPresetLib.Preset2.cooler;
				nozzle 		= presetLib.Preset2.nozzle;
				pad 		= presetLib.Preset2.pad;
				cooler 		= presetLib.Preset2.cooler;
				isChanged 	= true;
				break;
			}
			case PrinterVariables::Common::Preset::PRESET3: {
				cpNozzle 	= cpPresetLib.Preset3.nozzle;
				cpPad 		= cpPresetLib.Preset3.pad;
		 		cpCooler 	= cpPresetLib.Preset3.cooler;
				nozzle 		= presetLib.Preset3.nozzle;
				pad 		= presetLib.Preset3.pad;
				cooler 		= presetLib.Preset3.cooler;
				isChanged 	= true;
				break;
			}
			default: {
				break;
			}

		}

	}
	if (isChanged){
		if (isUpdateFirstTime || isValueChanged<int>(cpNozzle, nozzle)) {
			controller.uart.updateIndicator(indicator2string(Indicator::i_nozzle),
					UART::Attribute::TXT,
					nozzle);
		}
		if (isUpdateFirstTime || isValueChanged<int>(cpPad, pad)) {
			controller.uart.updateIndicator(indicator2string(Indicator::i_pad),
					UART::Attribute::TXT,
					pad);
		}
		if (isUpdateFirstTime || isValueChanged<int>(cpCooler, cooler)) {
			controller.uart.updateIndicator(indicator2string(Indicator::i_cooler),
					UART::Attribute::TXT,
					cooler);
		}

	}
	
}

void SettingsPresetsPage::updatePresetBar() {

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

void SettingsPresetsPage::updatePrecisionBar() {
	// 		// { P100 = 10000, P10 = 1000, P1 = 100, P01 = 10, P001 = 1};

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

string SettingsPresetsPage::indicator2string(const Indicator& code) const {
	switch(code) {
		case Indicator::i_nozzle:
			return "i_nozzle";
		case Indicator::i_pad:
			return "i_pad";
		case Indicator::i_cooler:
			return "i_cooler";
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
			cout << "ERROR - SettingsPresetsPage::Indicator2String" << endl;
			return "";
		}

	}

}
