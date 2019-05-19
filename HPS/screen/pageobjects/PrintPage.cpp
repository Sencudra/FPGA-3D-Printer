#include <iostream>
#include <algorithm>
#include <string>

#include "ScreenController.h"
#include "PrinterController.h"
#include "pages.h"
#include "uart.h"


using namespace std;

/* Constructors and destructors */

PrintPage::PrintPage(ScreenController& controller) :
BasePage(controller) {
	controller.uart.openScreen(UART::Screen::PRINT);
	if (isScreenDebug) 
		cout << "OK - PrintPage::PrintPage" << endl;
}

PrintPage::~PrintPage() {
	//controller.printer->fileManager.disconnectUSB();
}

/* Public methods */

void PrintPage::update() {

	if(!isInit) {
		initialise();
		isInit = true;
	}

	// leave page if usb disconected
	if (!controller.printer->fileManager.isUSBConnected()) {
		controller.setCurrentScreen(ScreenController::Screen::HOME);
	}
}

void PrintPage::touch(vector<int>& command) {

	Button code = static_cast<Button>(command.front());

	switch(code) {
		case Button::b_nav_home:
		{
			controller.setCurrentScreen(ScreenController::Screen::HOME);
			break;
		}
		case Button::b_nav_control:
		{
			controller.setCurrentScreen(ScreenController::Screen::CONTROL);
			break;
		}
		case Button::b_nav_settings:
		{
			controller.setCurrentScreen(ScreenController::Screen::SETTINGS);
			break;
		}
		case Button::b_page_prev: {
			prevPage();
			break;
		}
		case Button::b_page_next: {
			nextPage();
			break;
		}
		case Button::bi_mang_line: {
			rowButtonPressed(0);
			break;
		}
		case Button::bi_file_name_2: {
			rowButtonPressed(1);
			break;
		}
		case Button::bi_file_name_3: {
			rowButtonPressed(2);
			break;
		}
		case Button::bi_file_name_4: {
			rowButtonPressed(3);
			break;
		}
		case Button::bi_file_name_5: {
			rowButtonPressed(4);
			break;
		}
		case Button::bi_file_name_6: {
			rowButtonPressed(5);
			break;
		}
		default: {
			cout << "ERROR - PrintPage::touch - Unknown code: " << (int) code << endl;
		}

	}
	if (isScreenDebug) cout << "OK - PrintPage::touch - touch event proceded." << endl;
}

/* Private methods */

bool PrintPage::initialise() {
	controller.printer->fileManager.connectUSB();
	if (!controller.printer->fileManager.isUSBConnected()) {
		return false;
	}
	changeDirectory();
}

void PrintPage::nextPage() {
	if (currentPage + 1 <= maxPages) {
		currentPage += 1;
	}
	smartUpdate();
}

void PrintPage::prevPage() {
	if (currentPage - 1 >= 1 ) {
		currentPage -= 1;
	}
	smartUpdate();
}

void  PrintPage::rowButtonPressed(int row) {

	if (row >= 0 && row < homePageMaxRowsNumber) {

		// first Page, not home
		if (!(controller.printer->fileManager.isHome()) && currentPage == 1 && row == 0) {
			controller.printer->fileManager.closeDirectory();
			changeDirectory();
		} else {

			auto currentPageFileList = getFilesList(currentPage, controller.printer->fileManager.isHome());
			pair<string, FileManager::FileType> choosedPair;

			if (currentPage == 1 && !(controller.printer->fileManager.isHome())) {

				if (row > currentPageFileList.size()) return;

				choosedPair = currentPageFileList[row - 1];

			} else {

				if (row >= currentPageFileList.size()) return;

				choosedPair = currentPageFileList[row];

			}

			if (choosedPair.second == FileManager::FileType::FILE) {

				// STL
				string fn = choosedPair.first;
				string ext = fn.substr(fn.find_last_of(".") + 1);

				// to lower case 
				transform(ext.begin(), ext.end(), ext.begin(), ::tolower);

				if (ext == "stl") {
					// CHANGE FILE NAME TO WORK WITH FOR PRINTER
					// send choosed file.

					controller.printer->to_slice = controller.printer->fileManager.getCurrentFolder() + "/" + choosedPair.first;

					cout << "OK - PrintPage::rowButtonPressed - to_slice: " << controller.printer->to_slice << endl;

					controller.setCurrentScreen(ScreenController::Screen::PRINT_SETUP);
				}
				// GCODE
				if (ext == "g" || ext == "gcode") {

					string toPrint = controller.printer->fileManager.getCurrentFolder() + "/" + choosedPair.first;

					cout << "OK - PrintPage::rowButtonPressed - to_print: " << toPrint << endl;

					if (!isScreenDebug) {
						controller.printer->to_print = toPrint;
						BasePage* warning = new WarningPage(
							controller,
							ScreenController::Screen::PRINTING,
							ScreenController::Screen::PRINT,
							WarningPage::Reason::FOR_PRINT_GCODE);
					}

				}

			} else if (choosedPair.second == FileManager::FileType::DIRECTORY) {
				controller.printer->fileManager.openDirectory(choosedPair.first);
				changeDirectory();
			} else {
				cout << "ERROR - PrintPage::rowButtonPressed - " << row << " not file, not dir" << endl;
			}

		}

	}

}

