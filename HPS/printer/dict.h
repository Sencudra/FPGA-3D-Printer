#ifndef INC_3D_PRINTER_DICT_H
#define INC_3D_PRINTER_DICT_H

#include <vector>
#include <algorithm>
#include <ostream>

using namespace std;

template <typename K, typename V>
class dict {
    typedef pair<K, V> value_type;
    vector<value_type> values;

public:
    dict()= default;

    dict(initializer_list<value_type> _values) {
        values.resize(_values.size());
        copy(_values.begin(), _values.end(), values.begin());
    }

    dict(const dict& _dict) {
        values.resize(_dict.values.size());
        copy(_dict.values.begin(), _dict.values.end(), values.begin());
    }

    dict& operator=(const dict& _dict) {
        values.resize(_dict.values.size());
        copy(_dict.values.begin(), _dict.values.end(), values.begin());
        return *this;
    }

    void insert(K key, V value) {
        values.emplace_back(key, value);
    }

    bool find(K key) const {
        return values.end() != find_if(values.begin(), values.end(), [&key] (const value_type& parameter) -> bool {
            return parameter.first == key;
        });
    }

    const V& operator[](K key) const {
        auto parameter = find_if(values.begin(), values.end(), [&key] (const value_type& parameter) -> bool {
            return parameter.first == key;
        });
        return parameter->second;
    }

    friend ostream& operator<< (ostream& stream, dict<K,V> d) {
        for (auto& value : d.values) {
            stream << value.first << " " << value.second << ", ";
        }
        return stream;
    }
};

typedef dict<char, float> Parameters;

#endif //INC_3D_PRINTER_DICT_H