# Titulo

### Descripcion:
El proyecto consiste en una aplicacion wep para poder realizar reservar de ambientes esto permitira que los usuario puedan realizarlos de una manera mas rapida.
### Herramientas a instalar:
* Postgres 16
* Python 3.12.0
* Visual Studio Code
### Preparacion de entorno de trabajo
1. Verificar que el archivo ```.env``` tenga los mismos datos que su postgres instalado en caso de que varien los datos usted podra cambiar la informacion del archivo ```.env``` a la que tiene definido su postgres, no obstante no cambie el valor de ```SECRET_KEY```, ```PGSQL_HOST```, ```PGSQL_DATABASE``` por ningun motivo.
2. Instalar el entorno vistual en la carpeta backend, el comando para ello es ```python -m venv venv```, todo esto en la terminal de ``visual studio code``.
3. Habilitar el entorno de trabajo, el comando para ello es ```venv\Scripts\activate```, todo esto en la terminal de ``visual studio code``.
4. Instalar el archivo ```requirements.txt``` esto con el objetivo de tener todas las librerias necesarias, el comando para ello es ```pip install -r requirements.txt```, todo esto en la terminal de ``visual studio code``.
5. Cree la base de datos en ```sistemareservadb``` de postgres 16, para ello el comando se encuentra en ```src\database\1_creator_database.sql```.
6. Cree las tablas y relaciones de la base datos en ```sistemareservadb```, para ello el comando se encuentra en ```src\database\2_creator_tables.sql```.
7. Inserte los datos precargados en ```sistemareservadb```, para ello el comando se encuentra en ```src\database\3_insert_dates.sql```.
8. Finalmente levante el servidor con el comando ```python src\app.py```, todo esto en la terminal de ``visual studio code``.

### Endpoints definidos
Estas no son mas que las rutas para consumir cierto recurso de la api rest.
* ruta: ``http://127.0.0.1:5000/piso/all``, nos proporciona la informacion de todos los pisos registrados en la base de datos.
* ruta: ``http://127.0.0.1:5000/edificacion/all``, nos proporciona la informacion de todos las edificaciones registrados en la base de datos.
* ruta: ``http://127.0.0.1:5000/facultad/all``, nos proporciona la informacion de todas las facultades registradas en la base de datos.
* ruta: ``http://127.0.0.1:5000/estado_ambiente/all``, nos proporciona la informacion de todos los estados de ambientes registrados en la base de datos.
* ruta: ``http://127.0.0.1:5000/tipo_ambiente/all``, nos proporciona la informacion de todos los tipos de ambientes registrados en la base de datos.
* ruta: ``http://127.0.0.1:5000/ambiente/all``, nos proporciona la informacion de todos los ambientes registrados en la base de datos.
* ruta: ``http://127.0.0.1:5000/ambiente/one/id``, nos proporciona la informacion de un ambiente registrado en la base de datos.
* ruta: ``http://127.0.0.1:5000/ambiente/add``, agrega un nuevo ambiente a la base de datos.
* ruta: ``http://127.0.0.1:5000/ambiente/delete/id``, elimina un ambiente de la base de datos.
* ruta: ``http://127.0.0.1:5000/ambiente/update/id``, actualiza un ambiente de la base de datos.
* ruta: ``http://127.0.0.1:5000/ambiente/filter/"filtro"``, nos proporciona la informacion de todos los ambientes registrados en la base de datos pero con la diferencia de realizar filtrados, para ello se recomienda usar este formato de string ``"1,2,9,-1"`` donde ``-1`` indica que no se esta filtrando por ese parametro, el primer parametro es ``Tipo de ambiente``, el segundo es ``Facultad``, el tercero es ``Edificio`` y el ultimo es ``Estado``.
