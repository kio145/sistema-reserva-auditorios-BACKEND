import hashlib

class Transformacion():

    def convertirTuplaFiltraddor(filtro):
        return tuple([int(s.strip('"')) for s in filtro.split(',')])
    
    def transformarSHA512(contrasenia):
        return hashlib.sha512(contrasenia.encode()).hexdigest()