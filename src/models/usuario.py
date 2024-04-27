from database.db import get_connection
from .entities.piso import Piso

class PisoModel():
    @classmethod
    def get_pisos(self):
        try:
            connection = get_connection()
            pisos = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_piso,nombre_pis FROM piso;')
                resultset = cursor.fetchall()
                for row in resultset:
                    pisos.append(Piso(row[0],row[1]).to_JSON())
            connection.close()
            return pisos
        except Exception as ex:
            raise Exception(ex)