-- ## SELECIONE TODOS OS CLIENTES COM EMAIL CADASTRADOS
--SELECT *
--FROM clientes
--WHERE flEmail = '1';


-- ## TODAS AS TRANSAÇÕES DE 50 PONTOS;
--SELECT *
  --  FROM transacoes
    --WHERE qtdePontos = 50;


-- ## TODOS OS CLIENTES COM MAIS DE 500 PONTOS;
--SELECT idCliente, qtdePontos
--FROM clientes
--WHERE qtdePontos > 500;


-- ## SELECIONE PRODUTOS QUE APRESENTAM 'churn'NO NOME;
--SELECT *
--FROM produtos
--WHERE DescNomeProduto LIKE '%Churn%';


-- ## CRIAR COLUNA ATRAVÉS DE UMA COLUNA;
--PRAGMA table_info(clientes); -- Verificar tipo das colunas
--SELECT  qtdePontos,
  --      DtCriacao,
  --      qtdePontos * 2 as qtPontosDobrado,
  --      datetime(DtCriacao) as DtCriacaoNova_1,
  --      substr(DtCriacao, 1, 19) as DtCriacaoNova_2,
  --      CASE strftime('%w', substr(DtCriacao, 1, 19))
  --        WHEN '0' THEN 'Domingo'
  --        WHEN '1' THEN 'Segunda-feira'
  --        WHEN '2' THEN 'Terça-feira'
  --        WHEN '3' THEN 'Quarta-feira'
  --        WHEN '4' THEN 'Quinta-feira'
  --        WHEN '5' THEN 'Sexta-feira'
  --        WHEN '6' THEN 'Sábado'
  --      END as DiaSemana
--FROM clientes
--LIMIT 10;


-- ## LISTA DE TRANSAÇÕES COM APENAS 1 PONTO;
--SELECT *
--FROM transacoes
--WHERE qtdePontos = 1; 


-- ## LISTA DE TRANSAÇÕES NO FINAL DE SEMANA:
--SELECT  IdTransacao,
  --      DtCriacao,
    --    strftime('%w', substr(DtCriacao, 1, 10)) as DiaSemana
--FROM transacoes
--WHERE DiaSemana IN ('0', '6');


-- ## LISTA DE CLIENTES COM 0 PONTOS:
--SELECT  *
--FROM clientes
--WHERE qtdePontos = 0;


-- ## LISTA DE CLIENTES COM 100 A 200 PONTOS (INCLUSIVE AMBOS):
--SELECT  IdCliente,
  --      QtdePontos
--FROM clientes
--WHERE QtdePontos BETWEEN 100 AND 200;


-- ## LISTA DE PRODUTOS COM NOMEQUE COMEÇA COM "Venda de":
--SELECT  IdProduto,
   --     DescNomeProduto
--FROM produtos
--WHERE DescNomeProduto  LIKE 'Venda de%';


-- ## LISTA DE PRODUTOS COM O NOME QUE TERMINA COM "lover":
--SELECT *    
--FROM produtos
--WHERE DescNomeProduto LIKE '%lover';


-- ## LISTA DE PRODUTOS QUE SÃO CHAPÉUS:
--SELECT *
--FROM produtos
--WHERE DescCategoriaProduto IN ('chapeu');


-- ## LISTA DE TRANSAÇÕES COM PRODUTO 'Resgatar Ponei';
--SELECT *
--FROM transacao_produto
--WHERE IdProduto = '15';


-- ## LISTA DE CLIENTES COM MAIOR QUANTIDADE DE PONTOS:
--SELECT *
--FROM clientes
--ORDER BY qtdePontos DESC
--LIMIT 10;


-- ## LISTA DOS CLIENTES MAIS ANTIGOS, COM MAIS PONTOS E COM TWITCH:
--SELECT  *
--FROM clientes
--WHERE flTwitch  = 1
--ORDER BY DtCriacao, qtdePontos DESC


-- ## CATEGORIZANDO CLIENTES:
--SELECT  IdCliente,
 --       qtdePontos,
 --       CASE
 --         WHEN qtdePontos <= 500 THEN 'PONEI'
 --         WHEN qtdePontos <= 1000 THEN 'PONEI PREMIUM'
 --         WHEN qtdePontos <= 5000 THEN 'MAGO APRENDIZ'
 --         WHEN qtdePontos <= 10000 THEN 'MAGO EXPERIENTE'
 --         ELSE 'MAGO SUPREMO'
 --       END as cdCategoria
--FROM clientes
--ORDER BY qtdePontos DESC


-- ## LISTAR TODAS AS TRANSAÇÕES ADICIONANDO UMA NOVA COLUNA SINALIZANDO "alto", 
--"médio", "baixo" para o valor dos pontos [<10; <500, >=500]:
-- SELECT  
--  IdTransacao,
--  qtdePontos,
--  CASE
--    WHEN qtdePontos <10 THEN 'baixo'
--    WHEN qtdePontos <500 THEN 'médio'
--    ELSE 'alto'
--  END as cdPontos
--FROM transacoes;


-- ## QUANTIDADE DE TRANSAÇÕES EM JULHO DO ULTIMO ANO:
--SELECT  
  --COUNT(*) as qtdeTransacoes
