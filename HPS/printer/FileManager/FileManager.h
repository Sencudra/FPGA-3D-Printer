#ifndef STL2GCODE_FILEMANAGER_H
#define STL2GCODE_FILEMANAGER_H

#include <string>
#include <vector>

using namespace std;

class FileManager {

public:

	enum class FileType {
		FILE,
		DIRECTORY
	};

	FileManager();

	bool connectUSB();
	vector<pair<string, FileType>> getDirFileList();

	bool openDirectory(string name);
	bool closeCurrentDirectory();

private:

	string CMD(const string cmd) const ;

	bool isDeviceConnected();

	string getUSBname();
	bool findUSB();

	bool createDirForUSB();
	bool mountUSB();
	
};

#endif