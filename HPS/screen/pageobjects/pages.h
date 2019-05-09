#ifndef INC_3D_PRINTER_PAGEOBJECT_H
#define INC_3D_PRINTER_PAGEOBJECT_H

#include <vector>
#include <cstring>


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
	/* Properties */

	/* Constructors and destructors */
	BasePage(ScreenController& controller);
	virtual ~BasePage() { } 

	/* Methods*/
	virtual void update() = 0;
	virtual void touch(std::vector<int>& command) = 0;

protected:
	/* Properties */
	ScreenController& controller;

	/* Constructors */

	/* Methods*/
};


class LoadingPage: public BasePage {

public:
	/* Properties */

	/* Constructors and destructors */
	LoadingPage(ScreenController& controller);
	virtual ~LoadingPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */

	/* Constructors */

	/* Methods*/


};


class HomePage: public BasePage {

	enum class Button {
		b_nav_print 	= 7,
		b_nav_control   = 8,
		b_nav_settings  = 9,
		b_preset_1 		= 11,
		b_preset_2 		= 12,
		b_preset_3 		= 13,
		b_preset_4 		= 14,
		b_preset_5 		= 15,
		b_preset_6 		= 16,
		b_hotspot_1 	= 29,
		b_hotspot_2 	= 30,
		b_hotspot_3 	= 31
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
	/* Properties */

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
	/* Constructors */

	/* Methods*/
	void updateStatusIndicators();
	void updateDisplayIndicators();
	void updatePresetBar();
	void updateInfo();
	std::string indicator2string(const Indicator& code) const;

};


class PrintPage: public BasePage {

	enum Button {
		b_nav_home		= 2,
		b_nav_control	= 3,
		b_nav_settings	= 4,
		b_page_next		= 6,
		b_page_prev		= 5,
		b_manager_icon	= 7,
		bi_mang_line	= 13,
		bi_file_name_2	= 14,
		bi_file_name_3	= 15,
		bi_file_name_4	= 16,
		bi_file_name_5	= 17,
		bi_file_name_6	= 18,
	};

public:
	/* Properties */

	/* Constructors and destructors */
	PrintPage(ScreenController& controller);
	virtual ~PrintPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */

	/* Constructors */

	/* Methods*/

};

// 5. PrintSetupPage
// 6. PrintingPage
// 7. PrintingDonePage

class ControlPage: public BasePage {

	enum Button {
		b_nav_home 		= 2,
		b_nav_print 	= 3,
		b_nav_settings 	= 4,
		b_precis_1 		= 15,
		b_precis_2 		= 16,
		b_precis_3 		= 17,
		b_precis_4 		= 18,
		b_precis_5 		= 19,
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

public:
	/* Properties */

	/* Constructors and destructors */
	ControlPage(ScreenController& controller);
	virtual ~ControlPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */

	/* Constructors */

	/* Methods*/

};

class SettingsPage: public BasePage {

	enum Button {
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

public:
	/* Properties */

	/* Constructors and destructors */
	SettingsPage(ScreenController& controller);
	virtual ~SettingsPage() { }

	/* Methods*/
	virtual void update();
	virtual void touch(std::vector<int>& command);

private:
	/* Properties */

	/* Constructors */

	/* Methods*/
};


#endif // INC_3D_PRINTER_PAGEOBJECT_H