# Contexto
Desafio 'Construindo seu Primeiro Projeto Lógico de Banco de Dados' do módulo de curso 'Inteligência Artificial Aplicada a Dados com Copilot', do bootcamp oferecido pela Heineken, através da plataforma DIO.

# Enunciado:

```
Replique a modelagem do projeto lógico de banco de dados para o cenário de e-commerce. Fique atento as definições
de chave primária e estrangeira, assim como as constraints presentes no cenário modelado. Perceba que dentro desta
modelagem haverá relacionamentos presentes no modelo EER. Sendo assim, consulte como proceder para estes casos. Além
disso, aplique o mapeamento de modelos aos refinamentos propostos no módulo de modelagem conceitual.


Assim como demonstrado durante o desafio, realize a criação do Script SQL para criação do esquema do banco de dados.
Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas
dos que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:


- Recuperações simples com SELECT Statement
- Filtros com WHERE Statement
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos – HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

Diretrizes
- Não há um mínimo de queries a serem realizadas;
- Os tópicos supracitados devem estar presentes nas queries;
- Elabore perguntas que podem ser respondidas pelas consultas;
- As cláusulas podem estar presentes em mais de uma query;
```

# Resolução:
A [modelagem](https://github.com/Otto-21/DIO/blob/main/Heineken/desafios/Construindo%20seu%20Primeiro%20Projeto%20L%C3%B3gico%20de%20Banco%20de%20Dados/estrutura_bd.sql) foi replicada, com pequenas alterações, principalmente no nome dos atributos e [populada](https://github.com/Otto-21/DIO/blob/main/Heineken/desafios/Construindo%20seu%20Primeiro%20Projeto%20L%C3%B3gico%20de%20Banco%20de%20Dados/populando_bd.sql), posteriormente, com código fornecido no exercício e criados utilizando a ferramenta ChatGPT.

A partir dessa base, comecei a me questionar quais informações poderiam ser recuperadas, quais perguntas poderiam ser feitas e respondidas a partir do SQL, anotei-as e, com um objetivo bem traçado, criei as queries necessárias, dispoínveis no [arquivo](https://github.com/Otto-21/DIO/blob/main/Heineken/desafios/Construindo%20seu%20Primeiro%20Projeto%20L%C3%B3gico%20de%20Banco%20de%20Dados/analise_exploratoria.sql).

# Considerações:
Desafio muito interessante, envolvendo a criação de queries SQL, uma das minhas partes favoritas relacionadas a banco de dados, com objetivo de estimular a criatividade e aplicação do conhecimento adquirido ao longo do curso, ao mostrar-se necessária a criação de perguntas a serem respondidas, para então criar os meios de respondê-las, através das queries.
