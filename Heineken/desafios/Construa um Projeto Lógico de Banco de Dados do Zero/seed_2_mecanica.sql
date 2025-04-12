insert into Peca (valor, descricao, dimensoes) values
(120.00, 'Pastilha de Freio Dianteira', '15x10x5'),
(250.50, 'Amortecedor Traseiro', '40x10x10'),
(85.75, 'Filtro de Ar', '20x15x5'),
(320.00, 'Bateria 60Ah', '30x20x18'),
(199.99, 'Correia Dentada', '100x2x1');

insert into Servico (valorMaoDeObra, descricao) values
(200.00, 'Troca de Pastilha de Freio'),
(350.00, 'Substituição de Amortecedores'),
(150.00, 'Troca de Filtro de Ar'),
(500.00, 'Substituição de Bateria'),
(300.00, 'Troca de Correia Dentada');

insert into OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, statusOS, valor) values
(1, 1, '2025-04-15 15:00:00', '2025-04-12 10:00:00', 'Em atendimento', 320.00),
(2, 2, '2025-04-20 17:00:00', '2025-04-11 14:30:00', 'Gerada', 600.00),
(3, 3, null, '2025-04-10 09:00:00', 'Em espera', 450.00);

insert into PecaOrdemServico (idPeca, idOrdemServico, quantidade) values
(1, 4, 1),
(2, 2, 2),
(3, 3, 1);

insert into ServicoOrdemServico (idServico, idOrdemServico, statusServicoOS) values
(1, 3, 'Em andamento'),
(2, 2, 'Pendente'),
(3, 4, 'Pendente');

insert into Mecanico (nome, sobrenome, documento, especialidade, endereco) values
('Eduardo', 'Campos', '000009', 'Arrefecimento', 'Rua Iota, 90'),
('Marcelo', 'Barbosa', '000010', 'Direção', 'Rua Kappa, 100'),
('André', 'Vieira', '000011', 'Motor', 'Rua Lambda, 110'),
('Tiago', 'Souza', '000012', 'Freio', 'Rua Mu, 120');

insert into Equipe (statusEquipe) values
('Livre'), ('Inativa');

insert into EquipeMecanico (idEquipe, idMecanico, dataEntrada) values
(4, 9, '2024-04-01'),
(4, 10, '2024-04-01'),
(5, 11, '2024-04-10'),
(5, 12, '2024-04-10');

insert into Peca (valor, descricao, dimensoes) values
(120.50, 'Pastilha de freio dianteira', '10x5x2'),
(250.00, 'Bateria 60Ah', '25x17x19'),
(89.90, 'Filtro de óleo', '7x7x10'),
(300.00, 'Amortecedor dianteiro', '45x8x8'),
(15.00, 'Lâmpada farol H7', '3x3x6');

insert into Servico (valorMaoDeObra, descricao) values
(180, 'Troca de óleo e filtro'),
(250, 'Substituição de pastilhas de freio'),
(350, 'Alinhamento e balanceamento'),
(400, 'Revisão elétrica completa');

insert into Cliente (nome, sobrenome, cpf, endereco, contato) values
('Felipe', 'Nascimento', '78901234567', 'Rua Sigma, 321', '11933332222'),
('Larissa', 'Mendes', '89012345678', 'Av. Delta, 456', '11922221111'),
('Roberta', 'Almeida', '90123456789', 'Rua Ômega, 789', '11911110000');

insert into Veiculo (idCliente, placa, cor, modelo, ano, marca) values
(7, 'STU4567', 'Verde', 'Sandero', 2016, 'Renault'),
(8, 'VWX8901', 'Preto', 'Kwid', 2020, 'Renault'),
(9, 'YZA2345', 'Branco', 'Cruze', 2019, 'Chevrolet');

insert into OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, statusOS, valor) values
(7, 1, '2025-04-01 16:00:00', '2025-03-30 09:00:00', 'Encerrada (paga)', 430),
(8, 2, null, '2025-04-10 10:30:00', 'Em atendimento', 250),
(9, 4, '2025-04-12 14:00:00', '2025-04-11 15:00:00', 'Atendida (pagamento pendente)', 500);

insert into PecaOrdemServico (idPeca, idOrdemServico, quantidade) values
(1, 10, 1), -- Pastilha de freio
(3, 9, 1), -- Filtro de óleo
(2, 9, 1); -- Bateria


insert into ServicoOrdemServico (idServico, idOrdemServico, statusServicoOS) values
(2, 8, 'Concluido'), -- Substituição de pastilha
(1, 6, 'Em andamento'), -- Troca de óleo
(4, 7, 'Pendente'); -- Revisão elétrica
