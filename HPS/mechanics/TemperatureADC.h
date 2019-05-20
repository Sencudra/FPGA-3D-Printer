#ifndef INC_3D_PRINTER_TEMP_11_H
#define INC_3D_PRINTER_TEMP_11_H

//
// Analog to digit converter.
// From thermistor 100K : temp_11
//

#define oversampling_rate 1

const int32_t temptable_11[][2] = {
        {  110*oversampling_rate ,  300 },
        {  117*oversampling_rate ,  295 },
        {  124*oversampling_rate ,  290 },
        {  132*oversampling_rate ,  285 },
        {  141*oversampling_rate ,  280 },
        {  150*oversampling_rate ,  275 },
        {  160*oversampling_rate ,  270 },
        {  170*oversampling_rate ,  265 },
        {  182*oversampling_rate ,  260 },
        {  195*oversampling_rate ,  255 },
        {  208*oversampling_rate ,  250 },
        {  223*oversampling_rate ,  245 },
        {  239*oversampling_rate ,  240 },
        {  257*oversampling_rate ,  235 },
        {  276*oversampling_rate ,  230 },
        {  297*oversampling_rate ,  225 },
        {  319*oversampling_rate ,  220 },
        {  344*oversampling_rate ,  215 },
        {  371*oversampling_rate ,  210 },
        {  400*oversampling_rate ,  205 },
        {  432*oversampling_rate ,  200 },
        {  467*oversampling_rate ,  195 },
        {  505*oversampling_rate ,  190 },
        {  547*oversampling_rate ,  185 },
        {  592*oversampling_rate ,  180 },
        {  642*oversampling_rate ,  175 },
        {  695*oversampling_rate ,  170 },
        {  753*oversampling_rate ,  165 },
        {  816*oversampling_rate ,  160 },
        {  884*oversampling_rate ,  155 },
        {  957*oversampling_rate ,  150 },
        {  1035*oversampling_rate ,  145 },
        {  1119*oversampling_rate ,  140 },
        {  1208*oversampling_rate ,  135 },
        {  1302*oversampling_rate ,  130 },
        {  1401*oversampling_rate ,  125 },
        {  1505*oversampling_rate ,  120 },
        {  1613*oversampling_rate ,  115 },
        {  1723*oversampling_rate ,  110 },
        {  1836*oversampling_rate ,  105 },
        {  1950*oversampling_rate ,  100 },
        {  2064*oversampling_rate ,  95 },
        {  2177*oversampling_rate ,  90 },
        {  2288*oversampling_rate ,  85 },
        {  2395*oversampling_rate ,  80 },
        {  2498*oversampling_rate ,  75 },
        {  2595*oversampling_rate ,  70 },
        {  2685*oversampling_rate ,  65 },
        {  2769*oversampling_rate ,  60 },
        {  2845*oversampling_rate ,  55 },
        {  2914*oversampling_rate ,  50 },
        {  2976*oversampling_rate ,  45 },
        {  3030*oversampling_rate ,  40 },
        {  3077*oversampling_rate ,  35 },
        {  3117*oversampling_rate ,  30 },
        {  3152*oversampling_rate ,  25 },
        {  3181*oversampling_rate ,  20 },
        {  3205*oversampling_rate ,  15 },
        {  3225*oversampling_rate ,  10 },
        {  3242*oversampling_rate ,  5 },
        {  3255*oversampling_rate ,  0 }
};

#endif //INC_3D_PRINTER_TEMP_11_H