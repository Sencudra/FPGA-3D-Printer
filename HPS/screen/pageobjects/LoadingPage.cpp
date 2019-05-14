#include <iostream>

#include "pages.h"
#include "ScreenController.h"
#include "uart.h"


LoadingPage::LoadingPage(ScreenController& controller) : 
BasePage(controller) {
	
	if (isScreenDebug) cout << "OK - LoadingPage::LoadingPage" << endl;	
}

void LoadingPage::update(){

}

void LoadingPage::touch(vector<int>& command) {


}