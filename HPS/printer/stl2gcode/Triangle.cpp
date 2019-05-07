#include "Triangle.h"
#include "Segment.h"

#include <algorithm>
#include <vector>
#include <iostream>

using namespace std;

Triangle::Triangle(Vertex v1, Vertex v2, Vertex v3) : v1(v1), v2(v2), v3(v3) {}

float Triangle::x_min() const {
    return min(v1.x, min(v2.x, v3.x));
}

float Triangle::x_max() const {
    return max(v1.x, max(v2.x, v3.x));
}

float Triangle::y_min() const {
    return min(v1.y, min(v2.y, v3.y));
}

float Triangle::y_max() const {
    return max(v1.y, max(v2.y, v3.y));
}

float Triangle::z_min() const {
    return min(v1.z, min(v2.z, v3.z));
}

float Triangle::z_max() const {
    return max(v1.z, max(v2.z, v3.z));
}

bool Triangle::belong_to_plane_z() const {
    return (v1.z == v2.z) && (v2.z == v3.z);
}

Triangle& Triangle::operator+=(Vertex shift) {
    v1 += shift;
    v2 += shift;
    v3 += shift;
    return *this;
}

std::vector<Vertex> Triangle::intersect(float z) const {
    Segment l1(v1, v2), l2(v2, v3), l3(v3, v1);
    Vertex p1 = l1.intersect_with_plane(z);
    Vertex p2 = l2.intersect_with_plane(z);
    Vertex p3 = l3.intersect_with_plane(z);

    vector<Vertex> res;
    if (p1.between_with_e(v1, v2))
        res.push_back(p1);
    if (p2.between_with_e(v2, v3) && find(res.begin(), res.end(), p2) == res.end())
        res.push_back(p2);
    if (p3.between_with_e(v3, v1) && find(res.begin(), res.end(), p3) == res.end())
        res.push_back(p3);

    return res;
}

std::ostream& operator << (std::ostream& stream, const Triangle& t) {
    stream << t.v1 << " " << t.v2 << " " << t.v3;
    return stream;
}