#include "Vertex.h"
#include <cmath>

using namespace std;

float hypot(float x, float y, float z) {
    return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
}

Vertex::Vertex(float x, float y, float z) : x(x), y(y), z(z) {}

bool Vertex::between_with_e(const Vertex &v1, const Vertex &v2) const {
    float e = 0.00005f;
    return ((((v1.x - e <= this->x) && (this->x <= v2.x + e)) || ((v2.x - e <= this->x) && (this->x <= v1.x + e)))
            && (((v1.y - e <= this->y) && (this->y <= v2.y + e)) || ((v2.y - e <= this->y) && (this->y <= v1.y + e)))
            && (((v1.z - e <= this->z) && (this->z <= v2.z + e)) || ((v2.z - e <= this->z) && (this->z <= v1.z + e))));
}

Vertex Vertex::operator+(const Vertex& v) const {
    return Vertex(this->x + v.x, this->y + v.y, this->z + v.z);
}

Vertex Vertex::operator-(const Vertex& v) const {
    return Vertex(this->x - v.x, this->y - v.y, this->z - v.z);
}

Vertex& Vertex::operator+=(const Vertex &v) {
    *this = *this + v;
    return *this;
}

bool Vertex::operator==(const Vertex& v) const  {
    return ((this->x == v.x) && (this->y == v.y) && (this->z == v.z));
}

bool Vertex::operator!=(const Vertex &v) const {
    return !(*this == v);
}

bool Vertex::operator<(const Vertex& v) const {
    return (this->x * this->x + this->y * this->y + this->z * this->z) < (v.x * v.x + v.y + v.y + v.z + v.z);
}

float Vertex::distance(const Vertex &v) const {
    auto d = *this - v;
    return hypot(d.x, d.y, d.z);
}

ostream& operator << (ostream& stream, const Vertex& v) {
    stream << v.x << " " << v.y << " " << v.z;
    return stream;
}