-- Clientes
insert into Cliente (nome, sobrenome, cpf, endereco, contato) values
('Lucas', 'Silva', '12345678901', 'Rua das Flores, 123', '11999998888'),
('Mariana', 'Oliveira', '23456789012', 'Av. Brasil, 456', '11988887777'),
('João', 'Pereira', '34567890123', 'Rua A, 789', '11977776666'),
('Ana', 'Souza', '45678901234', 'Rua B, 321', '11966665555'),
('Carlos', 'Ferreira', '56789012345', 'Rua C, 654', '11955554444'),
('Juliana', 'Costa', '67890123456', 'Rua D, 987', '11944443333');

-- Veículos
insert into Veiculo (idCliente, placa, cor, modelo, ano, marca) values
(1, 'ABC1234', 'Preto', 'Civic', 2020, 'Honda'),
(2, 'DEF5678', 'Branco', 'Corolla', 2019, 'Toyota'),
(3, 'GHI9012', 'Azul', 'Gol', 2018, 'Volkswagen'),
(4, 'JKL3456', 'Prata', 'Fiesta', 2017, 'Ford'),
(5, 'MNO7890', 'Vermelho', 'Onix', 2021, 'Chevrolet'),
(6, 'PQR1234', 'Cinza', 'HB20', 2022, 'Hyundai');

-- Mecanicos
insert into Mecanico (nome, sobrenome, documento, especialidade, endereco) values
('Carlos', 'Moraes', '000001', 'Motor', 'Rua Alpha, 10'),
('Fernando', 'Silva', '000002', 'Freio', 'Rua Beta, 20'),
('Bruno', 'Santos', '000003', 'Suspensão', 'Rua Gama, 30'),
('Rafael', 'Costa', '000004', 'Elétrica', 'Rua Delta, 40'),
('Diego', 'Souza', '000005', 'Motor', 'Rua Epsilon, 50'),
('Renato', 'Alves', '000006', 'Câmbio', 'Rua Zeta, 60'),
('Paulo', 'Lima', '000007', 'Pintura', 'Rua Eta, 70'),
('Vinicius', 'Martins', '000008', 'Lataria', 'Rua Theta, 80');

-- Equipes
insert into Equipe (statusEquipe) values
('Livre'), ('Ocupada'), ('Em espera');

-- EquipeMecanico (associação)
insert into EquipeMecanico (idEquipe, idMecanico, dataEntrada) values
(1, 1, '2024-01-01'),
(1, 2, '2024-01-01'),
(2, 3, '2024-02-01'),
(2, 4, '2024-02-01'),
(2, 5, '2024-02-01'),
(3, 6, '2024-03-01'),
(3, 7, '2024-03-01'),
(3, 8, '2024-03-01');

-- Peças
insert into Peca (valor, descricao, dimensoes) values
(150, 'Pastilha de freio', '10x5x3cm'),
(200, 'Amortecedor dianteiro', '50x10x10cm'),
(80, 'Filtro de óleo', '12x8x8cm'),
(120, 'Filtro de ar', '20x20x5cm'),
(300, 'Bateria 60Ah', '30x20x20cm'),
(75, 'Lâmpada farol', '5x5x5cm'),
(180, 'Disco de freio', '25x25x3cm'),
(220, 'Bomba de combustível', '20x15x15cm'),
(90, 'Velas de ignição', '15x3x3cm'),
(350, 'Radiador', '60x40x10cm'),
(60, 'Correia dentada', '30x3x1cm'),
(50, 'Sensor de ABS', '5x2x2cm'),
(400, 'Embreagem', '35x35x5cm'),
(500, 'Câmbio automático', '80x60x40cm'),
(100, 'Reservatório de água', '25x20x20cm');

-- Serviços
insert into Servico (valorMaoDeObra, descricao) values
(200, 'Troca de óleo e filtros'),
(350, 'Revisão completa'),
(500, 'Troca de embreagem'),
(150, 'Alinhamento e balanceamento');

-- Ordem de Serviço
insert into OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, statusOS, valor) values
(1, 1, '2024-05-10 17:00:00', '2024-05-08 08:30:00', 'Encerrada (paga)', 430),
(2, 2, '2024-05-15 16:00:00', '2024-05-12 09:00:00', 'Atendida (pagamento pendente)', 500),
(3, 3, null, '2024-05-20 10:00:00', 'Em atendimento', 150),
(4, 1, null, '2024-05-21 14:00:00', 'Gerada', 150);

-- PecaOrdemServico
insert into PecaOrdemServico (idPeca, idOrdemServico, quantidade) values
(1, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 2, 1),
(9, 2, 1),
(13, 2, 1),
(2, 3, 1),
(6, 3, 2),
(10, 4, 1);

-- ServicoOrdemServico
insert into ServicoOrdemServico (idServico, idOrdemServico, statusServicoOS) values
(1, 1, 'Concluido'),
(2, 1, 'Concluido'),
(3, 2, 'Concluido'),
(4, 3, 'Em andamento'),
(1, 4, 'Pendente');
