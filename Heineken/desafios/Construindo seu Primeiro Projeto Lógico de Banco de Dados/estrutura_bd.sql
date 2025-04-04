-- criacao do banco de dados para ecommerce
-- drop database if exists ecommerce;
create database if not exists ecommerce;
use ecommerce;

create table if not exists Clients(
	idClient int auto_increment primary key,
    firstName varchar(15),
    midInit varchar(3),
    lastName varchar(25),
    cpf char(11) not null,
    cAddress varchar(255),
    constraint unique_cpf_client unique(cpf)
);
alter table Clients auto_increment=1;

-- size = dimensoes do produto
create table if not exists Product(
	idProduct int auto_increment primary key,
    productName varchar(50) not null,
    classificationKids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedo', 'Alimento', 'Móveis'),
    rating float default 0,
    size varchar(10)
);
alter table Product auto_increment=1;
desc Product;

create table if not exists Orders(
	idOrder int auto_increment primary key,
    idClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento', 'Enviado', 'Entregue') not null default 'Em processamento',
    orderDescription varchar(255),
    shippingValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idClient) references Clients(idClient)
);
alter table Orders auto_increment=1;
desc Orders;

create table if not exists Supplier(
	idSupplier int auto_increment primary key,
    cnpj char(14) not null,
    socialName varchar(50) not null,
    contact char(15) not null,
    constraint unique_supplier_cnpj unique (cnpj),
    constraint unique_supplier_socialName unique (socialName)
);
alter table Supplier auto_increment=1;
desc Supplier;

create table if not exists Seller(
	idSeller int auto_increment primary key,
    cnpj char(14),
    cpf char(9),
    socialName varchar(50) not null,
    abstName varchar(50),
    location varchar(255),
    contact char(15) not null,
    constraint unique_seller_cnpj unique (cnpj),
    constraint unique_seller_cpf unique (cpf),
    constraint unique_seller_socialName unique (socialName)
);
alter table Seller auto_increment=1;
desc Seller;

create table if not exists Storages(
	idStorage int auto_increment primary key,
    storageLocation varchar(100) not null
);
alter table Storages auto_increment=1;
desc Storages;

-- relacionamentos

create table if not exists ProductStorages(
	idStorage int,
    idProduct int,
    quantity int not null default 0,
    primary key(idStorage, idProduct),
    constraint fk_productstorage_idproduct foreign key (idProduct) references Product(idProduct),
    constraint fk_productstorage_idstorage foreign key (idStorage) references Storages(idStorage)
);

create table if not exists ProductSeller(
	idSeller int,
    idProduct int,
	quantity int not null default 1,
    primary key(idProduct, idSeller),
    constraint fk_productseller_idseller foreign key(idSeller) references Seller(idSeller),
	constraint fk_productseller_idproduct foreign key(idProduct) references Product(idProduct)
);

create table if not exists ProductOrder(
	idOrder int,
    idProduct int,
    quantity int not null default 1,
    productStatus enum('Disponível', 'Sem estoque') default 'Disponível' not null, 
    primary key(idProduct, idOrder),
    constraint fk_productorder_idorder foreign key(idOrder) references Orders(idOrder),
	constraint fk_productorder_idproduct foreign key(idProduct) references Product(idProduct)
);

create table productSupplier(
	idSupplier int,
    idProduct int,
    quantity int not null,
    primary key (idSupplier, idProduct),
    constraint fk_product_supplier_supplier foreign key (idSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idProduct) references product(idProduct)
);

show databases;
use information_schema;
show tables;
desc table_constraints;
select * from table_constraints where TABLE_SCHEMA='ecommerce';
use ecommerce;
/*
-- parte do desafio
create table if not exists Payment(
	idPayment int auto_increment,
    idClient int,
    typePayment enum('Credit', 'Debit', 'Cash'),
    limitAvailable float,
    transcation varchar(50),
    primary key(idClient, idPayment),
    constraint fk_payment_client foreign key (idClient) references Clients(idClient)
);
*/