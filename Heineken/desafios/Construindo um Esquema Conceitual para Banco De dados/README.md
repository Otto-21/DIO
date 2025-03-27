# Contexto
Desafio 'Construindo um Esquema Conceitual para Banco De dados' do módulo de curso 'Inteligência Artificial Aplicada a Dados com Copilot', do bootcamp oferecido pela Heineken, através da plataforma DIO.

# Enunciado:

```
Objetivo:
Criar o esquema conceitual para o contexto de oficina com base na narrativa fornecida.

Narrativa:
0 - Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
1 - Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas
2 - Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
3 - A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
4 - O valor de cada peça também irá compor a OS.
5 - O cliente autoriza a execução dos serviços.
6 - A mesma equipe avalia e executa os serviços.
7 - Os mecânicos possuem código, nome, endereço e especialidade.
8 - Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
9 - Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS.
10 - Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.
```

# Resolução:

1 - Este primeiro tópico garante a existência das entidades Veículo e Cliente, relacionadas entre si, em 1:N. Além disso, adicionei atributos comuns para pessoas (nome, endereco, contato e cpf) e veiculos (placa, cor, modelo, marca, ano).
> Um cliente pode ter 1 ou vários veículos e um veículo precisa ser possuído por um cliente (entidade fraca).


2 - Já este, nos garante a existência das entidades Ordem de Serviço e Mecanico e, por conta da forma de implementação que eu adotei, a entidade 'Equipe' também é garantida, que se relaciona de forma N:M com Mecanico, isto é, uma equipe pode possuir um ou mais mecanicos e um mecanico pode fazer parte de uma ou mais equipes, e 1:N com Ordem de Serviço (OS), ou seja, uma equipe está relacionada a uma ou mais OS's e uma OS está relacionada a apenas uma equipe.


3 - Cria-se a entidade Serviço, que possui valor e descrição como atributos e que posteriormente será relacionada com OS.


4 - Cria-se a entidade Peça, que possui valor e descrição como atributos e que posteriormente será relacionada com OS.


5 - Para implementação dessa regra optei pela adição do atributo 'status' na entidade OS, que pode ser um enum ou um simples varchar com a etapa do processo por extenso.
> O tipo enum é uma estrutura de dados do tipo dicionário com todos os únicos possíveis valores de uma coluna. Por exemplo, uma coluna armazenando os dias da semana pode ser um enum que contém todos os dias possíveis. (tradução livre, fonte: [documentação DuckDB](https://duckdb.org/docs/stable/sql/data_types/enum.html))

> Nesse caso, seria uma tabela com os possíveis status de uma Ordem de Serviço, por exemplo: criada, aguardando autorização, autorizada, em atendimento, concluída, cancelada.


6, 7 e 8 - Conferem características e atributos às entidades já existentes. 


9 - Garante o relacionamento N:M entre OS e Serviço, mostrando que um serviço realizado não é particular à ordem de serviço que está relacionada.


10 - Garante o relacionamento N:M entre OS e Peça, mostrando que uma peça utilizada numa ordem de serviço não é particular a ela.

A partir dos tópicos e após ponderar todos os pontos levantados anteriormente, foi possível chegar à seguinte resolução:

