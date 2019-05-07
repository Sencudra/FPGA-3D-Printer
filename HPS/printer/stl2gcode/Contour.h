#ifndef STL2GCODE_CONTOUR_H
#define STL2GCODE_CONTOUR_H

#include <vector>
#include <ostream>

#include "Vertex.h"

using namespace std;


typedef vector<Vertex> Contour;

ostream& operator<<(ostream& stream, const Contour& contour);

#endif //STL2GCODE_CONTOUR_H
