#include <cstdlib>
#include <iostream>
#include <stdio.h>


#include <regex>



using namespace std;

#include "FileManager.h"

FileManager::FileManager() {
	isDeviceConnected();
}

string FileManager::CMD(const string cmd) const {
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

bool FileManager::isDeviceConnected() {

	string blkid_output = CMD("blkid");
	smatch port_name;
	regex sdX1("/dev/sd");

	bool ans = regex_search(blkid_output, port_name, sdX1);

	cout << ans << endl;

	if (ans) {
		for (auto x:port_name) std::cout << x << " ";
	    std::cout << std::endl;
	    blkid_output = port_name.suffix().str();
	    cout << blkid_output << endl;
	}
}