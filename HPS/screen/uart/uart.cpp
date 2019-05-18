#include <iostream>
#include <cstdio>

#include <cstring>
#include <cstdint>

#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <future>
#include <vector>
#include <ctime>
#include <cmath>

#include "uart.h"
#include "config.h"


/*	Public methods	*/

UART& UART::getPort(const string& name /* default: "/dev/ttyS1" */) {
 	static UART port(name);
    return port;
}

void UART::openScreen(Screen screen) {
	string screenName = screen2string(screen);
	sendCommand("page " + screenName);
}

void UART::refreshIndicator(string name) {
	sendCommand("ref " + name);
}

void UART::updateIndicator(string name, Attribute attribute, bool value) {
	string valueString = to_string(value);
	string attributeString = attribute2string(attribute);

	if (attribute == Attribute::TXT) {
		valueString = "\"" + valueString + "\"";
	}

	sendCommand(name + "." + attributeString + "=" + valueString);
}

void UART::updateIndicator(string name, Attribute attribute, int value) {
	string attributeString = attribute2string(attribute);
	string valueString = to_string(value);

	if (attribute == Attribute::TXT) {
		valueString = "\"" + valueString + "\"";
	}

	sendCommand(name + "." + attributeString + "=" + valueString);
}

void UART::updateIndicator(string name, Attribute attribute, float value) {
	string attributeString = attribute2string(attribute);

	string pre = to_string(round(value * 100.0)/ 100.0);
    auto found = pre.find(".");
    string valueString = pre.substr(0, found + 3);

	if (attribute == Attribute::TXT) {
		valueString = "\"" + valueString + "\"";
	}

	sendCommand(name + "." + attributeString + "=" + valueString);
}

void UART::updateIndicator(string name, Attribute attribute, string value) {
	string attributeString = attribute2string(attribute);
		string valueString = value;

	if (attribute == Attribute::TXT) {
		valueString = "\"" + valueString + "\"";
	}

	sendCommand(name + "." + attributeString + "=" + valueString);
}

void UART::updateTimer(int value) {
	string attributeString = attribute2string(Attribute::EN);
	string valueString = to_string(value);
	sendCommand("timer." + attributeString + "=" + valueString);
}

void UART::sendCommand(const string& message) {

	// some magic/postpone for nextion screen
	//while (double(clock() - timer)/CLOCKS_PER_SEC <= 0.05) {}

	// looks like max length is 15 bytes at one time
	const int maxLen = 15;
	
	string substrMessage = message;
	int msgLen = substrMessage.length();

	if (isScreenDebug)
		cout << "Command: " << message << endl; 

	while (msgLen > 0) {
		string toSend;
		if (msgLen > maxLen) {
			toSend = substrMessage.substr(0, maxLen);
			substrMessage = substrMessage.substr(maxLen);
		} else {
			toSend = substrMessage.substr(0, msgLen);
			substrMessage.erase();
		}
		write2port(toSend);
		msgLen = substrMessage.length();
	}
	write2port("\xff\xff\xff");

	timer = clock();
}

void UART::listen2port() {

	listening_thread = thread(&UART::start_listening, ref(this->getPort()));
	listening_thread.detach();

	if (isScreenDebug)
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

 		if (isScreenDebug)
 			cout << "BUFFER:";

		for(int i = 0; i < bytes_read - 3; ++i) {
			
			if (isScreenDebug)
				cout << " " << (int) buffer[i]; 
	
			command.push_back(int(buffer[i]));
		}

 		if (int(buffer[0]) == 101) {
			addTask(command);
		}

		if (isScreenDebug) {
			cout << "COMMAND: ";
			for(auto symbol : command) {
				cout << symbol << " ";
			}
			cout << endl;
			cout << "OK - UART::start_listening - bytes read: " << bytes_read << endl;
		}
		
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

void UART::write2port(const string& message) const {

	int msg_len = message.length();
	char write_buffer[msg_len];
	memset(write_buffer, 0, msg_len);	
	strcpy(write_buffer, message.c_str());

	//int bytes_written = 
	write(port_descriptor, write_buffer, msg_len);
	//cout << "OK - UART::write - Word: |" << message << "| , Bytes written: " << bytes_written << " / " << msg_len << endl;
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
	serial_port_settings.c_iflag &= ~IXON;
	serial_port_settings.c_iflag &= ~IXOFF;

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

string UART::attribute2string(const Attribute& code) const {
	switch(code) {
		case PIC:
			return "pic";
		case PICC:
			return "picc";
		case PICC2: 
			return "picc2";
		case PIC0:
			return "pic0";
		case PIC1:
			return "pic1";
		case VAL:
			return "val";
		case TXT:
			return "txt";
		case EN:
			return "en";
		default:
			cout << "ERROR - UART::attributes2string - wrong code:" << code << endl;
			return "";		
	}
}

string UART::screen2string(const Screen& code) const {
	switch(code) {
		case LOADING:
			return "LOADING";
		case HOME:
			return "HOME";
		case PRINT:
			return "PRINT";
		case PRINT_SETUP:
			return "PRINT_SETUP";
		case PRINTING:
			return "PRINTING";
		case PRINTING_DONE:
			return "PRINTING_DONE";
		case CONTROL:
			return "CONTROL";
		case SETTINGS:
			return "SETTINGS";
		case SETTINGS_P:
			return "SETTINGS_P";
		case SETTINGS_M_SPE:
			return "SETTINGS_M_SPE";
		case SETTINGS_M_STE:
			return "SETTINGS_M_STE";
		case WARNING:
			return "WARNING";
		default:
			cout << "ERROR - UART::UART::screen2string - wrong code:" << code << endl;
			return "";		
	}
	
}
