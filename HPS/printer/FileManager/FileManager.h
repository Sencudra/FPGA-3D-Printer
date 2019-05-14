#ifndef STL2GCODE_FILEMANAGER_H
#define STL2GCODE_FILEMANAGER_H

#include <string>
#include <vector>

using namespace std;

class FileManager {

public:

	/* Types */

	enum class FileType {
		FILE = 0,
		DIRECTORY
	};

	/* Constructors and destructors */

	FileManager();
	~FileManager();

	/* Methods */

	bool isUSBConnected();

	bool connectUSB();
	bool disconnectUSB();

	void showCurrentDirectory();
	bool isHome();
	vector<pair<string, FileType>> getCurrentDirectoryObjectsList();
	
	bool openDirectory(const string& name);
	bool closeDirectory();

	inline string getCurrentFolder() { return currentPosition; }
	
private:

	/* Properties */

	string usbName;
	const string deviceDeafultPath = "/media/usb";
	string currentPosition = deviceDeafultPath;

	/* Methods */

	vector<pair<string, FileType>> readDirectory(const std::string& name);

	bool isValidExtension(const string& ext);

	string CMD(const string& cmd) const ;
	string findUSB() const ;

	void unmountAndDelete();

	void createDirForUSB() const ;
	void deleteDirForUSB() const ;

	bool mountUSB() const;
	bool umountUSB() const ; 
};

#endif