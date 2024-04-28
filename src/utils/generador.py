class Generador():
    def generadorSql(filtro: tuple):
        sql = 'SELECT a.cod_ambiente, a.nombre_amb, e.nombre_ea, a.capacidad_amb From ambiente a JOIN estado_ambiente e ON a.cod_estado_ambiente = e.cod_estado_ambiente'
        if not all(e == -1 for e in filtro):
            where = ' WHERE '
            sql += where
            p1 = p2 = p3 = p4 = ''
            if filtro[0] != -1:
                p1 = 'a.cod_tipo_ambiente = %s' % filtro[0]
            if filtro[1] != -1:
                p2 = 'a.cod_facultad = %s' % filtro[1]
            if filtro[2] != -1:
                p3 = 'a.cod_edificacion = %s' % filtro[2]
            if filtro[3] != -1:
                p4 = 'a.cod_estado_ambiente = %s' % filtro[3]
            sql += (p1 if p1 != '' else '') +(' AND ' if p1 != '' and (p2 != '' or p3 != '' or p4 != '') else '') \
            + (p2 if p2 != '' else '') + (' AND ' if p2 != '' and (p3 != '' or p4 != '') else '') \
            + (p3 if p3 != '' else '') + (' AND ' if p3 != '' and p4 != '' else '')  + (p4 if p4 != '' else '')
        return sql + ';'

        
                

