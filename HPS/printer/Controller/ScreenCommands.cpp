#include "PrinterController.h"

void PrinterController::setNewPresetValue(PrinterVariables::Common::Preset preset) {
	settings.common.currentPreset = preset;
	screen.update();
}