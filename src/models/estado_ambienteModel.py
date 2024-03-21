from database.db import get_connection
from .entities.estado_ambiente import Estado_Ambiente

class Estado_AmbienteModel():
    @classmethod
    def get_estados_ambientes(self):
        try:
            connection = get_connection()
            estados_ambientes = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_estado_ambiente,nombre_ea FROM estado_ambiente;')
                resultset = cursor.fetchall()
                for row in resultset:
                    estados_ambientes.append(Estado_Ambiente(row[0],row[1]).to_JSON())
            connection.close()
            return estados_ambientes
        except Exception as ex:
            raise Exception(ex)