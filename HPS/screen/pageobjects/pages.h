#ifndef INC_3D_PRINTER_PAGEOBJECT_H
#define INC_3D_PRINTER_PAGEOBJECT_H

#include <vector>
#include <cstring>

#include "ScreenController.h"
#include "FileManager.h"
#include "types.h"
#include "config.h"

class ScreenController;
class UART;


// Classes present
// 1. BasePage
// 2. LoadingPage
// 3. HomePage
// 4. PrintPage
// 5. PrintSetupPage
// 6. PrintingPage
// 7. PrintingDonePage
// 8. ControlPage
// 9. SettingsPage
// 10. SettingsPresetsPage
// 11. SettingsMovSpeedPage
// 12. SettingsMovStepsPage
// 13. WarningPage

class BasePage {

public:
	/* Constructors and destructors */
	BasePage(ScreenController& controller);
	virtual ~BasePage() { } 

	/* Virtual Methods*/
	virtual void update() = 0;
	virtual void touch(std::vector<int>& command) = 0;

protected:
	/* Properties */
	ScreenController& controller;

};


class LoadingPage: public BasePage {

public:
	/* Constructors and destructors */
	LoadingPage(ScreenController& controller);
	virtual ~LoadingPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

};


class HomePage: public BasePage {

	enum class Button {
		b_nav_print 	= 7,
		b_nav_control   = 8,
		b_nav_settings  = 9,
		b_preset_1 		= 10,
		b_preset_2 		= 11,
		b_preset_3 		= 12,
		b_preset_4 		= 13,
		b_preset_5 		= 14,
		b_preset_6 		= 15,
		b_hotspot_1 	= 28,
		b_hotspot_2 	= 29,
		b_hotspot_3 	= 30
	};

	enum class Indicator {
		i_ind_1,
		i_ind_2,
		i_ind_3,
		i_ind_4,
		bi_nozzle_ind,
		bi_nozzle_set,
		bi_nozzle_curr,
		bi_pad_ind,
		bi_pad_set,
		bi_pad_curr,
		bi_fan_ind,
		bi_fan_set,
		bi_fan_curr,
		i_gif_loading,
		i_info_text,
		b_preset_1,
		b_preset_2,
		b_preset_3,
		b_preset_4,
		b_preset_5,
		b_preset_6
	};

public:
	/* Constructors */
	HomePage(ScreenController& controller);
	virtual ~HomePage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	const int minNotActive = 67;
    const int maxNotActive = 179;
    const int rangeNotActive = maxNotActive - minNotActive;

    const int minActive = 180;
	const int maxActive = 290;
	const int rangeActive = maxActive - minActive;

	/* Methods*/
	void updateStatusIndicators();
	void updateDisplayIndicators();
	void updatePresetBar();
	void updateInfo();
	std::string indicator2string(const Indicator& code) const;
};


class PrintPage: public BasePage {

	enum class Icon {
		UP,
		FOLDER,
		FILE,
		EMPTY
	};

	enum class Button {
		b_nav_home		= 2,
		b_nav_control	= 3,
		b_nav_settings	= 4,
		b_page_prev		= 5,
		b_page_next		= 6,
		bi_mang_line	= 13,
		bi_file_name_2	= 14,
		bi_file_name_3	= 15,
		bi_file_name_4	= 16,
		bi_file_name_5	= 17,
		bi_file_name_6	= 18,
	};

	enum class Indicator {
		i_manager_icon,
		i_icon_2,
		i_icon_3,
		i_icon_4,
		i_icon_5,
		i_icon_6,
		bi_mang_line,
		bi_file_name_2,
		bi_file_name_3,
		bi_file_name_4,
		bi_file_name_5,
		bi_file_name_6,
		i_filepath,
		i_mang_page,
		b_page_prev,
		b_page_next,
	};

public:
	/* Constructors and destructors */
	PrintPage(ScreenController& controller);
	virtual ~PrintPage();

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	const int homePageMaxRowsNumber = 6;
	const int pageMaxRowsNumber = 5;
	const int maxRowStringLength = 34;

	bool isInit = false;

	int currentPage;
	int maxPages;
	std::string infoLine;

	std::vector<std::pair<std::string, FileManager::FileType>> list;

	/* Methods*/

	bool initialise();

