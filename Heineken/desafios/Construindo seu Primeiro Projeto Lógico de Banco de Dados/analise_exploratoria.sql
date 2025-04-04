use ecommerce;
/*
- Recuperações simples com SELECT Statement
- Filtros com WHERE Statement
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos – HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
*/

-- quais os clientes, seus nomes completos e seus cpfs?
select 	idClient, 
		concat(firstname,' ',midinit,'. ', lastname) as Nome, 
		cpf  
from 	clients;


-- quais os pedidos com status em processamento?
select * from orders where orderStatus='Em processamento';


-- quais produtos foram comprados no pedido 2?
select po.idOrder,p.idProduct,productName,category from productorder po 
join product p on p.idproduct=po.idproduct
where idOrder=2;


-- quais produtos sao destinados ao publico infantil e possuem a dimensao epsecificada?
select 	* 
from 	product 
where 	classificationkids=1
		and size is not null;


-- qual a média de frete por tipo de pedido?
select		orderDescription, 
			round(avg(COALESCE(shippingValue,0)),2) as media_frete 
from 		orders 
group by 	orderDescription 
order by 	media_frete desc;


-- quantos vendedores existem por localidade que possuem 2 ou mais vendedores nela?
select 		location, 
			count(1) as no_vendedores 
from 		seller 
group by 	location 
having 		count(1)>1;


-- quantos produtos de cada categoria há nos estoques como um todo?
select p.category, sum(ps.quantity) as estoque_total 
from productStorages ps
join product p on p.idproduct=ps.idproduct
group by p.category;


-- quais as informações principais dos vendedores de produtos eletronicos?
select	s.socialName,
		case when cpf is null then 'cnpj' else 'cpf' end as documento,
		case when cpf is null then cnpj else cpf end as numero,
		p.productName,
		quantity
from 	productseller ps
inner join product p on p.idproduct=ps.idproduct
inner join seller s on s.idseller=ps.idseller
where 	p.category='Eletrônico';


-- quais vendedores, localização e contato que vendem mais de um produto?
select s.socialname, s.location, s.contact
from productseller ps
inner join product p on p.idproduct=ps.idproduct
inner join seller s on s.idseller=ps.idseller
group by ps.idSeller
having count(1)>1;


-- quais fornecedores têm "LTDA" no nome social?
select * from supplier
where socialname like '%LTDA';


-- liste os nomes dos clientes que compraram produtos da categoria 'Brinquedo', juntamente com o nome do produto e o status do pedido.
select 
	concat(firstname,' ',midinit,'. ', lastname) as Nome,  
    p.productname,
    o.idorder as pedido,
    o.orderstatus
from clients c
inner join orders o on o.idclient=c.idclient
inner join productorder po on po.idorder=o.idorder
inner join product p on p.idproduct=po.idproduct
where p.category='Brinquedo'
order by c.idclient;


-- quais são os 3 produtos com maior quantidade total em estoque (somando em todos os armazéns)?
select 
	p.idproduct, 
    p.productName, 
    sum(ps.quantity) as quantidade
from productStorages ps
inner join product p on p.idproduct=ps.idproduct
group by ps.idproduct
order by quantidade desc
limit 3;