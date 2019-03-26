#include "gcodeParser.h"

gcodeParser::gcodeParser(const string& path) {
    this->path = path;
    f.open(path);
    // проверить существует ли файл
    if (!f.is_open()) {
        throw invalid_argument("Wrong gcode file path!");
    }
    // прочитать его - почтитать кол-во commands

    // вернуть позиционирование в начало файла
    f.seekg(0, ios_base::beg);
    current_command = 0;
}

gcodeParser::~gcodeParser() {
    f.close();
}

pair<string, dict<char, float>> gcodeParser::parse_command() {
    dict<char, float> d = {
            {'X', 15.0},
            {'Y', 20.0}
    };

    string line;
    getline(f, line);
    /*
     * line.split() - не реализовано в c++(
     *
    */
    ++current_command;


    return make_pair("G0", d);
}

bool gcodeParser::is_done() {
    return commands == current_command;
}