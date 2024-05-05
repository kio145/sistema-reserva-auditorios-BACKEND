from flask import Blueprint,jsonify,request
from models.bloqueModel import BloqueModel

main = Blueprint('bloque_blueprint',__name__)

@main.route('/all')
def get_bloques_all():
    try:
        bloques = BloqueModel.get_bloques()
        return jsonify(bloques)
    except Exception as ex:
        return jsonify({'message':str(ex)}),500