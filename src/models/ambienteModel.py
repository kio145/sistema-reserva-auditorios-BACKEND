from database.db import get_connection
from .entities.ambiente import Ambiente

class AmbienteModel():
    @classmethod
    def get_ambientes(self):
        try:
            connection = get_connection()
            ambientes = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_ambiente,nombre_amb,descripcion_amb FROM ambiente;')
                resultset = cursor.fetchall()
                for row in resultset:
                    ambientes.append(Ambiente(row[0],row[1]).to_JSON())
            connection.close()
            return ambientes
        except Exception as ex:
            raise Exception(ex)