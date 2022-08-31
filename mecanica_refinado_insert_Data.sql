-- TABELA PESSOAS
INSERT INTO person(Fname, Minit, Lname, street, homeNumber, district, city, state, zipCode)
		VALUES('Aline', 'H.', 'Gomes', 'Rua Domingos Olímpio', 304, 'Centro', 'Sobral', 'CE', 62011140),
			  ('Pedro', 'F.', 'Silva', 'Rua Carlos Augusto Cornelsen', 15, 'Bom Retiro', 'Curitiba', 'PR', 80520560),
              ('João', 'P.', 'Lemos', 'Rua Paracatu', 403, 'Parque Imperial', 'São Paulo', 'SP', 04302021),
              ('Gustavo', 'H.', 'Barbosa', 'Rua Serra de Bragança', 222, 'Vila Gomes Cardim', 'São Paulo', 'SP', 03318000),
              ('Barbara', 'B.', 'Lemos', 'Rua das Fiandeiras', 27, 'Vila Olímpia', 'São Paulo', 'SP', 04545005),
              ('Rui', 'T.', 'Miller', 'Rua Praça da República', 930, 'República', 'São Paulo', 'SP', 01045001),
              ('Rosana', 'P.', 'Couto', 'Rua Pereira Estéfano', 1206, 'Vila da Saúde', 'São Paulo', 'SP', 04144070);
SELECT * FROM person;

-- TABELA CLIENTE
INSERT INTO clients(phone, email, idCperson)
		VALUES('92339-7287', 'aline.gomes04@gmail.com', 1),
			  ('93181-7201', 'pedro_04francisco@gmail.com', 2),
              ('92311-5481', 'rui_miller155@gmail.com', 6);
SELECT * FROM clients;

-- TABELA MECÂNICO
INSERT INTO mechanic(specialty, idMperson)
		VALUES('Inspetor de Qualidade', 3),
			  ('Ajustador Mecânico', 4),
              ('Técnico em Eletromecânica', 5),
              ('Ajustador Mecânico', 7);
SELECT * FROM mechanic;

-- TABELA VEÍCULOS
INSERT INTO vehicle(model, brand, carType, buildDate, color, carPlate, RENAVAM, carDescription, idVclient)
		VALUES('Bravo ABSOLUTE Dualogic 1.8 Flex 16V 5p', 'Fiat', 'Hatchback', '2011-02-16', 'Bege', 'KHI-8516', 123456789, 'Vidro traseiro trincado', 1),
			  ('XJS-C 6.0 V12', 'Jaguar', 'Coupe', '1994-08-28', 'Cinza', 'JNV-3796', 856321479, NULL, 2),
              ('DS3 Sport Chic 1.6 TB 16V 3p Mec.', 'Citroen', 'Hatchback', '2015-09-09', 'Preto', 'CST-3630', 336598874, 'Um amassado na porta direita', 3);
SELECT * FROM vehicle;

-- TABELA EQUIPE
INSERT INTO work_team(teamCode, teamName)
		VALUES(15698, 'Reparação'),
			  (65897, 'Elétrica'),
              (47856, 'Motor'),
              (46663, 'Pintura'),
              (77884, 'Qualidade');
SELECT * FROM work_team;

-- TABELA ORDEM DE SERVIÇO
INSERT INTO service_orders(numOS, price, issueDate, deadline, statusOS, idOSworkTeam)
		VALUES(1234567, 987, '2022-08-02', '2022-09-15', 'Aprovado', 3),
			  (4569871, 2500, '2022-08-15', '2022-09-05', 'Reprovado',5),
              (4578961, 784, '2022-08-27', '2022-09-19', DEFAULT, 2);
SELECT * FROM service_orders;

-- TABELA SERVIÇO 
INSERT INTO service(serviceType, servDescription)
		VALUES('Motor/Elétrica', 'Foi necessario fazer a reparação do cooler do carro e trocar a parte elétrica');
SELECT * FROM service;

-- TABELA PEÇA
INSERT INTO item(quantity, itemDescription)
		VALUES(6, 'Foram compradas bileas para a troca dos filtros'),
			  (1, 'Cooler para a troca'),
              (3, '3 pacostes de fiação com um tamanho de 1 metro cada');
SELECT * FROM item;

-- TABELA EQUIPE QUE TRABALHA NO VEICULO
INSERT INTO work_team_vehicle(idWTVvehicle, idWTVteam, workHours)
		VALUES(2, 3, 55);
        
-- TABELA MECÂNICOS QUE FAZEM PARTE DE UMA EQUIPE
INSERT INTO mechanic_work_team(idMWTmechanic, idMWTteam)
		VALUES(1, 5),
			  (2, 3),
              (3, 2),
              (4, 3);
SELECT * FROM mechanic_work_team;

-- TABELA ORDEM DE SERVIÇO QUE GERA UM SERVIÇO
INSERT INTO service_orders_service (idSOSservOrders, idSOSservice)
		VALUES(1, 1);
SELECT * FROM service_orders_service;

-- TABELA PEÇAS DEMANDADAS PRO SERVIÇO
INSERT INTO service_item(idSIservice, idSIitem)
		VALUES(1, 1),
			  (1, 2),
              (1, 3);
SELECT * FROM service_item;