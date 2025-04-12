-- correções nos dados para queries
select m.idmecanico, em.idequipe from mecanico m
left join equipemecanico em on em.idmecanico=m.idmecanico;

update equipemecanico set idmecanico=2 where idmecanico=5;
update equipemecanico set idmecanico=3 where idmecanico in(11,10);


-- correção de valores

select * from OrdemServico where idOrdemServico=5;
update OrdemServico set valor=150 where idOrdemServico=5; -- default

update OrdemServico set valor=900 where idOrdemServico=1;
update OrdemServico set valor=1840 where idOrdemServico=2;
update OrdemServico set valor=705 where idOrdemServico=3;
update OrdemServico set valor=1200 where idOrdemServico=4;
update OrdemServico set valor=200 where idOrdemServico=6;
update OrdemServico set valor=150 where idOrdemServico=7;
update OrdemServico set valor=350 where idOrdemServico=8;
update OrdemServico set valor=280 where idOrdemServico=9;
update OrdemServico set valor=150 where idOrdemServico=10;




-- Veículo para o cliente com idCliente = 1
INSERT INTO Veiculo (idCliente, placa, cor, modelo, ano, marca)
VALUES (1, 'MEC1234', 'Preto', 'Civic', 2019, 'Honda');

-- Veículo para o cliente com idCliente = 2
INSERT INTO Veiculo (idCliente, placa, cor, modelo, ano, marca)
VALUES (2, 'MEC5678', 'Branco', 'Corolla', 2020, 'Toyota');

-- Veículo para o cliente com idCliente = 3
INSERT INTO Veiculo (idCliente, placa, cor, modelo, ano, marca)
VALUES (3, 'MEC4321', 'Vermelho', 'Onix', 2022, 'Chevrolet');

-- Segundo veículo para o cliente com idCliente = 1
INSERT INTO Veiculo (idCliente, placa, cor, modelo, ano, marca)
VALUES (1, 'MEC8765', 'Azul', 'Fit', 2018, 'Honda');

-- Veículo para o cliente com idCliente = 4
INSERT INTO Veiculo (idCliente, placa, cor, modelo, ano, marca)
VALUES (4, 'MEC2468', 'Cinza', 'HB20', 2021, 'Hyundai');



-- Inserindo 10 ordens de serviço com valores somando peças e serviços
-- Assumindo que já existam idVeiculo entre 1 e 10, idEquipe entre 1 e 5,
-- idServico entre 1 e 5, e idPeca entre 1 e 5

select * from PecaOrdemServico;

-- Ordem 1
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (1, 1, '2025-04-15 15:00:00', '2025-04-12 10:00:00', 280);
INSERT INTO ServicoOrdemServico VALUES (1, 11, 'Concluido'), (2, 11, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (1, 11, 3), (2, 11, 2);

-- Ordem 2
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (2, 2, '2025-04-16 14:00:00', '2025-04-12 11:00:00', 310);
INSERT INTO ServicoOrdemServico VALUES (3, 12, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (2, 12, 2), (3, 12, 1);

-- Ordem 3
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (3, 3, '2025-04-17 09:30:00', '2025-04-12 12:00:00', 180);
INSERT INTO ServicoOrdemServico VALUES (1, 13, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (4, 13, 1);

-- Ordem 4
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (4, 1, '2025-04-18 16:00:00', '2025-04-12 13:00:00', 320);
INSERT INTO ServicoOrdemServico VALUES (2, 14, 'Concluido'), (3, 14, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (3, 14, 2);

-- Ordem 5
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (5, 2, '2025-04-19 10:00:00', '2025-04-12 14:00:00', 280);
INSERT INTO ServicoOrdemServico VALUES (4, 15, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (1, 15, 2), (5, 15, 1);

-- Ordem 6
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (6, 3, '2025-04-20 11:00:00', '2025-04-12 15:00:00', 300);
INSERT INTO ServicoOrdemServico VALUES (1, 16, 'Concluido'), (5, 16, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (2, 16, 2);

-- Ordem 7
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (7, 4, '2025-04-21 12:00:00', '2025-04-12 16:00:00', 260);
INSERT INTO ServicoOrdemServico VALUES (3, 17, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (3, 17, 1), (4, 17, 1);

-- Ordem 8
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (8, 5, '2025-04-22 13:00:00', '2025-04-12 17:00:00', 180);
INSERT INTO ServicoOrdemServico VALUES (4, 18, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (2, 18, 1);

-- Ordem 9
INSERT INTO OrdemServico (idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (9, 1, '2025-04-23 14:00:00', '2025-04-12 18:00:00', 230);
INSERT INTO ServicoOrdemServico VALUES (5, 19, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (5, 19, 1), (1, 19, 1);


INSERT INTO Veiculo (idveiculo,modelo, marca, ano, placa, idCliente)
VALUES (10, 'Corolla', 'Toyota', 2020, 'GHI1J23', 3);

-- Ordem 10
INSERT INTO OrdemServico (idOrdemServico, idVeiculo, idEquipe, dataEntrega, dataEmissao, valor)
VALUES (20, 10, 2, '2025-04-24 15:00:00', '2025-04-12 19:00:00', 300);
INSERT INTO ServicoOrdemServico VALUES (2, 20, 'Concluido'), (4, 20, 'Concluido');
INSERT INTO PecaOrdemServico VALUES (3, 20, 1), (4, 20, 1);