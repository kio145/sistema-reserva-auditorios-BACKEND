from flask import Blueprint,jsonify,request
from models.periodoModel import PeriodoModel
from models.entities.periodo import Periodo

main = Blueprint('periodo_blueprint',__name__)

@main.route('/all')
def get_periodos_all():
    try:
        periodos = PeriodoModel.get_periodos_all()
        return jsonify(periodos)
    except Exception as ex:
        return jsonify({'message':str(ex)}),500

@main.route('/one/<id>')
def get_periodo_one(id):
    try:
        periodo = PeriodoModel.get_periodo_one(id)
        if periodo != None:
            return jsonify(periodo)
        else:
            return jsonify({}),404
    except Exception as ex:
        return jsonify({'message':str(ex)}),500

@main.route('/add', methods=['POST'])
def add_periodo():
    try:
        fecha_inicio_per = request.json['fecha_inicio_per']
        fecha_fin_per = request.json['fecha_fin_per']
        periodo = Periodo(fecha_inicio_per = str(fecha_inicio_per), fecha_fin_per = str(fecha_fin_per))
        affected_rows = PeriodoModel.add_periodo(periodo)
        if affected_rows == 1:
            return jsonify(affected_rows)
        else:
            return jsonify({'message': "Error al insertar"}), 500
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500

@main.route('/delete/<id>', methods=['DELETE'])
def delete_periodo(id):
    try:
        periodo = Periodo(id)
        affected_rows = PeriodoModel.delete_periodo(periodo)
        if affected_rows == 1:
            return jsonify(periodo.cod_periodo)
        else:
            return jsonify({'message': "Periodo no eliminado"}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500

@main.route('/update/<id>', methods=['PUT'])
def update_periodo(id):
    try:
        fecha_inicio_per = request.json['fecha_inicio_per']
        fecha_fin_per = request.json['fecha_fin_per']
        periodo = Periodo(id, fecha_inicio_per, fecha_fin_per)
        affected_rows = PeriodoModel.update_periodo(periodo)
        if affected_rows == 1:
            return jsonify(periodo.cod_periodo)
        else:
            return jsonify({'message': "Error al actualizar el periodo"}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500

