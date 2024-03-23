class Edificio():
    def __init__(self,cod_edificio,nombre_edi):
        self.cod_edificio = cod_edificio
        self.nombre_edi = nombre_edi
    
    def to_JSON(self):
        return{
            'cod_edificio' : str(self.cod_edificio),
            'nombre_edi' : str(self.nombre_edi).strip()
        }