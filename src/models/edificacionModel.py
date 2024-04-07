from database.db import get_connection
from .entities.edificacion import Edificacion

class EdificacionModel():
    @classmethod
    def get_edificaciones(self):
        try:
            connection = get_connection()
            edificaciones = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_edificacion,nombre_edi FROM edificacion;')
                resultset = cursor.fetchall()
                for row in resultset:
                    edificaciones.append(Edificacion(row[0],row[1]).to_JSON())
            connection.close()
            return edificaciones
        except Exception as ex:
            raise Exception(ex)
        

