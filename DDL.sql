DROP DATABASE IF EXISTS hotel_reservas;
CREATE DATABASE hotel_reservas;
USE hotel_reservas;

/* tabla de clientes*/
CREATE TABLE cliente(
    id_cli INT(10) PRIMARY KEY,
    nom VARCHAR(50),
    apell VARCHAR(50),
    email VARCHAR(100),
    tel VARCHAR(20)
);
/*tabla de habitaciones*/
CREATE TABLE habitacion(
    id_hab INT(10) PRIMARY KEY,
    tipo VARCHAR(20),
    capacid INT(10),
    prec_noche DECIMAL(10,2),
    disp BOOLEAN DEFAULT TRUE
);
/*tabla de reservas*/
CREATE TABLE reserva(
    id_res INT(10) PRIMARY KEY AUTO_INCREMENT,
    fech_res TIMESTAMP,
    fech_entr DATE,
    fech_sal DATE,
    noches INT(10),
    tot DECIMAL(10,2),
    descuento DECIMAL(10,2) DEFAULT 0,
    id_cli INT(10),
    id_hab INT(10)
);
ALTER TABLE reserva
ADD FOREIGN KEY (id_cli) REFERENCES cliente(id_cli),
ADD FOREIGN KEY (id_hab) REFERENCES habitacion(id_hab);