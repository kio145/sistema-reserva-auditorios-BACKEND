class Bloque():
    def __init__(self, cod_bloque, nombre_blo, hora_inicio_blo, hora_fin_blo):
        self.cod_bloque = cod_bloque
        self.nombre_blo = nombre_blo
        self.hora_inicio_blo = hora_inicio_blo
        self.hora_fin_blo = hora_fin_blo
        
    
    def to_JSON(self):
        return{
            'cod_bloque' : self.cod_bloque,
            'nombre_blo' : str(self.nombre_blo).strip(),
            'hora_inicio_blo' : str(self.hora_inicio_blo),
            'hora_fin_blo' : str(self.hora_fin_blo)
        }