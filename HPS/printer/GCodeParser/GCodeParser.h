#ifndef INC_3D_PRINTER_GCODEPARSER_H
#define INC_3D_PRINTER_GCODEPARSER_H

#include <string>
#include <fstream>
#include <exception>

#include "dict.h"

using namespace std;

class gcodeParser {
    string path;
    fstream f;

    unsigned int commands; // количество команд
    unsigned int current_command;
public:
    explicit gcodeParser(const string& path);
    ~gcodeParser();
    int get_command_percentage();

    pair<string, Parameters> parse_command();
    bool is_done();
};

#endif //INC_3D_PRINTER_GCODEPARSER_H