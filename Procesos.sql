USE `hotel_reservas`;
DROP procedure IF EXISTS `cliente`;

DELIMITER $$
USE `hotel_reservas`$$
CREATE PROCEDURE `cliente` (
    id_cli INT,
    nom VARCHAR(50),
    apell VARCHAR(50),
    email VARCHAR(100),
    tel VARCHAR(20)
)
BEGIN
 INSERT INTO cliente(id_cli,nom,apell,email,tel)
 VALUES (id_cli,nom,apell,email,tel);
END$$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `realizar_reserva`(
    IN id_cli INT,    
    IN id_hab INT,    
    IN fech_entr DATE, 
    IN fech_sal DATE 
)
BEGIN
    DECLARE noches INT;
    DECLARE prec_noche DECIMAL(10,2);
    DECLARE total DECIMAL(10,2);
    DECLARE dias_anti INT;
    DECLARE descuento DECIMAL(10,2);
    
    /*días anticipados*/
    SET dias_anti = DATEDIFF(fech_entr, NOW());
    
    /*noches*/
    SET noches = DATEDIFF(fech_sal, fech_entr);
    
    /*precio habitacion*/
	SELECT h.prec_noche INTO prec_noche 
    FROM habitacion h 
    WHERE h.id_hab = id_hab
    LIMIT 1;
    
    /*Cálculo sin descuento*/
    SET total = noches * prec_noche;
    
    /*llama a la función calcular_descuento*/
    SET descuento = calcular_descuento(dias_anti, total);
    
    INSERT INTO reserva (fech_entr, fech_sal, noches, tot, descuento, id_cli, id_hab)
    VALUES (fech_entr, fech_sal, noches, total - descuento, descuento, id_cli, id_hab);
    
    /*estado de la habitación*/
    UPDATE habitacion SET disp = FALSE WHERE habitacion.id_hab = id_hab;
    
    SELECT CONCAT('reserva realizada exitosamente.Total:', (total - descuento)) AS resultado;
END$$
DELIMITER ;
    



