create database if not exists atividade_mecanico;
use atividade_mecanico;

create table if not exists Mecanico(
	idMecanico int auto_increment primary key,
    nome varchar(30) not null,
    sobrenome varchar(100),
    documento varchar(20) unique not null,
    especialidade varchar(20),
    endereco varchar(80)
);

create table if not exists Equipe(
	idEquipe int auto_increment primary key,
	statusEquipe enum('Ocupada', 'Livre', 'Inativa', 'Em espera') default 'Livre'
);

create table if not exists Peca(
	idPeca int auto_increment primary key,
    valor float not null default 10,
    descricao varchar(50) not null,
    dimensoes varchar(20)
);

create table if not exists Servico(
	idServico int auto_increment primary key,
    valorMaoDeObra float not null default 150,
    descricao varchar(100) not null
);

create table if not exists Cliente(
	idCliente int auto_increment primary key,
    nome varchar(30) not null,
    sobrenome varchar(100),
    cpf varchar(11) unique not null,
    endereco varchar(80),
    contato varchar(20)
);

create table if not exists Veiculo(
	idVeiculo int auto_increment primary key,
    idCliente int,
    placa varchar(8) not null unique,
    cor varchar(20) default 'Prata',
    modelo varchar(30) not null,
    ano int not null,
    marca varchar(40),
    constraint fk_veiculo_idcliente foreign key(idCliente) references Cliente(idCliente)
);

create table if not exists OrdemServico(
	idOrdemServico int auto_increment primary key,
    idVeiculo int,
    idEquipe int,
    dataEntrega datetime,
    dataEmissao datetime not null,
    statusOS enum('Gerada','Em espera','Em atendimento','Atendida (pagamento pendente)','Encerrada (paga)','Cancelada') default 'Gerada',
    valor float not null default 150,
    constraint fk_ordemservico_idveiculo foreign key(idVeiculo) references Veiculo(idVeiculo),
    constraint fk_ordemservico_idequipe foreign key(idEquipe) references Equipe(idEquipe)
);

-- relacionamentos
create table if not exists EquipeMecanico(
	idEquipe int,
    idMecanico int,
    dataEntrada date not null,
    dataSaida date,
    constraint fk_equipemecanico_idequipe foreign key(idEquipe) references Equipe(idEquipe),
	constraint fk_equipemecanico_idmecanico foreign key(idMecanico) references Mecanico(idMecanico),
    primary key (idEquipe, idMecanico)
);

create table if not exists PecaOrdemServico(
	idPeca int,
    idOrdemServico int,
    quantidade int not null default 1,
    constraint fk_peca_os_idpeca foreign key(idPeca) references Peca(idPeca),
    constraint fk_peca_os_idordemservico foreign key(idOrdemServico) references OrdemServico(idOrdemServico),
    primary key (idPeca, idOrdemServico)
);

create table if not exists ServicoOrdemServico(
	idServico int,
    idOrdemServico int,
    statusServicoOS enum('Pendente', 'Em andamento', 'Concluido') default 'Pendente',
    constraint fk_servico_os_idservico foreign key(idServico) references Servico(idServico),
    constraint fk_servico_os_idordemservico foreign key(idOrdemServico) references OrdemServico(idOrdemServico),
    primary key (idServico, idOrdemServico)
);