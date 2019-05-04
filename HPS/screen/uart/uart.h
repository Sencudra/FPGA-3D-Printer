#ifndef INC_3D_PRINTER_UARTCONTROLLER_H
#define INC_3D_PRINTER_UARTCONTROLLER_H

#include <cstdio>
#include <cstring>
#include <iostream>

#include <termios.h>

#include <chrono>
#include <thread>
#include <queue>

using namespace std; 

class UART {

public:
	/* Properties */\
	queue<vector<int>> taskQueue;

	/* Methods */
    static UART& getPort(const string& name = "/dev/ttyS1");

	void listen2port() ;
	void write2port(const string& message) const;
	void show_port_settings() const;

private:

	/* Properties */ 
	struct termios serial_port_settings;

	string port_name;
	int port_descriptor;

	thread listening_thread;



	/* Constructors */
	UART(const string& name );
	UART(const UART&) = delete;
	UART& operator=(const UART&) = delete;

	/* Methods */
	int open_port();
	void setup_port();
	void start_listening();

	void addTask(const vector<int>& task);

};

#endif //INC_3D_PRINTER_UARTCONTROLLER_H