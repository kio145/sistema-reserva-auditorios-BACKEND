class Edificacion():
    def __init__(self,cod_edificacion,nombre_edi):
        self.cod_edificacion = cod_edificacion
        self.nombre_edi = nombre_edi
    
    def to_JSON(self):
        return{
            'cod_edificacion' : self.cod_edificacion,
            'nombre_edi' : str(self.nombre_edi).strip()
        }