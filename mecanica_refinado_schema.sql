CREATE DATABASE mecanica_refinada;
USE mecanica_refinada;
-- DROP DATABASE mecanica_refinada;

-- TABELA PESSOAS
CREATE TABLE person(
		idPerson INT AUTO_INCREMENT PRIMARY KEY,
        Fname VARCHAR(25) NOT NULL,
        Minit CHAR(2),
        Lname VARCHAR(25) NOT NULL,
        street VARCHAR(45) NOT NULL,
        homeNumber SMALLINT NOT NULL,
        district VARCHAR(45) NOT NULL,
        city VARCHAR(15) NOT NULL,
        state CHAR(2) NOT NULL,
        zipCode CHAR(8) NOT NULL
);

-- TABELA CLIENTE
CREATE TABLE clients(
		idClient INT AUTO_INCREMENT PRIMARY KEY,
        phone CHAR(10) NOT NULL UNIQUE,
        email VARCHAR(30) UNIQUE,
        idCperson INT,
        CONSTRAINT unique_clients_phone UNIQUE(phone),
        CONSTRAINT unique_clients_email UNIQUE(email),
        CONSTRAINT fk_person_clients FOREIGN KEY (idCperson) REFERENCES person(idPerson)        
);

-- TABELA MECÂNICO
CREATE TABLE mechanic(
		idMechanic INT AUTO_INCREMENT PRIMARY KEY,
        specialty  VARCHAR(50) NOT NULL,
        idMperson INT,
        CONSTRAINT fk_person_mechanic FOREIGN KEY (idMperson) REFERENCES person(idPerson)
);

-- TABELA VEÍCULOS
CREATE TABLE vehicle(
		idVehicle INT AUTO_INCREMENT PRIMARY KEY,
        model VARCHAR(255) NOT NULL,
        brand VARCHAR(30) NOT NULL,
        carType VARCHAR(15) NOT NULL,
        buildDate DATE NOT NULL,
        color VARCHAR(25) NOT NULL,
        carPlate CHAR(8) NOT NULL,
        RENAVAM CHAR(9) NOT NULL UNIQUE,
        carDescription VARCHAR(255),
        idVclient INT,        
        CONSTRAINT unique_vehicle_renavam UNIQUE(RENAVAM),
        CONSTRAINT fk_clients_vehicle FOREIGN KEY (idVclient) REFERENCES clients(idClient)
);

-- TABELA EQUIPE
CREATE TABLE work_team(
		idWorkTeam INT AUTO_INCREMENT PRIMARY KEY,
        teamCode CHAR(5) NOT NULL UNIQUE,
		teamName VARCHAR(20) NOT NULL,        
        CONSTRAINT unique_work_team_code UNIQUE(teamCode)
);

-- TABELA ORDEM DE SERVIÇO
CREATE TABLE service_orders(
		idServOrders INT AUTO_INCREMENT PRIMARY KEY,
        numOS CHAR(7) NOT NULL UNIQUE,
        price INT NOT NULL,
        issueDate DATE NOT NULL,
        deadline DATE,
        statusOS ENUM('Aprovado', 'Reprovado', 'Em Análise') DEFAULT 'Em Análise',
        idOSworkTeam INT,
        CONSTRAINT unique_os_numos UNIQUE(numOS),
        CONSTRAINT fk_work_team_os FOREIGN KEY(idOSworkTeam) REFERENCES work_team(idWorkTeam)        
);

-- TABELA SERVIÇO 
CREATE TABLE service(
		idService INT AUTO_INCREMENT PRIMARY KEY,
        serviceType VARCHAR(30) NOT NULL,
        servDescription VARCHAR(255)
);

-- TABELA PEÇA
CREATE TABLE item(
		idItem INT AUTO_INCREMENT PRIMARY KEY,
        quantity TINYINT,
        itemDescription VARCHAR(255)
);

-- TABELA EQUIPE QUE TRABALHA NO VEICULO
CREATE TABLE work_team_vehicle(
		idWTVvehicle INT,
        idWTVteam INT,
        workHours SMALLINT,
        PRIMARY KEY(idWTVvehicle, idWTVteam),
        CONSTRAINT fk_wtv_vehicle FOREIGN KEY (idWTVvehicle) REFERENCES vehicle(idVehicle),
        CONSTRAINT fk_wtv_work_team FOREIGN KEY (idWTVteam) REFERENCES work_team(idWorkTeam)
);

-- TABELA MECÂNICOS QUE FAZEM PARTE DE UMA EQUIPE
CREATE TABLE mechanic_work_team(
		idMWTmechanic INT,
        idMWTteam INT,
        PRIMARY KEY (idMWTmechanic, idMWTteam),
        CONSTRAINT fk_mwt_mechanic FOREIGN KEY (idMWTmechanic) REFERENCES mechanic(idMechanic),
        CONSTRAINT fk_mwt_team FOREIGN KEY (idMWTteam) REFERENCES work_team(idWorkTeam)
);

-- TABELA ORDEM DE SERVIÇO QUE GERA UM SERVIÇO
CREATE TABLE service_orders_service(
		idSOSservOrders INT,
        idSOSservice INT,
        PRIMARY KEY (idSOSservOrders, idSOSservice),
        CONSTRAINT fk_sos_service_orders FOREIGN KEY (idSOSservOrders) REFERENCES service_orders(idServOrders),
        CONSTRAINT fk_sos_service FOREIGN KEY (idSOSservice) REFERENCES service(idService)
);

-- TABELA PEÇAS DEMANDADAS PRO SERVIÇO 
CREATE TABLE service_item(
		idSIservice INT,
        idSIitem INT,
        PRIMARY KEY (idSIservice, idSIitem),
        CONSTRAINT fk_si_service FOREIGN KEY (idSIservice) REFERENCES service(idService),
        CONSTRAINT fk_si_item FOREIGN KEY (idSIitem) REFERENCES item(idItem)
);