-- Create the Regulation list table
CREATE TABLE wcf1_unkso_regulation (
    regulationID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoryID INT(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description MEDIUMTEXT NOT NULL,
    identifier VARCHAR(20) NOT NULL,
    sortOrder INT(10) NOT NULL,
    isDisabled TINYINT(1) NOT NULL DEFAULT 0
);