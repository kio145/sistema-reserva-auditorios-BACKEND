from flask import Blueprint,jsonify,request
from models.pisoModel import PisoModel

main = Blueprint('piso_blueprint', __name__)

@main.route('/all')
def get_pisos():
    try:
        pisos = PisoModel.get_pisos()
        return jsonify(pisos)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
