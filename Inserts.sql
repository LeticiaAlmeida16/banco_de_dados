INSERT INTO CCliente (nome, telefone) VALUES ('Carlos Mendes', '61988776655');
INSERT INTO CCliente (nome, telefone) VALUES ('Sofia Santos', '71955443322');
INSERT INTO CCliente (nome, telefone) VALUES ('Mariana Costa', '81922110099');
INSERT INTO CCliente (nome, telefone) VALUES ('Ricardo Neves', '91933445566');
INSERT INTO CCliente (nome, telefone) VALUES ('Luiza Ferreira', '01911223344');

INSERT INTO PProduto (idCategoria, nome, preco) VALUES (5, 'Café Gourmet 500g', 29.00);
INSERT INTO PProduto (idCategoria, nome, preco) VALUES (1, 'Mouse Gamer', 150.00);
INSERT INTO PProduto (idCategoria, nome, preco) VALUES (4, 'Calça Jeans Premium', 199.90);
INSERT INTO PProduto (idCategoria, nome, preco) VALUES (2, 'E-book de Culinária', 19.99);
INSERT INTO PProduto (idCategoria, nome, preco) VALUES (3, 'Mesa de Jantar 6 Lugares', 2100.00);

-- Os IDs abaixo (6 a 10) são referências. Se o banco gerou IDs diferentes, estas linhas falharão.
INSERT INTO VVenda (idCliente, dataVenda) VALUES (6, '2025-10-28');
INSERT INTO VVenda (idCliente, dataVenda) VALUES (7, '2025-10-28');
INSERT INTO VVenda (idCliente, dataVenda) VALUES (8, '2025-10-29');
INSERT INTO VVenda (idCliente, dataVenda) VALUES (9, '2025-10-29');
INSERT INTO VVenda (idCliente, dataVenda) VALUES (10, '2025-10-30');

-- Os IDs abaixo (tanto idVenda quanto idProduto) são referências. Se o banco gerou IDs diferentes, estas linhas falharão.
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (6, 6, 3, 29.00, 87.00);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (7, 7, 1, 150.00, 150.00);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (8, 8, 1, 199.90, 199.90);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (9, 9, 5, 19.99, 99.95);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (10, 10, 1, 2100.00, 2100.00);

INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (1, 7, 2, 150.00, 300.00);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (3, 8, 1, 199.90, 199.90);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (4, 9, 1, 19.99, 19.99);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (5, 6, 1, 29.00, 29.00);
INSERT INTO VVendaItem (idVenda, idProduto, qntdade, precoUnitario, subtotal) VALUES (8, 1, 1, 1200.00, 1200.00);