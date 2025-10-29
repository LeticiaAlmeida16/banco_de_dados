-- 1. SELECIONAR COLUNAS ESPECÍFICAS
SELECT 
    nome, 
    telefone 
FROM 
    CCliente;

-- 2. SELECIONAR TODAS AS COLUNAS
SELECT 
    * FROM 
    PProduto;

-- 3. FILTRAR LINHAS (Cláusula WHERE)
SELECT 
    * FROM 
    CCliente
WHERE 
    nome LIKE 'Maria%'; 

-- 4. CLASSIFICAR LINHAS (Cláusula ORDER BY)
SELECT 
    * FROM 
    CCliente
WHERE 
    nome LIKE 'Maria%'
ORDER BY 
    nome DESC;

-- 5. AGRUPAR LINHAS (Cláusula GROUP BY)
SELECT 
    idCategoria, 
    COUNT(*) AS QtdProdutos
FROM 
    PProduto
GROUP BY 
    idCategoria
ORDER BY 
    QtdProdutos DESC;

-- 6. FILTRAR GRUPOS (Cláusula HAVING)
SELECT 
    idCategoria, 
    COUNT(*) AS QtdProdutos
FROM 
    PProduto
GROUP BY 
    idCategoria
HAVING 
    COUNT(*) > 2
ORDER BY 
    idCategoria;

-- 1. ORDENAR POR UMA COLUNA (Ordem Crescente - Padrão)
SELECT 
    nome, 
    preco 
FROM 
    PProduto
ORDER BY 
    preco; 

-- 2. ORDENAR POR UMA COLUNA (Ordem Decrescente)
SELECT 
    nome, 
    preco 
FROM 
    PProduto
ORDER BY 
    preco DESC;

-- 3. ORDENAR POR MÚLTIPLAS COLUNAS
SELECT 
    idVenda, 
    qntdade, 
    subtotal 
FROM 
    VVendaItem
ORDER BY 
    idVenda, 
    subtotal DESC;

-- 5. ORDENAR POR COLUNA FORA DA LISTA DE SELEÇÃO
SELECT 
    idProduto, 
    nome 
FROM 
    PProduto
ORDER BY 
    idCategoria; 

-- 2. OFFSET E FETCH (PAGINAÇÃO - PULAR E PEGAR)
SELECT 
    nome, 
    preco
FROM 
    PProduto
ORDER BY 
    preco 
OFFSET 5 ROWS      
FETCH NEXT 5 ROWS ONLY;

-- 3. OFFSET E FETCH (TOP N - PEGAR OS PRIMEIROS)
SELECT 
    nome, 
    preco
FROM 
    PProduto
ORDER BY 
    preco DESC
OFFSET 0 ROWS              
FETCH FIRST 5 ROWS ONLY; 

-- 3B. TOP N (Fixo)
SELECT TOP 5
    nome, 
    preco
FROM
    PProduto
ORDER BY 
    preco DESC;

-- 3B. TOP N com Empates (WITH TIES)
SELECT TOP 3 WITH TIES
    nome, 
    preco
FROM
    PProduto
ORDER BY 
    preco DESC; 

-- 4A. 1. SELECIONAR VALORES DISTINTOS EM UMA COLUNA
SELECT 
    DISTINCT nome 
FROM 
    CCategoria
ORDER BY 
    nome;

-- 4B. 1. WHERE com Igualdade
SELECT 
    nome, 
    preco 
FROM 
    PProduto
WHERE 
    idCategoria = 1;

-- 4B. 2. WHERE com AND
SELECT 
    nome, 
    preco 
FROM 
    PProduto
WHERE 
    idCategoria = 1 AND preco > 150.00;

-- 4B. 4. WHERE com OR
SELECT 
    nome, 
    preco 
FROM 
    PProduto
WHERE 
    preco < 10.00 OR preco < 1000.00;

-- 4B. 5. WHERE com BETWEEN (Numérico)
SELECT 
    nome, 
    preco 
FROM 
    PProduto
WHERE 
    preco BETWEEN 49.99 AND 99.99;

