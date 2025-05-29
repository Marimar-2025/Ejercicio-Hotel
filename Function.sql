USE `hotel_reservas`;
DROP function IF EXISTS `calcular_descuento`;

DELIMITER $$
USE `hotel_reservas`$$
CREATE FUNCTION `calcular_descuento`(dias_anti INT, monto DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE descuento DECIMAL(10,2) DEFAULT 0;
    
    IF dias_anti >= 15 THEN
        SET descuento = monto * 0.10; -- 10% de descuento
    END IF;
    
    RETURN descuento;
END$$

DELIMITER ;