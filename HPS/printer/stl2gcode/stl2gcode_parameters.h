#ifndef STL2GCODE_STL2GCODE_PARAMETERS_H
#define STL2GCODE_STL2GCODE_PARAMETERS_H

struct stl2gcode_parameters {
    float layer_height = 0.2f; //!< Высота слоя (мм).
    float nozzle_diameter = 0.25f; //!< Диаметр экструдера (мм).
    float thread_thickness = 1.75f; //!< Диаметр пластика (мм).
    float top_bottom_thickness = 0.4f; //!< Высота ? (мм).
    float shell_thickness = 1.0f; //!< Толщена стенок (мм). Не будет реализовано в данной версии.
    float filling_density = 0.15; //!< Плотность заполнения (%).
    int nozzle_temperature = 205; //!< Темпиратура экструдера (С).
    int table_temperature = 55; //!< Темпиратура стола (С).
    int printing_speed = 35; //!< Скорость печати (мм/с).
    int filling_speed = 40; //!< Скорость заполнения (мм/с).
    int moving_speed = 90; //!< Скорость перемещения (мм/с).

    int printer_width = 215; //!< Ширина принтера (мм).
    int printer_depth = 215; //!< Длина принтера (мм).
    int printer_height = 300; //!< Высота принтера (мм).
};

#endif //STL2GCODE_STL2GCODE_PARAMETERS_H
