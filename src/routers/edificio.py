from flask import Blueprint,jsonify,request
from models.edificioModel import EdificioModel
from models.entities.edificio import Edificio
import uuid

main = Blueprint('edificio_blueprint', __name__)

@main.route('/all')
def get_edificios():
    try:
        edificios = EdificioModel.get_edificios()
        return jsonify(edificios)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
