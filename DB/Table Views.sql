-- Create Open Orders w/ Payments View
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `open_orders_w_payment` AS
    SELECT 
        `o`.`order_id` AS `order_id`,
        `oi`.`dish_id` AS `dish_id`,
        `o`.`order_number` AS `order_number`,
        `o`.`order_status` AS `order_status`,
        `o`.`order_start_time` AS `order_start_time`,
        `oi`.`orditm_cost` AS `dish_cost`,
        `o`.`order_cost` AS `order_cost`,
        `p`.`acc_id` AS `acc_id`,
        `p`.`payment_cc_num` AS `payment_cc_num`,
        `p`.`payment_cc_exp` AS `payment_cc_exp`,
        `p`.`payment_cc_cvv` AS `payment_cc_cvv`,
        `p`.`payment_cc_zip` AS `payment_cc_zip`
    FROM
        ((`orders` `o`
        LEFT JOIN `ordered_items` `oi` ON ((`o`.`order_id` = `oi`.`order_id`)))
        LEFT JOIN `payments` `p` ON ((`p`.`acc_id` = `o`.`acc_id`)))
    WHERE
        (`o`.`order_status` <> 'CLOSED')