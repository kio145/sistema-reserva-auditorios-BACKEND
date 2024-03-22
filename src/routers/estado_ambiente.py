from flask import Blueprint,jsonify,request
from models.estado_ambienteModel import Estado_AmbienteModel
main = Blueprint('estado_ambiente_blueprint', __name__)
@main.route('/all')
def get_estados_ambientes():
    try:
        estados_ambiente = Estado_AmbienteModel.get_estados_ambientes()
        return jsonify(estados_ambiente)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500