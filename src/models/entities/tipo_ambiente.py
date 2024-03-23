class Tipo_Ambiente():
    def __init__(self,cod_tipo_ambiente,nombre_ta):
        self.cod_tipo_ambiente = cod_tipo_ambiente
        self.nombre_ta = nombre_ta

    def to_JSON(self):
        return{
            'cod_tipo_ambiente' : str(self.cod_tipo_ambiente),
            'nombre_ta' : str(self.nombre_ta).strip()
        }
