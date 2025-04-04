use ecommerce;
show tables;

-- inserção dos dados
INSERT INTO Cliente (idCliente, Identificacao, Endereco) VALUES
(1, 'João Silva', 'Rua Dois, 123, Centro, SP'),
(2, 'Maria Santos', 'Av Brasil, 456, Copa, RJ'),
(3, 'Empresa Ltda.', 'Rodovia Pres Dutra, Km 100'),
(4, 'Pedro Oliveira', 'Rua Três, 789, Vila Madalena'),
(5, 'Ana Costa', 'Av Paulista, 901, Paraíso'),
(6, 'GreenTech Brasil', 'Rod Anhanguera, Km 50');

select * from cliente; 

SET SQL_SAFE_UPDATES = 1;

INSERT INTO Cliente_PF (idCliente_PF, Nome, CPF, Cliente_idCliente)VALUES
(1, 'João Silva', '123.456.789-00', 1),
(2, 'Maria Santos', '987.654.321-00', 2),
(3, 'Pedro Oliveira', '111.222.333-44', 4),
(4, 'Ana Costa', '444.555.666-77', 5);


INSERT INTO Cliente_PJ (idCliente_PJ, Nome, CNPJ, Cliente_idCliente) VALUES
(1, 'Empresa Ltda.', '12.345.678/0001-99', 3),
(2, 'GreenTech Brasil', '99.888.777/0001-99', 6);


INSERT INTO Entrega (idEntrega, Status, Codigo_de_Rastreio) VALUES
(1, 'Em Rota', 'BR123456789BR'),
(2, 'Entregue', 'BR987654321BR'),
(3, 'Aguardando Retirada', 'BR111222333BR'),
(4, 'Cancelado', 'BR444555666BR'),
(5, 'Em Transito', 'BR777888999BR');

INSERT INTO Estoque (idEstoque, Local)VALUES
(1, 'Armazém Principal, São Paulo'),
(2, 'Depósito Secundário, Rio de Janeiro'),
(3, 'Galpão de Estoque, Belo Horizonte');

INSERT INTO Pedido (idPedido, Endereco, Status, Cliente_idCliente, Frete, Cep)
VALUES
(1, 'Rua Dois, 123, Bairro Centro, São Paulo/SP', 'Em Rota', 1, 10.00, '01001-000'),
(2, 'Av Brasil, 456, Rio de Janeiro/RJ', 'Entregue', 2, 15.00, '20040-000'),
(3, 'Rodovia Pres Dutra', 'Aguardando Retirada', 3, 20.00, '30000-000'),
(4, 'Rua Três, 789, Vila Madalena', 'Em Rota', 4, 12.00, '80040-000'),
(5, 'Av Paulista, 901, Paraíso', 'Entregue', 5, 10.00, '01310-000'),
(6, 'Rod Anhanguera, Km 50', 'Aguardando Retirada', 6, 25.00, '13000-000');

UPDATE Pedido
SET Cliente_idCliente = '5'
WHERE idPedido = 3;

INSERT INTO Produto (idProduto, Categoria, Descricao)
VALUES
(1, 'Eletrônicos', 'Smartphone'),
(2, 'Moda', 'Camisa'),
(3, 'Alimentos', 'Café');

INSERT INTO Produto_no_Estoque (Produto_idProduto, Estoque_idEstoque, Quantidade)VALUES
(1, 1, 100), -- Produto 1 no Armazém Principal
(2, 1, 50),  -- Produto 2 no Armazém Principal
(1, 2, 200), -- Produto 1 no Depósito Secundário
(3, 3, 300); -- Produto 3 no Galpão de Estoque

select 

INSERT INTO Terceiro_Vendedor (idTerceiro_Vendedor, Razao_Social)
VALUES
(1, 'Vendedor Online Ltda.'),
(2, 'Marketplace Brasil'),
(3, 'Loja Virtual S.A.');

