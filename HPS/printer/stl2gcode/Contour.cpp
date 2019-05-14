#include "Contour.h"

ostream& operator<<(ostream& stream, const Contour& contour) {
    for (auto& vertex : contour) {
        stream << vertex << " ";
    }
    return stream;
}