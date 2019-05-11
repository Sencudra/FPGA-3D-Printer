#ifndef INC_3D_PRINTER_UARTCONTROLLER_H
#define INC_3D_PRINTER_UARTCONTROLLER_H

#include <cstdio>
#include <cstring>
#include <iostream>

#include <termios.h>

#include <chrono>
#include <thread>
#include <queue>
#include <ctime>

using namespace std; 

class UART {

public:

	enum Attribute { 
		PIC,
		PICC,
		PICC2,
		PIC0, 
		PIC1,
		VAL,
		TXT,
		EN
	};

	enum Screen { 
		LOADING,
		HOME,
		PRINT, 
		PRINT_SETUP,
		PRINTING,
		PRINTING_DONE,
		CONTROL,
		SETTINGS,
		SETTINGS_P,
		SETTINGS_M_SPE,
		SETTINGS_M_STE,
		WARNING
	};

	/* Properties */
	queue<vector<int>> taskQueue;

	/* Methods */
    static UART& getPort(const string& name = "/dev/ttyS1");

    void openScreen(Screen screen);


	void refreshIndicator(string name);
    void updateIndicator(string name, Attribute attribute, bool value);
    void updateIndicator(string name, Attribute attribute, int value);
    void updateIndicator(string name, Attribute attribute, float value);
    void updateIndicator(string name, Attribute attribute, string value);
    void updateTimer(int value);

	void listen2port();
	
	void show_port_settings() const;

private:

	/* Properties */ 
	struct termios serial_port_settings;

	string port_name;
	int port_descriptor;

	thread listening_thread;

	clock_t timer;

	/* Constructors */
	UART(const string& name );
	UART(const UART&) = delete;
	UART& operator=(const UART&) = delete;

	/* Methods */
	int open_port();
	void setup_port();
	void start_listening();

	void sendCommand(const string& message);
	void write2port(const string& message) const;
	void addTask(const vector<int>& task);

	string attribute2string(const Attribute& code) const;
	string screen2string(const Screen& code) const;
};

#endif //INC_3D_PRINTER_UARTCONTROLLER_H
