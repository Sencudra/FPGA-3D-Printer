#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <cstring>

#include <dirent.h>
 
using namespace std;

#include "FileManager.h"
#include "config.h"

/* Constructors and Destructors */

FileManager::FileManager() 	{	}

FileManager::~FileManager() {	}

/* Public methods */

bool FileManager::isUSBConnected() {
	if (usbName == "") {
		return false;
	} else if (usbName == findUSB()){
		return true;
	} else {
		return false;
	}
}

bool FileManager::connectUSB() {

	// check if usb device is available
	usbName = findUSB();

	if (usbName.length() > 0) {

		// create folder for mount
		createDirForUSB();

		// mount device
		return mountUSB();
	}
	cout << "WARNING - FileManager::connectUSB - USB device not found, witch." << endl;
	return false;
};

bool FileManager::disconnectUSB() {

	// check if usb device is available
	usbName = findUSB();

	if (usbName.length() > 0) {
		unmountAndDelete();
		usbName = "";
		return true;
	}
	unmountAndDelete();
	usbName = "";
	cout << "WARNING - FileManager::disconnectUSB - Device already disconnected." << endl;
	return false;
}

void FileManager::showCurrentDirectory() {

	vector<pair<string, FileManager::FileType>> fileList = readDirectory(currentPosition);

	for (const auto& p : fileList) {
		cout << p.first << ", " << int(p.second) << endl;
	}

}

bool FileManager::isHome() {

	if (isScreenDebug) {
		cout << "IS HOME ";
		cout << "devDefPath: "<< deviceDeafultPath << " currentPosition: "<< currentPosition << endl;
	}

	return deviceDeafultPath == currentPosition;
}

vector<pair<string, FileManager::FileType>> FileManager::getCurrentDirectoryObjectsList() {
	return readDirectory(currentPosition);
}


bool FileManager::openDirectory(const string& name) {

	vector<pair<string, FileManager::FileType>> fileList = readDirectory(currentPosition);

	bool isFound = false;
	for (const auto& pair : fileList) {
		if (pair.first == name && pair.second == FileManager::FileType::DIRECTORY) {
			isFound = true;
			break;
		}

	}

	// Check if directory present
	if(!isFound) {
		cout << "ERROR - FileManager::openDirectory - no such directory" << endl;
		return false;
	}

	currentPosition = currentPosition + "/" + name;
	return true;
}

bool FileManager::closeDirectory() {
	if (!isHome()) {

		auto found = currentPosition.find_last_of("/\\");
		currentPosition = currentPosition.substr(0,found);
		return true;
	} else {
		cout << "ERROR - FileManager::closeCurrentDirectory - can not go deeper" << endl;
		return false;
	}

}

/* Private methods */

vector<pair<string, FileManager::FileType>> FileManager::readDirectory(const std::string& name) {
	vector<pair<string, FileManager::FileType>> fileList;

    DIR* dirp = opendir(name.c_str());
    struct dirent * dp;
    while ((dp = readdir(dirp)) != NULL) {

    	// pass . and ..
    	if (strcmp(dp->d_name, ".") == 0 ||
    		strcmp(dp->d_name, "..") == 0 ||
    		strcmp(dp->d_name, "System Volume Information") == 0) {
    		continue;
    	}

    	if (dp->d_type == DT_REG && isValidExtension(dp->d_name)) {
    		fileList.push_back(make_pair(dp->d_name, FileManager::FileType::FILE));
    	} else if (dp->d_type == DT_DIR) {
    		fileList.push_back(make_pair(dp->d_name, FileManager::FileType::DIRECTORY));
    	}        
    }
    closedir(dirp);
    return fileList;
}

bool FileManager::isValidExtension(const string& fileName) {

	auto found = fileName.find_last_of(".");
	string ext = fileName.substr(found+1);

	if (ext == "g" || ext == "stl" || ext == "gcode") {
		return true;
	} else {
		return false;
	}
}

string FileManager::CMD(const string& cmd) const {
	string data;
	FILE* stream;
	const int max_buffer = 256;
	char buffer[max_buffer];

    stream = popen(cmd.c_str(), "r");
    if (stream) {
        while (!feof(stream)) {
            if (fgets(buffer, max_buffer, stream) != NULL) {
                data.append(buffer);
            }

        }
        pclose(stream);
    }
    return data;
}

string FileManager::findUSB() const {
	string port_name;
	string blkid_output = CMD("blkid");

    string pattern = "/dev/sd";
    size_t found = blkid_output.find(pattern);
    
    if (found != string::npos) {
        port_name = blkid_output.substr(found, pattern.length() + 2);
        

        if (isScreenDebug) cout << "OK - FileManager::findUSB - USB device found: " << port_name << endl;
        return port_name;
    } else {
        return "";
    }

}

void FileManager::unmountAndDelete() {

	string pattern = "usb";

	while (CMD("ls /media").find(pattern) != string::npos) {
		umountUSB();
		deleteDirForUSB();
	}
	cout << "OK - FileManager::unmountAndDeleteDevice - unmounted and deleted." << endl;
}

void FileManager::createDirForUSB() const {
	// mkdir /media/usb

	string output = CMD("mkdir " + deviceDeafultPath);
	if (output.length() > 0) cout << output << endl;
}

void FileManager::deleteDirForUSB() const {
	// rm -r /media/usb

	string output = CMD("rm -r " + deviceDeafultPath);
	if (output.length() > 0) cout << output << endl;
}

bool FileManager::mountUSB() const {
	// mount /dev/sdb1 /media/usb

	string output = CMD("mount " + usbName + " " + deviceDeafultPath);

	string error_pattern = "failed";
    size_t found = output.find(error_pattern);

   if (output.length() > 0) cout << output << endl;
    return found == string::npos;
}

bool FileManager::umountUSB() const {
	// mount /dev/sdb1 /media/usb

	string output = CMD("umount " + deviceDeafultPath);

	string error_pattern = "No such file";
    size_t found = output.find(error_pattern);

    if (output.length() > 0) cout << output << endl;
    return found != string::npos;
}
