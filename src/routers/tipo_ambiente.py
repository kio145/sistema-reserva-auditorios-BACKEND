from flask import Blueprint,jsonify,request
from models.tipo_ambienteModel import Tipo_AmbienteModel

main = Blueprint('tipo_ambiente_blueprint', __name__)

@main.route('/all')
def get_tipos_ambientes():
    try:
        tipos_ambiente = Tipo_AmbienteModel.get_tipos_ambientes()
        return jsonify(tipos_ambiente)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
