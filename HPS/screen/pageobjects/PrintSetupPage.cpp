#include <iostream>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"


/* Constructors and destructors */

PrintSetupPage::PrintSetupPage(ScreenController& controller) :
BasePage(controller) {
	isUpdateFirstTime = true;
	controller.uart.openScreen(UART::Screen::PRINT_SETUP);
	cout << "OK - PrintSetupPage::PrintSetupPage" << endl;
}


/* Public Methods */

void PrintSetupPage::update() {
	updateIndicators();
	updatePresetBar();
	updatePrecisionBar();
	if (isUpdateFirstTime) {
		isUpdateFirstTime = false;
	}
	
}

void PrintSetupPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());
	const auto cpPreset = controller.copiedSettings.common.currentPreset;
	const auto cpPrecision = controller.copiedSettings.common.currentPrecision;

	switch(code) {
		case Button::b_start_print: {
			// Here should be warning page and then redirect to printing page;
			BasePage* warning = new WarningPage(
						controller,
						ScreenController::Screen::PRINTING,
						ScreenController::Screen::PRINT_SETUP,
						WarningPage::Reason::FOR_PRINT);
			break;
		}
		case Button::b_return: {
			// Here should be warning page and then redirect to print page;
			BasePage* warning = new WarningPage(
						controller,
						ScreenController::Screen::PRINT,
						ScreenController::Screen::PRINT_SETUP,
						WarningPage::Reason::FOR_CANCELING_SETUP);
			break;
		}
		case Button::b_preset_1: {
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PLA);
			if (cpPreset == PrinterVariables::Common::Preset::PLA) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_1), 
					UART::Attribute::VAL, 1);
			}
			break;				
		}
		case Button::b_preset_2: {
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::ABS);
			if (cpPreset == PrinterVariables::Common::Preset::ABS) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_2), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_3: {
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PVA);
			if (cpPreset == PrinterVariables::Common::Preset::PVA) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_3), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_4: {
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PRESET1);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET1) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_4), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_5: {
			controller.printer->setNewPresetValue(PrinterVariables::Common::Preset::PRESET2);
			if (cpPreset == PrinterVariables::Common::Preset::PRESET2) {
					controller.uart.updateIndicator(indicator2string(Indicator::b_preset_5), 
					UART::Attribute::VAL, 1);
			}
			break;
		}
		case Button::b_preset_6: {
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
			controller.printer->print_settings(SlicingParameters::Layer_Width_Minus);
			break;
		}
		case Button::b_r2_minus: {
			controller.printer->print_settings(SlicingParameters::Base_Thicknes_Minus);
			break;
		}
		case Button::b_r3_minus: {
			controller.printer->print_settings(SlicingParameters::Filling_Density_Minus);
			break;
		}
		case Button::b_r1_plus: {
			controller.printer->print_settings(SlicingParameters::Layer_Width_Plus);
			break;
		}
		case Button::b_r2_plus: {
			controller.printer->print_settings(SlicingParameters::Base_Thicknes_Plus);
			break;
		}
		case Button::b_r3_plus: {
			controller.printer->print_settings(SlicingParameters::Filling_Density_Plus);
			break;
		}
		default: {
			cout << "ERROR - PrintSetupPage::touch - Unknown code: " << command.front() << endl;
		}
		
	}
	cout << "OK - PrintSetupPage::touch - touch event proceded." << endl;
}

/* Private Methods */

void PrintSetupPage::updateIndicators() {

	const auto slicer = controller.printer->settings.slicer;
	const auto cpSlicer = controller.copiedSettings.slicer;

	if (isUpdateFirstTime || slicer.layerWidth != cpSlicer.layerWidth) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_layer_w), 
				UART::Attribute::TXT, 
				slicer.layerWidth);
	}

	if (isUpdateFirstTime || slicer.baseThicknes != cpSlicer.baseThicknes) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_base_t), 
				UART::Attribute::TXT, 
				slicer.baseThicknes);
	}

	if (isUpdateFirstTime || slicer.fillingDensity != cpSlicer.fillingDensity) {
		controller.uart.updateIndicator(indicator2string(Indicator::i_fiiling_d), 
				UART::Attribute::TXT, 
				slicer.fillingDensity);
	}

}

void PrintSetupPage::updatePresetBar() {

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

void PrintSetupPage::updatePrecisionBar() {
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

string PrintSetupPage::indicator2string(const Indicator& code) const {

	switch(code) {
		case Indicator::i_layer_w: 
			return "i_layer_w";
		case Indicator::i_base_t: 
			return "i_base_t";
		case Indicator::i_fiiling_d: 
			return "i_fiiling_d";
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
			cout << "ERROR - PrintSetupPage::Indicator2String" << endl;
			return "";
		}

	}

}
