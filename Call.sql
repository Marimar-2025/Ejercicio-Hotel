#clientes
CALL cliente(100, 'Juan', 'Gómez', 'juan@email.com', '3223223');
CALL cliente(101, 'Ana', 'López', 'ana@email.com', '312344545');
CALL cliente(102, 'Lucas', 'Avila', 'lucas@email.com', '312344545');
CALL cliente(103, 'Guillermo', 'Perez', 'guille@email.com', '312344545');

#Reservas
-- Debe mostrar error del trigger/ aparece mensaje
CALL realizar_reserva(101, 103, '2025-05-10', '2025-05-08');

-- Reserva CON descuento (16 días de anticipación)
CALL realizar_reserva(102, 104, '2025-06-15', '2025-06-20');
-- Reserva SIN descuento (2 días de anticipación)
CALL realizar_reserva(103, 102, '2025-06-01', '2025-06-05');

CALL realizar_reserva(103, 103, '2025-06-15', '2025-06-20');

