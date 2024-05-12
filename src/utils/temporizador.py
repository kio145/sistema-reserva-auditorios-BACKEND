from database.db import get_connection
from datetime import date, timedelta
class Temporizador():

    def cerrarPeriodo():
        try:
            connection = get_connection()
            with connection.cursor() as cursor:
                cursor.execute('''
                    SELECT cod_periodo_reserva, fecha_fin_general_per
                    FROM periodo_reserva
                    WHERE estado_visualizacion_per = TRUE
                    LIMIT 1;
                ''')
                result = cursor.fetchone()
                if result is not None:
                    fecha_actual = date.today()
                    if fecha_actual == result[1] + timedelta(days=1):
                        cursor.execute('''
                            UPDATE periodo_reserva
                            SET estado_visualizacion_per = FALSE
                            WHERE cod_periodo_reserva = %s;
                        ''',(result[0],))
                        connection.commit()
                        cursor.execute('DELETE FROM ajuste_ambiente;')
                        connection.commit()
            connection.close()
        except Exception as ex:
            raise Exception(ex)



