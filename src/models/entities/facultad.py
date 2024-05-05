class Facultad():
    def __init__(self,cod_facultad, nombre_fac):
        self.cod_facultad = cod_facultad
        self.nombre_fac = nombre_fac
    
    def to_JSON(self):
        return{
            'cod_facultad' : self.cod_facultad,
            'nombre_fac' : str(self.nombre_fac).strip()
        }
    
