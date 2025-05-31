DELIMITER //

CREATE TRIGGER `validar_disponibilidad`
BEFORE INSERT ON `reserva` FOR EACH ROW
BEGIN
    DECLARE disp BOOLEAN;  
    
    -- disponibilidad de la habitación
    SELECT disp INTO disp
    FROM habitacion 
    WHERE id_hab = NEW.id_hab; 
    
    -- Si no está disponible, genera error
    IF NOT disp THEN
	SIGNAL SQLSTATE '45000'  
    SET MESSAGE_TEXT = 'La habitación no está disponible en las fechas seleccionadas';
    END IF;
    
    -- Validación de fechas
    IF NEW.fech_sal <= NEW.fech_entr THEN
    SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'La fecha de salida debe ser despues a la fecha de entrada';
    END IF;
END //

DELIMITER ;