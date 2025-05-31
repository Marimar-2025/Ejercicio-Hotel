#habitaciones
INSERT INTO habitacion (id_hab, tipo, capacid, prec_noche, disp) VALUES 
(101, 'Individual', 1, 80.00, TRUE),
(102, 'Doble', 2, 120.00, TRUE),
(103, 'Triple', 3, 200.00, TRUE),
(104, 'Suite', 4, 500.00, TRUE);

-- Ver disponibilidad de habitaciones
SELECT id_hab, tipo, capacid, prec_noche, 
       CASE WHEN disp THEN 'Disponible' ELSE 'Ocupada' END AS estado
FROM habitacion;


SELECT * FROM habitacion WHERE id_hab = 101; -- si esta disponible es (1)
SELECT * FROM habitacion WHERE id_hab = 102; -- si no esta disponible (0)

-- Consultar todas las reservas
SELECT * FROM reserva;

SELECT * FROM cliente;

-- Buscar cliente 102
SELECT * FROM cliente WHERE id_cli = 102;