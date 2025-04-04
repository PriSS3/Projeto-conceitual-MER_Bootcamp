create database ecommerce;
use ecommerce;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Identificacao VARCHAR(45),
    Endereco VARCHAR(45)
);

CREATE TABLE Cliente_PF (
    idCliente_PF INT PRIMARY KEY,
    Nome VARCHAR(45),
    CPF VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Cliente_PJ (
    idCliente_PJ INT PRIMARY KEY,
    Nome VARCHAR(45),
    CNPJ VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Endereco VARCHAR(45),
    Status VARCHAR(45),
    Cliente_idCliente INT,
    Frete FLOAT,
    Cep VARCHAR(45),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Relacao_de_Produtos (
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade VARCHAR(45),
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    Status VARCHAR(45),
    Codigo_de_Rastreio VARCHAR(45)
);

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    Identificacao VARCHAR(45),
    Endereco VARCHAR(45)
);

CREATE TABLE Fornecedor_Disponibiliza_Produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    Local VARCHAR(45)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45)
);

CREATE TABLE Produto_no_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

CREATE TABLE Terceiro_Vendedor (
    idTerceiro_Vendedor INT PRIMARY KEY,
    Razao_Social VARCHAR(45)
);

CREATE TABLE Produto_no_Terceiro_Vendedor (
    Produto_idProduto INT,
    Terceiro_Vendedor_idTerceiro_Vendedor INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Terceiro_Vendedor_idTerceiro_Vendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Terceiro_Vendedor_idTerceiro_Vendedor) REFERENCES Terceiro_Vendedor(idTerceiro_Vendedor)
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY
);

CREATE TABLE Pedido_has_Pagamento (
    Pedido_idPedido INT,
    Pedido_Cliente_idCliente INT,
    Pagamento_idPagamento INT,
     Forma_de_Pagamento VARCHAR(45),
    PRIMARY KEY (Pedido_idPedido, Pedido_Cliente_idCliente, Pagamento_idPagamento),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento),
    FOREIGN KEY (Pedido_Cliente_idCliente) REFERENCES Cliente(idCliente)
);



