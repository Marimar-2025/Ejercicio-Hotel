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


USE `hotel_reservas`;
DROP procedure IF EXISTS `realizar_reserva`;

USE `hotel_reservas`;
DROP procedure IF EXISTS `hotel_reservas`.`realizar_reserva`;
;

DELIMITER $$
USE `hotel_reservas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `realizar_reserva`(
    IN id_cli INT,    
    IN id_hab INT,    
    IN fech_entr DATE, 
    IN fech_sal DATE 
)
BEGIN
    DECLARE noches INT(10);
    DECLARE prec_noche DECIMAL(10,2);
    DECLARE total DECIMAL(10,2);
    DECLARE dias_anti INT(10);
    DECLARE descuento DECIMAL(10,2);
    
    /*dias acticipados*/
    SET dias_anti = DATEDIFF(p_fech_entr, CURDATE());
    
     /*noches*/
    SET noches = DATEDIFF(fech_sal, fech_entr);
    
    /*precio habitacion*/
    SELECT prec_noche INTO prec_noche FROM habitacion WHERE id_hab = id_hab;
    
    /*Cálculo sin descuento*/
    SET total = noches * prec_noche;
    
    /*llama a la función calcular_descuento*/
    SET descuento = cal_descuento(dias_anti, total);
    
    INSERT INTO reserva (fech_entr, fech_sal, noches, total, descuento, id_cli, id_hab)
    VALUES (fech_entr, fech_sal, noches, total - descuento, descuento, id_cli, id_hab);
    
	/*estado de la habitación*/
    UPDATE habitacion SET disponible = FALSE WHERE id_hab = id_hab;
END$$

DELIMITER ;
;


