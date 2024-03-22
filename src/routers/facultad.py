from flask import Blueprint,jsonify,request
from models.facultadModel import FacultadModel

main = Blueprint('facultad_blueprint', __name__)

@main.route('/all')
def get_facultades():
    try:
        facultades = FacultadModel.get_facultades()
        return jsonify(facultades)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