void PrintPage::changeDirectory() {
	// Update 

	currentPage = 1;
	list = controller.printer->fileManager.getCurrentDirectoryObjectsList();
	auto isHome = controller.printer->fileManager.isHome();

	// count max pages 
	maxPages = isHome ? ceil((float)list.size() / homePageMaxRowsNumber) : ceil(((float)list.size() - pageMaxRowsNumber) / homePageMaxRowsNumber + 1);	
	smartUpdate();
}


void PrintPage::smartUpdate() {
	updatePageButtons();
	updateInfoLine();
	updateRows();
}

void PrintPage::updatePageButtons() {
	bool prevButtonActive = currentPage != 1 ? true : false;
	bool nextButtonActive = currentPage != maxPages ? true : false;

	int picPrevButton = prevButtonActive ? 299 : 0;
	int pic2PrevButton = prevButtonActive ? 300 : 0;

	int picNextButton = nextButtonActive ? 299: 0;
	int pic2NextButton = nextButtonActive ? 300 : 0;

	string pageNumber = to_string(currentPage) + "/" + to_string(maxPages);

	controller.uart.updateIndicator(indicator2string(Indicator::b_page_prev),
			UART::Attribute::PICC,
			picPrevButton);
	controller.uart.updateIndicator(indicator2string(Indicator::b_page_prev),
			UART::Attribute::PICC2,
			pic2PrevButton);

	controller.uart.updateIndicator(indicator2string(Indicator::b_page_next),
			UART::Attribute::PICC,
			picNextButton);
	controller.uart.updateIndicator(indicator2string(Indicator::b_page_next),
			UART::Attribute::PICC2,
			pic2NextButton);

	controller.uart.updateIndicator(indicator2string(Indicator::i_mang_page),
			UART::Attribute::TXT,
			pageNumber);
}

void PrintPage::updateInfoLine() {

	infoLine = getCurrentFolderName();

	controller.uart.updateIndicator(indicator2string(Indicator::i_filepath),
		UART::Attribute::TXT,
		infoLine);
}

void PrintPage::updateRows() {

	auto isHome = controller.printer->fileManager.isHome();

	if (currentPage == 1 && !isHome) {
		updateRowsIfNotAtHomeAndFirstPage();

	} else {
		updateRowsNormal();
	}

}

void PrintPage::updateRowsIfNotAtHomeAndFirstPage() {

	auto cpList = getFilesList(currentPage, controller.printer->fileManager.isHome());
	
	int row;
	bool condition;

	for (auto& str : cpList) {
		str.first = str.first.length() < maxRowStringLength ? str.first : str.first.substr(str.first.length() - maxRowStringLength);
	} 

	// Manager line
	controller.uart.updateIndicator(indicator2string(Indicator::i_manager_icon),
		UART::Attribute::PIC,
		ind2pic(Icon::UP));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_mang_line),
		UART::Attribute::TXT,
		(string)"..");

	row = 0;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_2),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_2),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 1;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_3),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_3),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 2;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_4),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_4),
		UART::Attribute::TXT,
		condition ? list[row].first : "");

	row = 3;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_5),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_5),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 4;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_6),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_6),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");
}

void PrintPage::updateRowsNormal() {

	auto cpList = getFilesList(currentPage, controller.printer->fileManager.isHome());


	for (auto& str : cpList) {
		if (isScreenDebug) cout << str.first << endl;
		str.first = str.first.length() < maxRowStringLength ? str.first : str.first.substr(str.first.length() - maxRowStringLength);
	} 

	// Manager line
	int row = 0;
	bool condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_manager_icon),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_mang_line),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 1;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_2),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_2),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 2;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_3),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_3),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 3;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_4),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_4),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 4;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_5),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_5),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");

	row = 5;
	condition = cpList.size() > row;
	controller.uart.updateIndicator(indicator2string(Indicator::i_icon_6),
		UART::Attribute::PIC,
		condition ? file2pic(cpList[row].second) : ind2pic(Icon::EMPTY));
	controller.uart.updateIndicator(indicator2string(Indicator::bi_file_name_6),
		UART::Attribute::TXT,
		condition ? cpList[row].first : "");
}

