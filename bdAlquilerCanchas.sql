-- Crea la base de datos

CREATE DATABASE bdAlquilerCanchas;

-- Cambiar a la base de datos creada

USE bdAlquilerCanchas;

-- Crea la tabla cancha

CREATE TABLE cancha (

   cancha_id INT AUTO_INCREMENT PRIMARY KEY,

   nombreCancha VARCHAR(255) NOT NULL,

   direccion VARCHAR(255) NOT NULL,

   precioHora DECIMAL(10, 2) NOT NULL

);

 

-- Crea la tabla cliente

CREATE TABLE cliente (

   cliente_id INT AUTO_INCREMENT PRIMARY KEY,

   nombre VARCHAR(100) NOT NULL,

   apellido VARCHAR(100) NOT NULL,

  email VARCHAR(100) UNIQUE NOT NULL,

  telefono VARCHAR(15) NOT NULL

);

 

-- Crea la tabla reserva con relación a las canchas y clientes

CREATE TABLE reserva (

   reserva_id INT AUTO_INCREMENT PRIMARY KEY,

   cancha_id INT NOT NULL,

   cliente_id INT NOT NULL,

   fechaReserva DATE NOT NULL,

   horaInicio TIME NOT NULL,

   horaFin TIME NOT NULL,

  estadoReserva char(1) comment 'R: Reservado, P:Pagado, C:Cancelación',

   costoPagado DECIMAL(10, 2) NOT NULL,

  FOREIGN KEY (cancha_id) REFERENCES cancha (cancha_id),

  FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)

);

 

-- Crea un index para fechaReserva para mejorar el performants de las busquedas

CREATE INDEX idx_fechaReserva ON reserva (fechaReserva); 