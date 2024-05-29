/*Piso*/
INSERT INTO PISO (NOMBRE_PIS)
VALUES 
    ('Sótano'),
    ('Planta Baja'),
    ('Primer Piso'),
    ('Segundo Piso'),
    ('Tercer Piso'),
    ('Cuarto Piso'),
    ('Quinto Piso'),
    ('Sexto Piso'),
    ('Séptimo Piso'),
    ('Octavo Piso'),
    ('Noveno Piso'),
    ('Décimo Piso');


/*Edificio*/
INSERT INTO EDIFICACION (NOMBRE_EDI)
VALUES 
    ('DPTO. DE BIOLOGIA'),
    ('DPTO. DE QUIMICA'),
    ('DPTO. DE FISICA'),
    ('BLOQUE CENTRAL'),
    ('BIBLIOTECA FCYT '),
    ('DPTO. INDUSTRIAL'),
    ('PLTA. PROCS. INDS'),
    ('SEC. LAB. MECANICA'),
    ('EDIF. CAD-CAM'),
    ('EDIF. ELEKTRO'),
    ('EDIF. ACADEMCIO 2'),
    ('EDIF. DE LAB. BASICOS');


/*Facultad*/
INSERT INTO FACULTAD (NOMBRE_FAC)
VALUES 
    ('Facultad de Ciencias'),
    ('Facultad de Ingeniería'),
    ('Facultad de Artes'),
    ('Facultad de Derecho'),
    ('Facultad de Economia'),
    ('Facultad de Medicina');

/*Tipo ambiente*/
INSERT INTO TIPO_AMBIENTE (NOMBRE_TA)
VALUES 
    ('Laboratorio'),
    ('Aula'),
    ('Oficina'),
    ('Sala de Conferencias');

/*Estado ambiente*/
INSERT INTO ESTADO_AMBIENTE (NOMBRE_EA)
VALUES 
    ('Disponible'),
    ('No Disponible');

/*Tipo_Final*/
INSERT INTO TIPO_FINAL (NOMBRE_TF) VALUES
    ('Docente'),
    ('Auxiliar'),
    ('Estudiante');

INSERT INTO DIA (NOMBRE_DIA) VALUES
    ('Lunes'),
    ('Martes'),
    ('Miercoles'),
    ('Jueves'),
    ('Viernes'),
    ('Sabado'),
    ('Domingo');

INSERT INTO bloque (nombre_blo, hora_inicio_blo, hora_fin_blo)
VALUES 
('A', '06:45:00', '08:15:00'),
('B', '08:15:00', '09:45:00'),
('C', '09:45:00', '11:15:00'),
('D', '11:15:00', '12:45:00'),
('E', '12:45:00', '14:15:00'),
('F', '14:15:00', '15:45:00'),
('G', '15:45:00', '17:15:00'),
('H', '17:15:00', '18:45:00'),
('I', '18:45:00', '20:15:00'),
('J', '20:15:00', '21:45:00');



