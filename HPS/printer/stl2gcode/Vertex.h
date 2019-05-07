#ifndef STL2GCODE_VERTEX_H
#define STL2GCODE_VERTEX_H

#include <ostream>

class Vertex {
public:
    float x;
    float y;
    float z;
    explicit Vertex(float x = 0.0f, float y = 0.0f, float z = 0.0f);
    bool between_with_e(const Vertex &v1, const Vertex &v2) const ;

    Vertex operator+(const Vertex& v) const ;
    Vertex operator-(const Vertex& v) const ;

    Vertex& operator+=(const Vertex& v);

    bool operator==(const Vertex& v) const ;
    bool operator!=(const Vertex& v) const ;

    bool operator<(const Vertex& v) const ;

    float distance(const Vertex& v) const ;

    friend std::ostream& operator << (std::ostream& stream, const Vertex& v);
};

float hypot(float x, float y, float z);

#endif