-- 4B. 6. WHERE com IN
SELECT 
    nome, 
    preco 
FROM 
    PProduto
WHERE 
    preco IN (29.00, 45.90, 19.99); 


-- 4B. 7. WHERE com LIKE
SELECT 
    nome, 
    preco 
FROM 
    PProduto
WHERE 
    nome LIKE 'M%';

-- 4F. 3. BETWEEN COM DATAS
SELECT
    idVenda,
    valorTotal,
    idCliente
FROM
    VVenda
WHERE
    valorTotal BETWEEN 100.00 AND 1000.00
ORDER BY
    valorTotal;

-- 4H. 1. ALIAS DE COLUNA PARA EXPRESSÃO (Com 'AS')
SELECT
    nome AS nome_completo,
    telefone
FROM
    CCliente
ORDER BY
    nome_completo;

-- 1. INNER JOIN (Retorna SÓ as correspondências)
SELECT 
    v.idVenda, 
    c.nome AS NomeCliente 
FROM 
    VVenda v 
INNER JOIN 
    CCliente c 
    ON c.idCliente = v.idCliente; 

-- 2. LEFT JOIN (TUDO da Esquerda + Correspondências)
SELECT 
    p.nome AS Produto, 
    cat.nome AS Categoria 
FROM 
    PProduto p 
LEFT JOIN 
    CCategoria cat 
    ON cat.idCategoria = p.idCategoria;

-- 3. LEFT JOIN (Apenas o que SÓ está na Esquerda)
SELECT 
    p.nome
FROM 
    PProduto p
LEFT JOIN 
    CCategoria cat 
    ON cat.idCategoria = p.idCategoria
WHERE 
    cat.idCategoria IS NULL; 


-- Agregação: Soma
SELECT 
    idVenda, 
    SUM(qntdade * precoUnitario) AS ValorTotalItens 
FROM 
    VVendaItem 
GROUP BY 
    idVenda;

-- 6B. 2. Agrupamento com HAVING
SELECT
    idProduto,
    SUM(subtotal) AS ReceitaProduto
FROM
    VVendaItem
GROUP BY
    idProduto
HAVING
    SUM(subtotal) > 500
ORDER BY
    ReceitaProduto DESC;

-- 7A. I. Subconsulta na Cláusula WHERE (Com IN)
SELECT
    *
FROM
    VVenda
WHERE
    idCliente IN (
        SELECT
            idCliente
        FROM
            CCliente
        WHERE
            nome LIKE 'Maria%'
    );

-- 7A. II. Subconsulta Correlacionada (Como Expressão na Lista SELECT)
SELECT
    v.idVenda,
    v.dataVenda,
    (
        SELECT
            MAX(subtotal)
        FROM
            VVendaItem vi
        WHERE
            vi.idVenda = v.idVenda 
    ) AS MaiorSubtotalItem
FROM
    VVenda v
ORDER BY
    v.dataVenda DESC;

-- 7A. IV. Subconsulta com EXISTS (Verificação de Existência)
SELECT
    idCliente,
    nome
FROM
    CCliente c
WHERE
    EXISTS (
        SELECT
            idVenda
        FROM
            VVenda v
        WHERE
            v.idCliente = c.idCliente
    )
ORDER BY
    nome;

-- 7B. Subconsulta Correlacionada para MAX por Grupo (Produto mais caro por Categoria)
SELECT
    nome,
    preco,
    idCategoria
FROM
    PProduto p1
WHERE
    preco IN (
        SELECT
            MAX(p2.preco)
        FROM
            PProduto p2
        WHERE
            p2.idCategoria = p1.idCategoria 
    )
ORDER BY
    idCategoria;

-- 7C. EXISTS com HAVING (Clientes com mais de 5 vendas)
SELECT
    idCliente,
    nome
FROM
    CCliente c
WHERE
    EXISTS (
        SELECT
            COUNT(*) 
        FROM
            VVenda v
        WHERE
            idCliente = c.idCliente
        GROUP BY
            idCliente
        HAVING
            COUNT(*) > 5
    );