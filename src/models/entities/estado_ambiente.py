class Estado_Ambiente():
    def __init__(self,cod_estado_ambiente,nombre_ea):
        self.cod_estado_ambiente = cod_estado_ambiente
        self.nombre_ea = nombre_ea

    def to_JSON(self):
        return{
            'cod_estado_ambiente' : self.cod_estado_ambiente,
            'nombre_ea' : str(self.nombre_ea).strip()
        }