string PrintPage::getCurrentFolderName() {
	string line = controller.printer->fileManager.getCurrentFolder();
	auto found = line.find_last_of("/");
	line = line.substr(found);

	// if longer than 22 symbols
	if (line.length() > 22) {
		line = line.substr(0, 19) + "...";
	}

	return line;
}

vector<pair<string, FileManager::FileType>> PrintPage::getFilesList(int page, bool isHome) const {

	if (page < 1) {
        return vector<pair<string, FileManager::FileType>>();
    }

    if (isHome) { // нет возврата
        int offset =  homePageMaxRowsNumber;
        int lower = (page - 1) * offset;
        
        // check lower bound
		if (lower > list.size()) {
		    return vector<pair<string, FileManager::FileType>>();
		}
        
        int upper = page * offset;
        if (list.size() > upper) {
			return vector<pair<string, FileManager::FileType>>(list.begin() + lower, list.begin() + upper);
		} else {
			return vector<pair<string, FileManager::FileType>>(list.begin() + lower, list.end());
		}    

	} else { // есть возврат

        if (page == 1) {
            int offset = pageMaxRowsNumber;
            if (list.size() > offset) {
    		    int upper = offset;
    			return vector<pair<string, FileManager::FileType>>(list.begin(), list.begin() + upper);
    		} else {
    		    return vector<pair<string, FileManager::FileType>>(list.begin(), list.end());
    		}

        } else {
            
            int offset = homePageMaxRowsNumber;
            int lower = pageMaxRowsNumber + (page - 2) * offset;
        
            // check lower bound
    		if (lower > list.size()) {
    		    return vector<pair<string, FileManager::FileType>>();
    		}
                
            int upper = pageMaxRowsNumber + (page - 1) * offset;
            if (list.size() > upper) {
    			return vector<pair<string, FileManager::FileType>>(list.begin() + lower, list.begin() + upper);
    		} else {
    			return vector<pair<string, FileManager::FileType>>(list.begin() + lower, list.end());
    		}        
                
        }

    }

}

string PrintPage::indicator2string(const Indicator& code) const {

	switch(code) {
		case Indicator::i_manager_icon:
			return "i_manager_icon";
		case Indicator::i_icon_2:
			return "i_icon_2";		
		case Indicator::i_icon_3:
			return "i_icon_3";
		case Indicator::i_icon_4:
			return "i_icon_4";
		case Indicator::i_icon_5:
			return "i_icon_5";
		case Indicator::i_icon_6:
			return "i_icon_6";
		case Indicator::bi_mang_line:
			return "bi_mang_line";
		case Indicator::bi_file_name_2:
			return "bi_file_name_2";
		case Indicator::bi_file_name_3:
			return "bi_file_name_3";
		case Indicator::bi_file_name_4:
			return "bi_file_name_4";
		case Indicator::bi_file_name_5:
			return "bi_file_name_5";
		case Indicator::bi_file_name_6:
			return "bi_file_name_6";
		case Indicator::i_filepath:
			return "i_filepath";
		case Indicator::i_mang_page:
			return "i_mang_page";
		case Indicator::b_page_next:
			return "b_page_next";
		case Indicator::b_page_prev:
			return "b_page_prev";
		default: {
			cout << "ERROR - PrintPage::Indicator2String" << endl;
			return "";
		}

	}

}

int PrintPage::ind2pic(const Icon& code) const {
	switch(code) {
		case Icon::UP:
			return 301;
		case Icon::FOLDER:
			return 303;
		case Icon::FILE:
			return 302;
		case Icon::EMPTY:
			return 534;
		default: {
			cout << "ERROR - PrintPage::ind2pic" << endl;
			return 534;
		}

	}

}

int PrintPage::file2pic(const FileManager::FileType& code) const {
	switch(code) {
		case FileManager::FileType::FILE:
			return ind2pic(Icon::FILE);
		case FileManager::FileType::DIRECTORY:
			return ind2pic(Icon::FOLDER);
		default: {
			cout << "ERROR - PrintPage::file2pic" << endl;
			return ind2pic(Icon::EMPTY);
		}
			
	}

}
