
#include <iostream>
#include <cstdio>

#include <cstring>
#include <cstdint>

#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <future>

#include "uart.h"
#include <vector>

/*	Public methods	*/

UART& UART::getPort(const string& name /* default: "/dev/ttyS1" */) {
 	static UART port(name);
    return port;
}

void UART::write2port(const string& message) const {

	int msg_len = message.length();
	char write_buffer[msg_len];
	memset(write_buffer, 0, msg_len);	
	strcpy(write_buffer, message.c_str()); 

	int bytes_written = write(port_descriptor, write_buffer, msg_len);
	
	cout << "OK - UART::write - Word: |" << message << "| , Bytes written: " << bytes_written << " / " << msg_len << endl;
}

void UART::listen2port() {

	listening_thread = thread(&UART::start_listening, ref(this->getPort()));
	listening_thread.detach();

	cout << "OK - UART::UART - Thread detached" << endl;
}

void UART::start_listening() {

	int bytes_read;
	int buffer_size = 10;
    char buffer[buffer_size];  

 	while(true) { // replace for flag

 		bytes_read = 0;
 		memset(buffer, 0, buffer_size);		

 		bytes_read = read(port_descriptor, &buffer, buffer_size);

 		vector<int> command;
		for(int i = 0; i < bytes_read - 3; ++i) {
			command.push_back(int(buffer[i]));
		}
		addTask(command);

		cout << "OK - UART::start_listening - bytes read: " << bytes_read << endl;
 	}
 	close(port_descriptor);
 	
 	cout << "OK - UART::start_listening - Reading ended..." << endl;
}

void UART::show_port_settings() const {
	cout << " -- Port settings --  " << endl;
	system(("stty -a < " + port_name).c_str());
	cout << " -- End port settings --  " << endl;
}

/*	Private methods */
    
UART::UART(const string& name) {
	port_name = name;
	port_descriptor = open_port();
	setup_port();
	show_port_settings();

	cout << "OK - UART::UART(name =\"" << name << "\") - port initialised." << endl;
}

int UART::open_port() {

	int fd = open((port_name).c_str(), O_RDWR | O_NOCTTY); // O_NDELAY
	
	if (fd == -1) {
		perror("ERROR - UART.open_port() - Port NOT opened!");
		exit(1);
	} else {
		cout << "OK - UART.open_port() - Port opened successfully!" << endl;
		return fd;
	}

}

void UART::setup_port() {

	/*
		tcflag_t c_iflag;   	// input modes 
		tcflag_t c_oflag;      	// output modes 
		tcflag_t c_cflag;      	// control modes 
		tcflag_t c_lflag;      	// local modes 
		cc_t     c_cc[NCCS];   	// special characters 
	*/

	tcgetattr(port_descriptor, &serial_port_settings);
	cfsetispeed(&serial_port_settings, B115200);

	// control flags 
	serial_port_settings.c_cflag &= ~CSIZE;
	serial_port_settings.c_cflag |= CS8;
	serial_port_settings.c_cflag |= CREAD | CLOCAL;
	
	serial_port_settings.c_cflag &= ~CRTSCTS;
	serial_port_settings.c_cflag &= ~PARENB;
	serial_port_settings.c_cflag &= ~CSTOPB;
	
	// input flags
	serial_port_settings.c_iflag &= ~ICRNL & ~IMAXBEL;
	serial_port_settings.c_iflag |= BRKINT;

	// output flags
	serial_port_settings.c_oflag &= ~OPOST & ~ONLCR;

	// local flags
	serial_port_settings.c_lflag &= ~ISIG & ~ICANON & ~ECHO;
	
	serial_port_settings.c_cc[VMIN] = 1;
	serial_port_settings.c_cc[VTIME] = 0;

	if((tcsetattr(port_descriptor, TCSANOW, &serial_port_settings)) != 0) {
		cout << "ERROR - UART::setup_port - Port attributes are NOT set!" << endl;
		exit(1);
	} else {
		cout << "OK - UART::setup_port" << endl;
		show_port_settings();
	}

	tcflush(port_descriptor, TCIFLUSH);


	cout << "OK - UART::setup_port - Port setup ended..." << endl;
}


void UART::addTask(const vector<int>& task) {

	taskQueue.push(task);

	cout << "OK - UART::addTask - Command addded..." << endl;
}