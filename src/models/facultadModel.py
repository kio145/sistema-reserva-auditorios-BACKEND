from database.db import get_connection
from .entities.facultad import Facultad

class FacultadModel():
    @classmethod
    def get_facultades(self):
        try:
            connection = get_connection()
            facultades = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_facultad,nombre_fac FROM facultad;')
                resultset = cursor.fetchall()
                for row in resultset:
                    facultades.append(Facultad(row[0],row[1]).to_JSON())
            connection.close()
            return facultades
        except Exception as ex:
            raise Exception(ex)