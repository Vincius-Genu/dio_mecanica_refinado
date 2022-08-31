-- Pessoas que são clientes tem um carro hatchback
SELECT CONCAT (Fname, ' ', Lname) AS 'Client Name', email, brand, model
FROM person
		INNER JOIN clients ON idPerson = idCperson
        INNER JOIN vehicle ON idVehicle = idClient
WHERE carType = 'Hatchback';

-- Endereço dos mecanicos que trabalharam na ordem de serviço que foram aprovados
SELECT CONCAT (Fname, ' ', Lname) AS 'Mechanic Name',
	   CONCAT(street, ', ', homeNumber, ' - ', state) AS 'Mechanic Adress'
FROM person
		INNER JOIN mechanic ON idPerson = idMperson
        INNER JOIN mechanic_work_team ON idMechanic = idMWTmechanic
        INNER JOIN work_team ON idMWTteam = idWorkTeam
        INNER JOIN service_orders ON idOSworkTeam = idWorkTeam
WHERE statusOS = 'Aprovado';

-- Quantas cidades distintas ja passou pela mecanica de clientes
SELECT city, count(*) AS 'Number of clients'
FROM person
		INNER JOIN clients ON idPerson = idCperson
        GROUP BY city
        ORDER BY city DESC;
        
-- Qual o número da ordem de serviço que foi utilizado um para colocar fiação e sua quantidade 
SELECT numOS, statusOS, quantity, itemDescription
FROM service_orders
		INNER JOIN service_orders_service ON idSOSservOrders = idServOrders
        INNER JOIN service ON idSOSservice = idService
        INNER JOIN service_item ON idService = idSIservice
        INNER JOIN item ON idItem = idSIitem
        WHERE itemDescription LIKE '%fiação%';
        




        


