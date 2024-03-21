class Piso():
    def __init__(self,cod_piso = None, nombre_pis = None):
        self.cod_piso = cod_piso
        self.nombre_pis = nombre_pis
    
    def to_JSON(self):
        return{
            'cod_piso' : str(self.cod_piso),
            'nombre_piso' : str(self.nombre_pis)
        }