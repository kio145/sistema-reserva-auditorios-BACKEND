from flask import Blueprint,jsonify,request
from models.edificacionModel import EdificacionModel

main = Blueprint('edificio_blueprint', __name__)

@main.route('/all')
def get_edificaciones():
    try:
        edificaciones = EdificacionModel.get_edificaciones()
        return jsonify(edificaciones)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