INSERT INTO Produto_no_Terceiro_Vendedor (Produto_idProduto, Terceiro_Vendedor_idTerceiro_Vendedor, Quantidade)
VALUES
(1, 1, 50), -- Produto 1 no Terceiro Vendedor 1
(2, 1, 30), -- Produto 2 no Terceiro Vendedor 1
(3, 2, 100), -- Produto 3 no Terceiro Vendedor 2
(1, 3, 20); -- Produto 1 no Terceiro Vendedor 3


INSERT INTO Fornecedor (idFornecedor, Identificacao, Endereco)
VALUES
(1, 'Fornecedor A Ltda.', 'Rua Principal, 123, São Paulo/SP'),
(2, 'Fornecedor B S.A.', 'Avenida Brasil, 456, Rio de Janeiro/RJ'),
(3, 'Fornecedor C Inc.', 'Rodovia Presidente Dutra,Belo Horizonte/MG');

INSERT INTO Fornecedor_Disponibiliza_Produto (Fornecedor_idFornecedor, Produto_idProduto)
VALUES
(1, 1), -- Fornecedor A disponibiliza o Produto 1
(1, 2), -- Fornecedor A disponibiliza o Produto 2
(2, 3), -- Fornecedor B disponibiliza o Produto 3
(3, 1), -- Fornecedor C disponibiliza o Produto 1
(3, 2); -- Fornecedor C disponibiliza o Produto 4

INSERT INTO Relacao_de_Produtos (Pedido_idPedido, Produto_idProduto, Quantidade)
VALUES
(1, 1, 2), -- 2 unidades do Produto 1 no Pedido 1
(1, 2, 1), -- 1 unidade do Produto 2 no Pedido 1
(2, 3, 3), -- 3 unidades do Produto 3 no Pedido 2
(3, 1, 1), -- 1 unidade do Produto 1 no Pedido 3
(3, 2, 2); -- 2 unidades do Produto 2 no Pedido 3

INSERT INTO Pagamento (idPagamento) VALUES
(1),
(2),
(3);

INSERT INTO Pedido_has_Pagamento (Pedido_idPedido, Pedido_Cliente_idCliente, Pagamento_idPagamento, Forma_de_Pagamento)
VALUES
(1, 1, 1, 'Cartão de Crédito'),   -- Pedido 1, Cliente 1, Pagamento 1
(1, 1, 2, 'Boleto Bancário'),    -- Pedido 1, Cliente 1, Pagamento 2
(2, 2, 3, 'PIX'),                -- Pedido 2, Cliente 2, Pagamento 3
(3, 3, 1, 'Cartão de Débito'),    -- Pedido 3, Cliente 3, Pagamento 1
(4, 4, 2, 'Transferência Bancária'); -- Pedido 4, Cliente 4, Pagamento 2

show tables;

-- consultas
-- Quantos pedidos foram feitos por cada cliente
select idCliente, c.identificacao, count(p.idPedido) as total
from Cliente c
left join Pedido p on c.idCliente = p.Cliente_idCliente
group by c.idCliente, c.identificacao
having count(idpedido) > 1;


-- relacao de produtos fornecedores e estoques
SELECT f.Identificacao AS Fornecedor,
    p.Categoria AS Categoria_Produto,
    e.Local AS Local_Estoque FROM Fornecedor f
JOIN
    Fornecedor_Disponibiliza_Produto fdp ON f.idFornecedor = fdp.Fornecedor_idFornecedor
JOIN
    Produto p ON fdp.Produto_idProduto = p.idProduto
JOIN
    Produto_no_Estoque pne ON p.idProduto = pne.Produto_idProduto
JOIN
    Estoque e ON pne.Estoque_idEstoque = e.idEstoque;
    
-- Relação de nomes dos fornecedores e nomes dos produtos;

SELECT f.Identificacao AS Nome_Fornecedor,
    p.Descricao AS Nome_Produto FROM Fornecedor f
JOIN
    Fornecedor_Disponibiliza_Produto fdp ON f.idFornecedor = fdp.Fornecedor_idFornecedor
JOIN
    Produto p ON fdp.Produto_idProduto = p.idProduto;

-- ver os status das entregas dos clientes
select distinct c.identificacao, e.Status, p.categoria from Cliente c, Entrega e, Produto p
where status = "Em rota";


