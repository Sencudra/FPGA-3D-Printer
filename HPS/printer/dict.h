#ifndef INC_3D_PRINTER_DICT_H
#define INC_3D_PRINTER_DICT_H

#include <vector>
#include <algorithm>

using namespace std;

template <typename K, typename V>
class dict {
    typedef pair<K, V> value_type;
    vector<value_type> values;
public:
    dict()= default;

    dict(const initializer_list<value_type>& _values) {
        copy(_values.begin(), _values.end(), values.begin());
    }
    /*dict(const dict& _dict) {
        copy(_dict.values.begin(), _dict.values.end(), this->values.begin());
    }*/

    /*dict(const vector<value_type>& values) {
        copy(values.begin(), values.end(), this->values.begin());
    }*/

    void insert(K key, V value) {
        values.emplace_back(key, value);
    }

    bool find(K key) {
        return values.end() != find_if(values.begin(), values.end(), [&key] (const value_type& parameter) -> bool {
            return parameter.first == key;
        });
    }

    V& operator[](K key) {
        auto parameter = find_if(values.begin(), values.end(), [&key] (const value_type& parameter) -> bool {
            return parameter.first == key;
        });
        return parameter->second;
    }

};


#endif //INC_3D_PRINTER_DICT_H
