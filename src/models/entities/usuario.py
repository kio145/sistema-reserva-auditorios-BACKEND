class Usuario():
    def __init__(self, cod_usuario=None, nombre_usu=None, contrasenia_usu=None):
        self.cod_usuario = cod_usuario
        self.nombre_usu = nombre_usu
        self.contrasenia_usu = contrasenia_usu
    
    def to_JSON(self):
        return {
            'cod_usuario': str(self.cod_usuario),
            'nombre_usu': self.nombre_usu,
            'contrasenia_usu': self.contrasenia_usu
        }
    
