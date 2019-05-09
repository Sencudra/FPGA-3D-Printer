#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "uart.h"


BasePage::BasePage(ScreenController& controller) : 
controller(controller) {

	cout << "OK - BasePage::BasePage" << endl;
}