	void nextPage();
	void prevPage();
	void rowButtonPressed(int row);
	void changeDirectory();

	void smartUpdate();
	void updatePageButtons();
	void updateInfoLine();
	void updateRows();
	void updateRowsIfNotAtHomeAndFirstPage();
	void updateRowsNormal();

	std::string getCurrentFolderName();
	std::vector<std::pair<std::string, FileManager::FileType>> getFilesList(int page, bool isHome) const;

	std::string indicator2string(const Indicator& code) const;
	int ind2pic(const Icon& code) const;
	int file2pic(const FileManager::FileType& code) const ;
};


class PrintSetupPage: public BasePage {

	enum class Button {
		b_start_print	= 2,
		b_return		= 3,
		b_preset_1		= 10,
		b_preset_2		= 11,
		b_preset_3		= 12,
		b_preset_4		= 13,
		b_preset_5		= 14,
		b_preset_6		= 15,
		b_precis_1		= 19,
		b_precis_2		= 20,
		b_precis_3		= 21,
		b_precis_4		= 22,
		b_precis_5		= 23,
		b_r1_minus		= 4,
		b_r2_minus		= 5,
		b_r3_minus		= 6,
		b_r1_plus		= 7,
		b_r2_plus		= 8,
		b_r3_plus		= 9,
	};

	enum class Indicator {
		i_layer_w,
		i_base_t,
		i_fiiling_d,
		b_preset_1,
		b_preset_2,
		b_preset_3,
		b_preset_4,
		b_preset_5,
		b_preset_6,
		b_precis_1,
		b_precis_2,
		b_precis_3,
		b_precis_4,
		b_precis_5
	};

public:
	/* Constructors and destructors */
	PrintSetupPage(ScreenController& controller);
	virtual ~PrintSetupPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	/* Methods*/
	void updateIndicators();

	void updatePresetBar();

	void updatePrecisionBar();

	std::string indicator2string(const Indicator& code) const ;
};


class PrintingPage: public BasePage {

	enum class Button {
		b_hotspot_1 	= 25,
		b_hotspot_2 	= 26,
		b_hotspot_3 	= 27,
		b_abort 		= 6,
		b_block_screen 	= 7,
		b_pause 		= 8
	};

	enum class Indicator {
		b_block_screen,
		i_ind_1,
		i_ind_2,
		i_ind_3,
		i_ind_4,
		bi_nozzle_ind,
		bi_nozzle_set,
		bi_nozzle_curr,
		bi_pad_ind,
		bi_pad_set,
		bi_pad_curr,
		bi_fan_ind,
		bi_fan_set,
		bi_fan_curr,
		i_gif_loading,
		i_info_text,
		i_process,
		i_info_pos_x,
		i_info_pos_y,
		i_info_pos_z,
		i_preset,
	};

public:
	/* Properties */

	/* Constructors and destructors */
	PrintingPage(ScreenController& controller);
	virtual ~PrintingPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isBlocked;
	bool isUpdateFirstTime;
	
	const int minNotActive = 304;
    const int maxNotActive = 416;
    const int rangeNotActive = maxNotActive - minNotActive;

    const int minActive = 417;
	const int maxActive = 527;
	const int rangeActive = maxActive - minActive;

	const int indicatorPicActive = 293;
	const int indicatorPicNonActive = 292;

	/* Methods*/

	void updatePositionInfo();

	void updatePresetInfo();

	void updateStatusIndicators();

	void updateDisplayIndicators();

	void updateInfo();

	void updateProcessbar();

	std::string preset2string(const PrinterVariables::Common::Preset& preset) const ;
	std::string indicator2string(const Indicator& code) const ;

};


class PrintingDonePage: public BasePage {

	enum class Button {
		b_home = 8
	};

	enum class Indicator {
		i_ind_1,
		i_ind_2,
		i_ind_3,
		i_ind_4,
		bi_nozzle_ind,
		bi_nozzle_set,
		bi_nozzle_curr,
		bi_pad_ind,
		bi_pad_set,
		bi_pad_curr,
		bi_fan_ind,
		bi_fan_set,
		bi_fan_curr,
		i_gif_loading,
		i_info_text,
		i_process,
		i_info_pos_x,
		i_info_pos_y,
		i_info_pos_z,
		i_preset
	};

public:
	/* Constructors and destructors */
	PrintingDonePage(ScreenController& controller);
	virtual ~PrintingDonePage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;
	
