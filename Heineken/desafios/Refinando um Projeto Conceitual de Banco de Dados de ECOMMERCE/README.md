# Contexto
Desafio 'Refinando um Projeto Conceitual de Banco de Dados – E-COMMERCE' do módulo de curso 'Inteligência Artificial Aplicada a Dados com Copilot', do bootcamp oferecido pela Heineken, através da plataforma DIO.

Enunciado:

```
Objetivo:
  Refine o modelo apresentado acrescentando os seguintes pontos:
 - Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
 - Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
 - Entrega – Possui status e código de rastreio;
```

> _PS: Não era necessário ater-se aos tipos dos campos, apenas ao relacionamento das tabelas entre si e seus atributos._

# Desafio

Para a resolução, era necessário, inicialmente, replicar o esquema de banco de dados apresentado em vídeo, como feito nessa [imagem](https://github.com/Otto-21/DIO/blob/main/Heineken/desafios/Refinando%20um%20Projeto%20Conceitual%20de%20Banco%20de%20Dados%20de%20ECOMMERCE/bd%20ecommerce.png).

A partir disso, lapidei o modelo, adicionando as funcionalidades listadas em 'Objetivo', após o processo de análise crítica e reflexão pois todos as propostas tinham mais de uma solução possível.

[Resolução](https://github.com/Otto-21/DIO/blob/main/Heineken/desafios/Refinando%20um%20Projeto%20Conceitual%20de%20Banco%20de%20Dados%20de%20ECOMMERCE/bd%20ecommerce%20final.png)

## Primeiro tópico
Neste caso, era possível adicionar colunas CPF e CNPJ à tabela Clientes, adicionando restrições para que ambas não estejam preenchidas ao mesmo tempo, contudo, isso acarretaria no desperdício de uma coluna, todas as vezes. 
> Esta provavelmente é a implementação adequada num cenário escalonado, onde preza-se mais a consulta em detrimento do armazenamento. 

A partir dessa reflexão, cheguei à conclusão de que a melhor implementação possível seria criar uma tabela 'Documento', que registra o CPF ou o CNPJ do cliente, numa relação 1:1, registrando o tipo e o valor do documento, além do id do cliente para relacionar com a respectiva tabela.

>( * ) " UM PARA UM (1:1): cada entidade do conjunto de entidades A está associada a no máximo uma entidade do conjunto de entidades B, e cada entidade em B está associada a no máximo uma entidade em A."
>

## Segundo tópico
Para cadastrar mais de uma forma de pagamento por cliente, a implementação que mais se adequa ao contexto é a criação da tabela FormaPagamento, relacionada à Cliente, na cardinalidade 1:N.

Assim, o cliente pode cadastrar mais de uma forma pagamento, salvando o número do cartão, tipo (crédito ou débito), nome do titular, endereço de cobrança e data de validade, associados pelo id do cliente.

>( * ) UM PARA MUITOS (1:N): uma entidade em A está associada a diversas entidades em B, mas cada entidade em B está associada a no máximo a uma entidade de A.

## Terceiro tópico
Para a implementação de 'Entregas' duas soluções mostram-se possíveis: a adição dos campos status e código de rastreio à tabela 'Pedido' ou criar uma tabela específica para isso e associá-la aos pedidos, numa relação 1:N.

A solução adotada foi a segunda, por conta de sua maior escalabilidade e flexibilidade, permitindo o registro do histórico do status e futura expansão para armazenar mais informações.

# Conclusão
O desafio traz uma proposta interessante, que exige um tempo maior dedicado para a reinterpretação do contexto e reflexão sobre as possíveis alternativas e qual a mais adequada no caso. Mas recompensa o esforço ao ver o projeto pronto.

>( * ) ([BANCOS DE DADOS RELACIONAIS](https://www.fatecsp.br/dti/tcc/tcc0025.pdf) - página 27, tópico 6.5.1 - Elisângela Rocha da Costa, FATEC - São Paulo, acessado em 25/03/2025)
