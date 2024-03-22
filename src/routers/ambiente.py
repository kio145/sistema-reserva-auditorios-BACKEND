from flask import Blueprint,jsonify,request
from models.ambienteModel import AmbienteModel
from models.entities.ambiente import Ambiente
import uuid

main = Blueprint('ambiente_blueprint',__name__)

@main.route('/all')
def get_ambientes():
    try:
        ambientes = AmbienteModel.get_ambientes()
        return jsonify(ambientes)
    except Exception as ex:
        return jsonify({'message':str(ex)}),500

@main.route('/one/<id>')
def get_ambiente(id):
    try:
        ambiente = AmbienteModel.get_ambiente(id)
        if ambiente != None:
            return jsonify(ambiente)
        else:
            return jsonify({}),404
    except Exception as ex:
        return jsonify({'message':str(ex)}),500

@main.route('/add', methods=['POST'])
def add_ambiente():
    try:
        nombre_amb = request.json['nombre_amb']
        capacidad_amb = request.json['capacidad_amb']
        ubicacion_amb = request.json['ubicacion_amb']
        descripcion_amb = request.json['descripcion_amb']
        cod_estado_ambiente = request.json['cod_estado_ambiente']
        cod_piso = request.json['cod_piso']
        cod_edificio = request.json['cod_edificio']
        cod_facultad = request.json['cod_facultad']
        cod_tipo_ambiente = request.json['cod_tipo_ambiente']
        ambiente = Ambiente(nombre_amb, capacidad_amb, ubicacion_amb, descripcion_amb,
                            cod_estado_ambiente, cod_piso, cod_edificio, cod_facultad,
                            cod_tipo_ambiente)
        affected_rows, cod_ambiente = AmbienteModel.add_ambiente(ambiente)
        if affected_rows == 1:
            return jsonify(cod_ambiente)
        else:
            return jsonify({'message': "Error al insertar"}), 500
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500

@main.route('/delete/<id>', methods=['DELETE'])
def delete_ambiente(id):
    try:
        ambiente = Ambiente(id)
        affected_rows = AmbienteModel.delete_ambiente(ambiente)
        if affected_rows == 1:
            return jsonify(ambiente.cod_ambiente)
        else:
            return jsonify({'message': "Ambiente no eliminado"}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500

@main.route('/update/<id>', methods=['PUT'])
def update_ambiente(id):
    try:
        nombre_amb = request.json['nombre_amb']
        capacidad_amb = request.json['capacidad_amb']
        ubicacion_amb = request.json['ubicacion_amb']
        descripcion_amb = request.json['descripcion_amb']
        cod_estado_ambiente = request.json['cod_estado_ambiente']
        cod_piso = request.json['cod_piso']
        cod_edificio = request.json['cod_edificio']
        cod_facultad = request.json['cod_facultad']
        cod_tipo_ambiente = request.json['cod_tipo_ambiente']
        ambiente = Ambiente(id, nombre_amb, capacidad_amb, ubicacion_amb, descripcion_amb,
                            cod_estado_ambiente, cod_piso, cod_edificio, cod_facultad, cod_tipo_ambiente)
        affected_rows = AmbienteModel.update_ambiente(ambiente)
        if affected_rows == 1:
            return jsonify(ambiente.cod_ambiente)
        else:
            return jsonify({'message': "Error al actualizar el ambiente"}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