	const int minNotActive = 304;
    const int maxNotActive = 416;
    const int rangeNotActive = maxNotActive - minNotActive;

    const int minActive = 417;
	const int maxActive = 527;
	const int rangeActive = maxActive - minActive;

	/* Methods*/
	void updatePositionInfo();

	void updatePresetInfo();

	void updateStatusIndicators();

	void updateDisplayIndicators();

	void updateInfo();

	void updateProcessbar();

	std::string preset2string(const PrinterVariables::Common::Preset& preset) const ;
	std::string indicator2string(const Indicator& code) const ;
};


class ControlPage: public BasePage {

	enum class Button {
		b_nav_home 		= 2,
		b_nav_print 	= 3,
		b_nav_settings 	= 4,
		b_precis_1 		= 14,
		b_precis_2 		= 15,
		b_precis_3 		= 16,
		b_precis_4 		= 17,
		b_precis_5 		= 18,
		b_reset_def 	= 13,
		b_hor_up 		= 6,
		b_hor_down 		= 7,
		b_hor_left 		= 20,
		b_hor_right 	= 12,
		b_ver_up 		= 8,
		b_ver_down 		= 9,
		b_ext_up 		= 10,
		b_ext_down 		= 11,
		b_autocalib 	= 5
	};

	enum class Indicator {
		i_gif_loading,
		i_info_text,
		i_x,
		i_y,
		i_z,
		i_e,
		b_precis_1,
		b_precis_2,
		b_precis_3,
		b_precis_4,
		b_precis_5,
	};

public:
	/* Constructors and destructors */
	ControlPage(ScreenController& controller);
	virtual ~ControlPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	/* Methods*/
	void updatePrecisionBar();
	void updateInfo();
	void updateVariables();

	std::string indicator2string(const Indicator& code) const ;
};

class SettingsPage: public BasePage {

	enum class Button {
		b_preprint		= 38,
		b_mov			= 39,
		b_nav_home		= 2,
		b_nav_print		= 3,
		b_nav_control	= 4,
		b_precis_1		= 32,
		b_precis_2		= 33,
		b_precis_3		= 34,
		b_precis_4		= 35,
		b_precis_5		= 36,
		b_reset_def		= 29,
		b_save			= 30,
		b_r1_minus		= 13,
		b_r2_minus		= 14,
		b_r3_minus		= 15,
		b_r4_minus		= 19,
		b_r5_minus		= 20,
		b_r6_minus		= 21,
		b_r7_minus		= 25,
		b_r8_minus		= 26,
		b_r1_plus		= 16,
		b_r2_plus		= 17,
		b_r3_plus		= 18,
		b_r4_plus		= 22,
		b_r5_plus		= 23,
		b_r6_plus		= 24,
		b_r7_plus		= 27,
		b_r8_plus		= 28,
		b_temp_auto		= 31,
	};

	enum class Indicator {
		i_nozzle,
		i_pad,
		i_cooler,
		i_PID_P,
		i_PID_I,
		i_PID_D,
		b_temp_auto,
		i_temp_min,
		i_temp_max,
		b_precis_1,
		b_precis_2,
		b_precis_3,
		b_precis_4,
		b_precis_5,
	};

public:
	/* Constructors and destructors */
	SettingsPage(ScreenController& controller);
	virtual ~SettingsPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	/* Methods*/
	void updateIndicators();
	void updatePrecisionBar();
	std::string indicator2string(const Indicator& code) const ;
};


class SettingsPresetsPage: public BasePage {

	enum class Button {
		b_general		= 5,
		b_mov			= 6,
		b_nav_home		= 2,
		b_nav_print		= 3,
		b_nav_control	= 4,
		b_preset_1		= 7,
		b_preset_2		= 8,
		b_preset_3		= 9,
		b_preset_4		= 10,
		b_preset_5		= 11,
		b_preset_6		= 12,
		b_precis_1		= 14,
		b_precis_2		= 15,
		b_precis_3		= 16,
		b_precis_4		= 17,
		b_precis_5		= 18,
		b_reset_def		= 30,
		b_save			= 29,
		b_r1_minus		= 23,
		b_r2_minus		= 24,
		b_r3_minus		= 25,
		b_r1_plus		= 26,
		b_r2_plus		= 27,
		b_r3_plus		= 28
	};

