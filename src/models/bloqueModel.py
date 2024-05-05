from database.db import get_connection
from .entities.bloque import Bloque

class BloqueModel():
    @classmethod
    def get_bloques(self):
        try:
            connection = get_connection()
            bloques = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_bloque, nombre_blo, hora_inicio_blo, hora_fin_blo FROM bloque;')
                resultset = cursor.fetchall()
                for row in resultset:
                    bloques.append(Bloque(row[0], row[1], row[2], row[3]).to_JSON())
            connection.close()
            return bloques
        except Exception as ex:
            raise Exception(ex)
        
