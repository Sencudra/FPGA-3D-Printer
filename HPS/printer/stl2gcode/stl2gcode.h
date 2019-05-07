#ifndef STL2GCODE_STL2GCODE_H
#define STL2GCODE_STL2GCODE_H

#include <vector>
#include <string>
#include <map>
#include <set>

#include "stl2gcode_parameters.h"
#include "Triangle.h"
#include "Segment.h"
#include "Contour.h"

using namespace std;


class stl2gcode {
    static const float near_point;
    static const float near_distance;

    string file;
    stl2gcode_parameters parameters;
    float x_min, x_max, y_min, y_max, z_min, z_max;

    vector<Triangle> triangles;
    vector<vector<Segment>> segments;
    vector<vector<Contour>> shells;
    vector<vector<Segment>> infill;
    set<int> planes;

    void stl_binary();
    void stl_ascii();
    bool is_ascii();
    void slicing(const float& dz);
    void contour_construction(const vector<Segment>& segments, vector<Contour>& contours);
    void filling(const vector<Contour>& contours, vector<Segment>& fillings, const int& level, const bool& is_plane);
    void gcode(const string& path);

public:
    explicit stl2gcode(const string& path, const stl2gcode_parameters& parameters);
    void convert(const string& path);
};

#endif
