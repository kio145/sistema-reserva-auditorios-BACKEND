class Transformacion():
    def convertirTuplaFiltraddor(filtro):
        return tuple([int(s.strip('"')) for s in filtro.split(',')])