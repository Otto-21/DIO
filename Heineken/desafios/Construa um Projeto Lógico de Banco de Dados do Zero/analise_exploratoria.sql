show databases;
use atividade_mecanico;
show tables;


-- qual o nome completo e cpf de todos clientes?
select 
	concat(nome, ' ', sobrenome) as nome_completo,
	cpf
from cliente;


-- qual a descricao e placa de todos os carros?
select 
	concat(marca, ' ', modelo, ' - ', cor) as descricao,
	placa
from Veiculo;


-- qual o nome e especialidade de cada um dos mecanicos?
select 
	concat(nome, ' ', sobrenome) as nome_completo,
	especialidade
from Mecanico;


-- quais os carros de cada cliente? em ordem alfabetica inversa
select 
	concat(c.nome, ' ', c.sobrenome) as nome_completo,
    v.modelo
from Cliente c
inner join Veiculo v
	on v.idCliente = c.idCliente
order by nome_completo desc;


-- quais os nomes de todos os mecanicos em equipes que estão livres?
select 
	concat(m.nome, ' ', m.sobrenome) as nome_completo
from Equipe e
inner join EquipeMecanico em
	on em.idEquipe = e.idEquipe
inner join Mecanico m 
	on m.idMecanico = em.idMecanico
where statusEquipe='Livre';


-- quantas ordem de servico já foram atendidas? (atendida/encerrada)
select 
	count(1) as quantidade
from OrdemServico
where statusOS like 'Encerrada%'
or statusOS like 'Atendida%';


-- quais as ordens de servico e data de emissao, que possuem peças (e quantas) e nao foram pagas ainda?
select 
	distinct os.idOrdemServico,
    os.dataEmissao,
    count(1) as pecas_compradas
from OrdemServico os
inner join PecaOrdemServico pos
	on pos.idOrdemServico = os.idOrdemServico
inner join Peca p
	on pos.idPeca = p.idPeca
where os.statusOS not like 'Encerrada%'
group by os.idOrdemServico;


-- quais os mecanicos que estão sem equipe?
select 
	'Sem equipe' as status,
    concat(m.nome,' ',m.sobrenome) as nome_completo
 from Mecanico m 
left join EquipeMecanico em
	on em.idMecanico = m.idMecanico
where em.idEquipe is null;


-- qual a somatória dos valores das pecas, dos servicos e valor total de cada Ordem de Servico?
with valores as(
	select 
		os.idOrdemServico as id,
		coalesce(sum(distinct p.valor*pos.quantidade), 0) as valor_pecas,
		coalesce(sum(distinct s.valorMaoDeObra), 0) as valor_servicos,
        os.valor as valorOS
	from OrdemServico os
	left join ServicoOrdemServico sos
		on sos.idOrdemServico = os.idOrdemServico
	left join Servico s
		on s.idServico = sos.idServico
	left join PecaOrdemServico pos
		on pos.idOrdemServico = os.idOrdemServico
	left join Peca p 
		on p.idPeca = pos.idPeca
	group by os.idOrdemServico
)
select
	id as ordem_de_servico,
    valor_pecas,
    valor_servicos,
    concat('Valor Total: ',
		case when (valor_pecas+valor_servicos) = 0 then concat(valorOS, ' (valor base)')
		else valor_pecas+valor_servicos end) as Resumo
from valores;


-- quais os clientes com mais de um carro?
select 
	c.idCliente, 
    count(1) as qtd_carros
from Cliente c
inner join Veiculo v on v.idCliente = c.idCliente
group by idCliente
having count(1)>1;

-- quais equipes realizaram mais de 3 ordens de serviço?
select 
	e.idEquipe, 
    count(1) as servicos_prestados
from Equipe e
inner join OrdemServico os 
	on	os.idEquipe = e.idEquipe
group by os.idEquipe
having count(1)>=3