from database.db import get_connection
from .entities.edificio import Edificio

class EdificioModel():
    @classmethod
    def get_edificios(self):
        try:
            connection = get_connection()
            edificios = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_edificio,nombre_edi FROM edificio;')
                resultset = cursor.fetchall()
                for row in resultset:
                    edificios.append(Edificio(row[0],row[1]).to_JSON())
            connection.close()
            return edificios
        except Exception as ex:
            raise Exception(ex)
        

