from flask import Flask
from flask_cors import CORS
from config import config
from routers import Empleado

app = Flask(__name__)

#CORS(app,resources = {'*': {'origin':'http//localhost:3000'}})

def page_not_found(error):
    return '<h1>Not found page</h1>',404


if __name__=='__main__':
    app.config.from_object(config['development'])
    app.register_blueprint(Empleado.main, url_prefix='/api/empleados')
    app.register_error_handler(404,page_not_found)
    app.run()

