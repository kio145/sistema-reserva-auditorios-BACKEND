from database.db import get_connection
from .entities.periodo import Periodo

class PeriodoModel():
    @classmethod
    def get_periodos_all(self):
        try:
            connection = get_connection()
            periodos = []
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_periodo,fecha_inicio_per,fecha_fin_per FROM periodo;')
                resultset = cursor.fetchall()
                for row in resultset:
                    periodos.append(Periodo(row[0],row[1],row[2]).to_JSON())
            connection.close()
            return periodos
        except Exception as ex:
            raise Exception(ex)
    
    @classmethod
    def get_periodo_one(self,id):
        try:
            connection = get_connection()
            with connection.cursor() as cursor:
                cursor.execute('SELECT cod_periodo,fecha_inicio_per,fecha_fin_per FROM periodo WHERE cod_periodo = %s;',(id,))
                row = cursor.fetchone()
                periodo = None
                if row != None:
                    periodo = Periodo(row[0],row[1],row[2])
                    periodo = periodo.to_JSON()
                connection.close()
                return periodo
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_periodo(self,periodo):
        try:
            connection = get_connection()
            with connection.cursor() as cursor:
                cursor.execute('DELETE FROM periodo WHERE cod_periodo = %s',(periodo.cod_periodo))
                affected_rows_periodo = cursor.rowcount
                cursor.execute('DELETE FROM detalle_periodo WHERE cod_periodo = %s',(periodo.cod_periodo))
                affected_rows_detalle_periodo = cursor.rowcount
                connection.commit()
            connection.close()
            return affected_rows_periodo + affected_rows_detalle_periodo
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_periodo(self,periodo):
        try:
            connection = get_connection()
            with connection.cursor() as cursor:
                cursor.execute('UPDATE periodo SET fecha_inicio_per = %s, fecha_fin_per = %s WHERE cod_periodo = %s', (periodo.fecha_inicio_per,periodo.fecha_fin_per,periodo.cod_periodo))
                affected_rows = cursor.rowcount
                connection.commit()
            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def add_periodo(self,periodo):
        try:
            connection = get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO periodo (fecha_inicio_per,fecha_fin_per) VALUES ('%s', '%s')", (periodo.fecha_inicio_per,periodo.fecha_fin_per))
                affected_rows = cursor.rowcount
                connection.commit()
            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)