from database.db import get_connection
from .entities.tipo_ambiente import Tipo_Ambiente

class Tipo_AmbienteModel():
    @classmethod
    def get_tipos_ambientes(self):
        try:
            connection = get_connection()
            tipos_ambientes = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_tipo_ambiente, nombre_ta FROM tipo_ambiente;')
                resultset = cursor.fetchall()
                for row in resultset:
                    tipos_ambientes.append(Tipo_Ambiente(row[0],row[1]).to_JSON())
            connection.close()
            return tipos_ambientes
        except Exception as ex:
            raise Exception(ex)