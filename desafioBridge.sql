-- Criação do esquema “pedidos”
CREATE SCHEMA pedidos;
SET search_path = pedidos;

-- Deletar tabela caso já exista
DROP TABLE IF EXISTS clientes CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS itens_pedido CASCADE;

-- Criação das tabelas
CREATE TABLE categorias (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  preco NUMERIC(10, 2) NOT NULL,
  categoria_id INTEGER REFERENCES categorias(id)
);

CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);

CREATE TABLE pedidos (
  id SERIAL PRIMARY KEY,
  data DATE NOT NULL,
  endereco_entrega TEXT NOT NULL,
  cliente_id INTEGER REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
  id SERIAL PRIMARY KEY,
  quantidade INTEGER NOT NULL,
  preco NUMERIC(10, 2) NOT NULL,
  pedido_id INTEGER REFERENCES pedidos(id),
  produto_id INTEGER REFERENCES produtos(id)
);


-- Inserção de dados n
-- Definir quantidade de inserções
DO $$
DECLARE
    num_categorias INTEGER := 50;
    num_produtos INTEGER := 50;
    num_clientes INTEGER := 50;
    num_pedidos INTEGER := 50;
    num_itens_pedido INTEGER := 50;
BEGIN
    -- Inserir categorias
    FOR i IN 1..num_categorias LOOP
   	 INSERT INTO categorias (nome)
   	 VALUES ('Categoria ' || i);
    END LOOP;

    -- Inserir produtos
    FOR i IN 1..num_produtos LOOP
   	 INSERT INTO produtos (nome, descricao, preco, categoria_id)
   	 VALUES ('Produto ' || i, 'Descrição do Produto ' || i, i * 10, i % num_categorias + 1);
    END LOOP;

    -- Inserir clientes
    FOR i IN 1..num_clientes LOOP
   	 INSERT INTO clientes (nome, email)
   	 VALUES ('Cliente ' || i, 'cliente' || i || '@exemplo.com');
    END LOOP;

    -- Inserir pedidos
    FOR i IN 1..num_pedidos LOOP
   	 INSERT INTO pedidos (data, endereco_entrega, cliente_id)
   	 VALUES (CURRENT_DATE, 'Endereço de entrega do Pedido ' || i, i % num_clientes + 1);
    END LOOP;

    -- Inserir itens de pedido
    FOR i IN 1..num_itens_pedido LOOP
   	 INSERT INTO itens_pedido (quantidade, preco, pedido_id, produto_id)
   	 VALUES (i % 5 + 1, i * 10, i % num_pedidos + 1, i % num_produtos + 1);
    END LOOP;
END;
$$;


 -- criação de index para nome de produto e nome de cliente
CREATE INDEX idx_produtos_nome ON produtos(nome);
CREATE INDEX idx_clientes_nome ON clientes(nome);


 --  Listar todos os produtos com nome, descrição e preço em ordem alfabética crescente;
SELECT nome, descricao, preco from produtos ORDER BY nome ASC;


--  Listar todas as categorias com nome e número de produtos associados, em ordem alfabética crescente;
SELECT c.nome, count(p.id)
FROM categorias c
LEFT JOIN produtos p
ON c.id = p.categoria_id
GROUP BY c.nome
ORDER BY c.nome ASC


--  Listar todos os pedidos com data, endereço de entrega e total do pedido (soma dos preços dos itens), em ordem decrescente de data; 
SELECT p.data, p.endereco_entrega, SUM (i.quantidade * i.preco) AS total
FROM pedidos p
INNER JOIN itens_pedido i
ON p.id = i.pedido_id
GROUP BY p.id
ORDER BY data DESC


--  Listar todos os produtos que já foram vendidos em pelo menos um pedido, com nome, descrição, preço e quantidade total vendida, em ordem decrescente de quantidade total vendida;
SELECT p.nome, p.descricao, p.preco, SUM(i.quantidade) AS soma
FROM produtos p
INNER JOIN itens_pedido i
ON p.id = i.produto_id
GROUP BY p.id
HAVING SUM(i.quantidade) > 0
ORDER BY soma DESC


--  Listar todos os pedidos feitos por um determinado cliente, filtrando-os por um determinado período, em ordem alfabética crescente do nome do cliente e ordem crescente da data do pedido;
SELECT c.nome, p.id, p.data, p.endereco_entrega
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id
WHERE c.nome = 'Cliente 1' AND p.data BETWEEN '2023-03-24' AND '2023-03-26'
ORDER BY c.nome ASC, p.data ASC


-- Listar possíveis produtos com nome replicado e a quantidade de replicações, em ordem decrescente de quantidade de replicações
SELECT nome, COUNT(produtos.id) as replicacoes
FROM produtos
GROUP BY produtos.nome
ORDER BY replicacoes DESC