--FROM transacoes
--WHERE substr(DtCriacao, 1,7) BETWEEN '2025-07' AND '2025-07'  
--ORDER BY DtCriacao;


-- ## TABELA RESUMO:
--SELECT
 --COUNT(DISTINCT(IdCliente))  as qtdeClientes,
  --SUM(
    --CASE 
      --WHEN QtdePontos > 0 THEN qtdePontos
    --END) AS QtPontosPositivos,

    --SUM(
      --CASE 
        --WHEN QtdePontos < 0 THEN QtdePontos
      --END) AS QtPontosNegativos,

    --ROUND(AVG(
     -- CASE 
       -- WHEN QtdePontos > 0 THEN QtdePontos
      --END), 2) AS MediaPontosPositivos,

    --ROUND(AVG(  
      --CASE
        --WHEN QtdePontos < 0 THEN QtdePontos
      --END), 2) AS MediaPontosNegativos
      
--FROM  transacoes
--WHERE substr(DtCriacao, 1,7) BETWEEN '2025-07' AND '2025-07'


-- ## SOMAR A QUANTIDADE DE PONTOS POR CLIENTES NO MES DE JULHO:

-- SELECT
--   IdCliente as id_cliente,
--   DATE(DtCriacao) as dt_dia,
--   SUM(qtdePontos) as qtPontosClientes,
--   count(IdTransacao) as qtTransacoesClientes
-- FROM transacoes
-- WHERE dt_dia BETWEEN '2025-07-01' AND '2025-07-31' 
-- GROUP BY id_cliente, dt_dia
-- ORDER BY qtPontosClientes DESC;


-- ## LISTA DOS 10 CLIENTES QUE TIVERAM MAIS DE 400 PONTOS EM JUNHO:
-- SELECT
--   IdCliente AS id_cliente,
--   DATE(DtCriacao) AS dt_dia,
--   SUM(QtdePontos) AS qtPontosClientes,
--   COUNT(IdTransacao) AS qtTransacoesClientes
-- FROM transacoes
-- WHERE dt_dia BETWEEN '2025-06-01' AND '2025-06-30'
-- GROUP BY id_cliente, dt_dia
-- HAVING qtPontosClientes > 400
-- ORDER BY qtPontosClientes DESC
-- LIMIT 10;


-- ## LISTA DOS CLIENTES, POR MÊS, QUE TIVERAM MAIS DE 400 PONTOS:
-- SELECT
--   IdCliente AS id_cliente,
--   STRFTIME('%Y-%m', DATE(DtCriacao)) AS dt_ym,
--   SUM(QtdePontos) AS qtPontosClientes,
--   COUNT(IdTransacao) AS qtTransacoesClientes
-- FROM transacoes
-- GROUP BY id_cliente, dt_ym
-- HAVING qtPontosClientes > 400 -- Aqui não funciona o where, having entra com essa função após do group by
-- ORDER BY qtPontosClientes DESC;


-- ## LISTA DOS 10 CLIENTES, POR MÊS, QUE TIVERAM MAIS PONTOS:

-- WITH qt_pontos_mensais AS (
--   SELECT
--     IdCliente AS id_cliente,
--     STRFTIME('%Y-%m', DATE(DtCriacao)) as dt_ym,
--     SUM(qtdePontos) AS qt_pontos_clientes
--   FROM transacoes
--   GROUP BY id_cliente, dt_ym
-- ),

-- aux_ranking AS (
--   SELECT
--     *,
--     ROW_NUMBER() OVER ( -- função auxiliar para criar o ranking (over “calcule essa função sem agrupar as linhas, mas olhando um conjunto delas”)
--       PARTITION BY dt_ym -- divide o ranking por mes (tipo group by invisivel)
--       ORDER BY qt_pontos_clientes DESC
--     ) AS fl_posicao
--   FROM qt_pontos_mensais
-- )

-- SELECT
--   id_cliente,
--   dt_ym,
--   qt_pontos_clientes,
--   fl_posicao
-- FROM aux_ranking
-- WHERE fl_posicao <= 10
-- ORDER BY dt_ym;

-- ## LISTA DE TABELAS DO BANCO DE DADOS:
-- SELECT name
-- FROM sqlite_master
-- WHERE type = 'table';


-- ## LISTA DE COLUNAS DE CADA TABELA DO BANCO DE DADOS:
-- SELECT 
--   t.name AS tabela,
--   c.name AS coluna
-- FROM sqlite_master t
-- JOIN pragma_table_info(t.name) c
-- WHERE t.type = 'table'
-- ORDER BY t.name, c.cid;

-- ## QUAL CLIENTE JUNTOU MAIS PONTOS POSITIVOS EM 2025-05?
SELECT
  idCliente,
  STRFTIME('%Y-%m', DATE(DtCriacao)) AS dt_ym,
  SUM(QtdePontos) AS qt_pontos_clientes
FROM transacoes
WHERE STRFTIME('%Y-%m', DATE(DtCriacao)) LIKE '%05%'
GROUP BY idCliente, dt_ym
HAVING SUM(QtdePontos) > 0
ORDER BY qt_pontos_clientes DESC
LIMIT 1;