	enum class Indicator {
		i_nozzle,
		i_pad,
		i_cooler,
		b_preset_1,
		b_preset_2,
		b_preset_3,
		b_preset_4,
		b_preset_5,
		b_preset_6,
		b_precis_1,
		b_precis_2,
		b_precis_3,
		b_precis_4,
		b_precis_5
	};

public:
	/* Constructors and destructors */
	SettingsPresetsPage(ScreenController& controller);
	virtual ~SettingsPresetsPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	/* Methods*/
	void updatePrecisionBar();
	void updatePresetBar();
	void updateIndicators();


	std::string indicator2string(const Indicator& code) const ;

};


class SettingsMovSpeedPage: public BasePage {

	enum class Button {
		b_general		= 1,
		b_preprint		= 2,
		b_nav_home		= 3,
		b_nav_print		= 4,
		b_nav_control	= 5,
		b_steps			= 6,
		b_r1_minus		= 15,
		b_r2_minus		= 17,
		b_r3_minus		= 19,
		b_r4_minus		= 21,
		b_r1_plus		= 16,
		b_r2_plus		= 18,
		b_r3_plus		= 20,
		b_r4_plus		= 22,
		b_precis_1		= 7,
		b_precis_2		= 8,
		b_precis_3		= 9,
		b_precis_4		= 10,
		b_precis_5		= 11,
		b_reset_def		= 12,
		b_save			= 13
	};

	enum class Indicator {
		b_precis_1,
		b_precis_2,
		b_precis_3,
		b_precis_4,
		b_precis_5,
		i_x,
		i_y,
		i_z,
		i_e
	};


public:
	/* Constructors and destructors */
	SettingsMovSpeedPage(ScreenController& controller);
	virtual ~SettingsMovSpeedPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	/* Methods*/
	void updatePrecisionBar();
	void updateIndicators();

	std::string indicator2string(const Indicator& code) const ;
};


class SettingsMovStepsPage: public BasePage {

	enum class Button {
		b_general		= 5,
		b_preprint		= 4,
		b_nav_home		= 1,
		b_nav_print		= 2,
		b_nav_control	= 3,
		b_speed			= 6,
		b_r1_minus		= 15,
		b_r2_minus		= 18,
		b_r3_minus		= 19,
		b_r1_plus		= 16,
		b_r2_plus		= 17,
		b_r3_plus		= 20,
		b_precis_1		= 8,
		b_precis_2		= 9,
		b_precis_3		= 10,
		b_precis_4		= 11,
		b_precis_5		= 12,
		b_reset_def		= 13,
		b_save			= 14
	};

	enum class Indicator {
		b_precis_1,
		b_precis_2,
		b_precis_3,
		b_precis_4,
		b_precis_5,
		i_x,
		i_y,
		i_z,
		i_e,
	};

public:
	/* Constructors and destructors */
	SettingsMovStepsPage(ScreenController& controller);
	virtual ~SettingsMovStepsPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	bool isUpdateFirstTime;

	/* Methods*/
	void updatePrecisionBar();
	void updateIndicators();

	std::string indicator2string(const Indicator& code) const ;
};


class WarningPage: public BasePage {

	enum class Button {
		b_confirm		= 2,
		b_cancel		= 3
	};

	enum class Indicator {
		i_message
	};

public:

	enum class Reason {
		FOR_PRINT,
		FOR_ABORT,
		FOR_CANCELING_SETUP,
		FOR_CONTROL_HOME,
		FOR_PRINT_GCODE
	};

	/* Constructors and destructors */
	WarningPage(ScreenController& controller, 
			const ScreenController::Screen ok, 
			const ScreenController::Screen cancel, 
			const Reason reason);

	virtual ~WarningPage();

	/* Methods*/
	virtual void update() {}
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */
	ScreenController::Screen ok;
	ScreenController::Screen cancel;
	Reason reason;
	void (*f)(string name);

	/* Methods*/
	string indicator2string(const Indicator& code) const ;
	int reas2int(const Reason& reason) const;

};


#endif // INC_3D_PRINTER_PAGEOBJECT_H