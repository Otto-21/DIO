use ecommerce;

-- inserção de dados e queries

show tables;
desc clients;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (firstName, midInit, lastName, CPF, cAddress) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');
             


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (productName, classificationKids, category, rating, size) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedo','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimento','2',null),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null);

select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idClient, orderStatus, orderDescription, shippingValue, paymentCash) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idProduct, idOrder, quantity, productStatus) values
						 (1,1,2,default),
                         (2,3,1,default),
                         (3,2,1,'Sem estoque');
                         

-- storageLocation,quantity
insert into Storages (storageLocation) values 
							('Rio de Janeiro - RJ'),
                            ('Nilópolis - RJ'),
                            ('São Paulo - SP'),
                            ('Santo André - SP'),
                            ('Americana - SP'),
                            ('Campo Grande - MS');

-- idLproduct, idLstorage, location
insert into ProductStorages (idProduct, idStorage, quantity) values
						 (1,2,15),
                         (2,6,32);
                       

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (socialName, CNPJ, contact) values 
							('Almeida e filhos', '12345678912345','21985474'),
                            ('Eletrônicos Silva','85451964914345','21985484'),
                            ('Eletrônicos Valma', '93456789393469','21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idSupplier, idProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (socialName, abstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, '12345678945632', null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,'123456783','Rio de Janeiro', 219567895),
						('Kids World',null,'45678912365448',null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idSeller, idProduct, Quantity) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;

insert into orders (idClient, orderStatus, orderDescription, shippingValue, paymentCash) values 
							 (2, default,'compra via aplicativo',null,1);



/*
O código a seguir foi gerado via ChatGPT, envinado o modelo de banco de dado criado e pedindo para que ele gerasse
registros adequados com as definiçoes, restrições e configurações do banco, previamente definidas.
*/


-- Inserindo Clientes
INSERT INTO Clients (firstName, midInit, lastName, cpf, cAddress) VALUES
('João', 'A', 'Silva', '12345678901', 'Rua das Flores, 123 - São Paulo, SP'),
('Maria', 'B', 'Santos', '23456789012', 'Av. Paulista, 1000 - São Paulo, SP'),
('Carlos', 'C', 'Oliveira', '34567890123', 'Rua XV de Novembro, 200 - Curitiba, PR');

-- Inserindo Produtos
INSERT INTO Product (productName, classificationKids, category, rating, size) VALUES
('Smartphone XYZ', false, 'Eletrônico', 4.5, '15x7cm'),
('Camiseta Algodão', false, 'Vestimenta', 4.8, 'M'),
('Carrinho de Controle Remoto', true, 'Brinquedo', 4.2, '30x15cm'),
('Chocolate ao Leite', false, 'Alimento', 4.9, '500g'),
('Mesa de Madeira', false, 'Móveis', 4.3, '120x80cm');

-- Inserindo Pedidos
INSERT INTO Orders (idClient, orderStatus, orderDescription, shippingValue, paymentCash) VALUES
(1, 'Confirmado', 'Compra de um smartphone', 15.0, false),
(2, 'Enviado', 'Compra de roupas e brinquedos', 20.0, true),
(3, 'Em processamento', 'Compra de alimentos', 10.0, false);

-- Inserindo Fornecedores
INSERT INTO Supplier (cnpj, socialName, contact) VALUES
('11111111111111', 'Tech Imports LTDA', '11987654321'),
('22222222222222', 'Moda Brasil SA', '21987654321'),
('33333333333333', 'Brinquedos Divertidos ME', '31987654321');

-- Inserindo Vendedores
INSERT INTO Seller (cnpj, cpf, socialName, abstName, location, contact) VALUES
('44444444444444', NULL, 'Eletrônicos Top LTDA', 'E-Top', 'São Paulo, SP', '11999999999'),
(NULL, '567890123', 'Loja de Roupas Fashion', 'FashionWear', 'Rio de Janeiro, RJ', '21999999999'),
('55555555555555', NULL, 'Brinquedos e Games', 'B&G', 'Curitiba, PR', '41999999999');

-- Inserindo Armazéns
INSERT INTO Storages (storageLocation) VALUES
('Centro de Distribuição SP'),
('Centro de Distribuição RJ'),
('Centro de Distribuição PR');

-- Relacionando Produtos com Armazéns
INSERT INTO ProductStorages (idStorage, idProduct, quantity) VALUES
(1, 1, 50),
(1, 2, 200),
(2, 3, 100),
(3, 4, 500),
(3, 5, 30);

-- Relacionando Produtos com Vendedores
INSERT INTO ProductSeller (idSeller, idProduct, quantity) VALUES
(1, 1, 20),
(2, 2, 100),
(3, 3, 50);

-- Relacionando Produtos com Pedidos
INSERT INTO ProductOrder (idOrder, idProduct, quantity, productStatus) VALUES
(7, 1, 1, 'Disponível'),
(8, 2, 2, 'Disponível'),
(6, 3, 1, 'Disponível'),
(6, 4, 5, 'Disponível');

-- Relacionando Produtos com Fornecedores
INSERT INTO ProductSupplier (idSupplier, idProduct, quantity) VALUES
(5, 4, 100),
(2, 2, 500),
(6, 1, 200);
