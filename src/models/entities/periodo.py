class Periodo():
    def __init__(self,cod_periodo = None, fecha_inicio_per = None, fecha_fin_per = None):
        self.cod_periodo = cod_periodo
        self.fecha_inicio_per = fecha_inicio_per
        self.fecha_fin_per = fecha_fin_per
    
    def to_JSON(self):
        return{
            'cod_periodo' : str(self.cod_periodo),
            'fecha_inicio_per': str(self.fecha_inicio_per),
            'fecha_fin_per': str(self.fecha_fin_per)
        }