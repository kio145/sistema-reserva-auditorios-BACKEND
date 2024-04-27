class Ambiente():
    def __init__(self,cod_ambiente = None,nombre_amb = None,capacidad_amb = None,ubicacion_amb = None,descripcion_amb = None, albergacion_max_amb = None, albergacion_min_amb = None, cod_facultad = None,cod_estado_ambiente = None,cod_piso = None,cod_tipo_ambiente = None,cod_edificacion = None):
        self.cod_ambiente = cod_ambiente
        self.nombre_amb = nombre_amb
        self.capacidad_amb = capacidad_amb
        self.ubicacion_amb = ubicacion_amb
        self.descripcion_amb = descripcion_amb
        self.albergacion_max_amb = albergacion_max_amb
        self.albergacion_min_amb = albergacion_min_amb
        self.cod_facultad = cod_facultad
        self.cod_estado_ambiente = cod_estado_ambiente
        self.cod_piso = cod_piso
        self.cod_tipo_ambiente = cod_tipo_ambiente
        self.cod_edificacion = cod_edificacion
        
    def to_JSON(self):
        return{
            'cod_ambiente' : str(self.cod_ambiente),
            'nombre_amb' : str(self.nombre_amb).strip(),
            'capacidad_amb' : str(self.capacidad_amb),
            'ubicacion_amb' : str(self.ubicacion_amb).strip(),
            'descripcion_amb' : str(self.descripcion_amb).strip(),
            'albergacion_max_amb' : str(self.albergacion_max_amb),
            'albergacion_min_amb' : str(self.albergacion_min_amb),
            'cod_facultad' : str(self.cod_facultad),
            'cod_estado_ambiente' : str(self.cod_estado_ambiente),
            'cod_piso' : str(self.cod_piso),
            'cod_tipo_ambiente' : str(self.cod_tipo_ambiente),
            'cod_edificacion' : str(self.cod_edificacion)
        }

    def to_JSONALL(self):
        return{
            'cod_ambiente' : str(self.cod_ambiente),
            'nombre_amb' : str(self.nombre_amb).strip(),
            'estado_ambiente' : str(self.cod_estado_ambiente).strip(),
            'capacidad_amb' : str(self.capacidad_amb)
        }