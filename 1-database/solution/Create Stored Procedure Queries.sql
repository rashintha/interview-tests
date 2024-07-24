DELIMITER //

CREATE PROCEDURE InsertProduct(IN product JSON)
BEGIN
    DECLARE productId INT;
    DECLARE productTypeAmountId INT;
    DECLARE typeId INT;
    DECLARE distributionId INT;
    DECLARE done INT DEFAULT 0;

    -- Cursor to iterate over the ProductTypeAmounts
    DECLARE cur CURSOR FOR 
        SELECT COALESCE(JSON_UNQUOTE(JSON_EXTRACT(pt.value, '$.id')), 0) 
        FROM JSON_TABLE(
            JSON_EXTRACT(product, '$.types'),
            '$[*]' COLUMNS (
                value JSON PATH '$'
            )
        ) AS pt;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Insert into Products table
    INSERT INTO Products (name, description, category, image, status, tags, created_by)
    VALUES (
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(product, '$.name')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(product, '$.description')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(product, '$.category')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(product, '$.image')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(product, '$.status')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(product, '$.tags')), ''),
        'system'
    );
    SET productId = LAST_INSERT_ID();
    INSERT INTO DebugLogs (log_message) VALUES (CONCAT('Inserted product with ID: ', productId));
    
    -- Insert into ProductRestrictions table
    IF JSON_LENGTH(product, '$.restrictions') > 0 THEN
        INSERT INTO ProductRestrictions (product_id, type, sub_type, value)
        SELECT 
            productId,
            COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.value, '$.type')), ''),
            COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.value, '$.subType')), ''),
            COALESCE(JSON_UNQUOTE(JSON_EXTRACT(r.value, '$.value')), '')
        FROM JSON_TABLE(
            JSON_EXTRACT(product, '$.restrictions'),
            '$[*]' COLUMNS (
                value JSON PATH '$'
            )
        ) AS r;
        INSERT INTO DebugLogs (log_message) VALUES ('Inserted product restrictions');
    END IF;
    
    -- Insert into ProductTypes table
    INSERT INTO ProductTypes (id, name, status)
    SELECT 
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(t.value, '$.id')), 0),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(t.value, '$.name')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(t.value, '$.status')), 'inactive')
    FROM JSON_TABLE(
        JSON_EXTRACT(product, '$.types'),
        '$[*]' COLUMNS (
            value JSON PATH '$'
        )
    ) AS t
    ON DUPLICATE KEY UPDATE id=id; -- Avoid duplication if type already exists
    INSERT INTO DebugLogs (log_message) VALUES ('Inserted or updated product types');
    
    -- Insert into ProductTypeAmounts table
    INSERT INTO ProductTypeAmounts (product_id, type_id, price, currency, status)
    SELECT 
        productId,
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(pt.value, '$.id')), 0),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(pt.value, '$.price')), 0),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(pt.value, '$.currency')), ''),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(pt.value, '$.status')), 'inactive')
    FROM JSON_TABLE(
        JSON_EXTRACT(product, '$.types'),
        '$[*]' COLUMNS (
            value JSON PATH '$'
        )
    ) AS pt;
    INSERT INTO DebugLogs (log_message) VALUES ('Inserted product type amounts');
    
    -- Insert into ProductTypeDistributions table
    INSERT IGNORE INTO ProductTypeDistributions (id, name, status)
    SELECT DISTINCT
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(d.value, '$.id')), 0),
        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(d.value, '$.name')), ''),
        'active' -- Assume all distributions are active for simplicity
    FROM JSON_TABLE(
        JSON_EXTRACT(product, '$.types[*].distributions'),
        '$[*]' COLUMNS (
            value JSON PATH '$'
        )
    ) AS d;
    INSERT INTO DebugLogs (log_message) VALUES ('Inserted or updated product type distributions');
    
    -- Iterate over ProductTypeAmounts using Cursor
    OPEN cur;
    fetch_loop: LOOP
        FETCH cur INTO typeId;
        IF done THEN
            LEAVE fetch_loop;
        END IF;
        
        SET productTypeAmountId = (SELECT id 
                                   FROM ProductTypeAmounts 
                                   WHERE product_id = productId AND type_id = typeId 
                                   LIMIT 1);
        INSERT INTO DebugLogs (log_message) VALUES (CONCAT('Fetched product type amount ID: ', productTypeAmountId));
        
        IF productTypeAmountId IS NOT NULL THEN
            -- Insert into ProductTypeDistributionAmounts table
            INSERT IGNORE INTO ProductTypeDistributionAmounts (product_type_amount_id, product_type_distribution_id, amount)
            SELECT 
                productTypeAmountId,
                COALESCE(JSON_UNQUOTE(JSON_EXTRACT(td.value, '$.id')), 0),
                COALESCE(JSON_UNQUOTE(JSON_EXTRACT(td.value, '$.amount')), 0)
            FROM JSON_TABLE(
                JSON_EXTRACT(product, '$.types'),
                '$[*].distributions[*]' COLUMNS (
                    value JSON PATH '$'
                )
            ) AS td
            WHERE EXISTS (
                SELECT 1 
                FROM ProductTypeDistributions 
                WHERE id = COALESCE(JSON_UNQUOTE(JSON_EXTRACT(td.value, '$.id')), 0)
            );
            INSERT INTO DebugLogs (log_message) VALUES (CONCAT('Inserted product type distribution amounts for product type amount ID: ', productTypeAmountId));
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'product_type_amount_id is NULL';
        END IF;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;
