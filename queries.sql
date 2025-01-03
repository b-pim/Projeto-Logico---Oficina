-- Recuperações simples com SELECT Statement
-- Quais são os nomes e telefones de todos os clientes cadastrados?
SELECT Nome, Telefone 
FROM Cliente;

-- Filtros com WHERE Statement
-- Quais são os veículos do ano de fabricação 2020 ou mais recentes?
SELECT Modelo, Marca, Ano 
FROM Veiculo
WHERE Ano >= 2020;

-- Expressões para gerar atributos derivados
-- Qual é o custo total (peças + mão de obra) de cada ordem de serviço?
SELECT 
    idOS AS Ordem_Servico, 
    (Valor_Total + COALESCE(SUM(Peca_OS.Subtotal_Peca), 0)) AS Custo_Total
FROM Ordem_Servico
LEFT JOIN Peca_OS ON Ordem_Servico.idOS = Peca_OS.idOrdem_Servico
GROUP BY idOS;

-- Ordenações dos dados com ORDER BY
-- Liste todos os mecânicos ordenados por suas especialidades e, em seguida, por nome.
SELECT Nome, Especialidade 
FROM Mecanico
ORDER BY Especialidade ASC, Nome ASC;

-- Condições de filtros aos grupos – HAVING Statement
-- Quais equipes realizaram serviços cujo valor total foi superior a R$ 1.000?
SELECT 
    e.Nome_Equipe, 
    SUM(os.Valor_Total) AS Valor_Total_Servicos
FROM Equipe e
JOIN Ordem_Servico os ON e.idEquipe = os.idEquipe
GROUP BY e.idEquipe, e.Nome_Equipe
HAVING SUM(os.Valor_Total) > 1000;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Quais são os serviços realizados por veículo, mostrando o cliente associado?
SELECT 
    c.Nome AS Cliente,
    v.Modelo AS Veiculo, 
    v.Marca, 
    s.Descricao AS Servico, 
    so.Quantidade AS Quantidade_Servico,
    so.Subtotal_Servico
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente
JOIN Ordem_Servico os ON v.idVeiculo = os.idVeiculo
JOIN Servico_OS so ON os.idOS = so.idOrdem_Servico
JOIN Servico s ON so.idServico = s.idServico;

-- Junção com filtro e ordenação
-- Quais clientes possuem veículos registrados e qual é o modelo mais recente deles?
SELECT 
    c.Nome AS Cliente, 
    v.Modelo, 
    v.Marca, 
    v.Ano 
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente
ORDER BY c.Nome ASC, v.Ano DESC;

-- Filtro por status e cálculo derivado
-- Quais ordens de serviço estão em aberto e qual é o valor estimado para conclusão?
SELECT 
    os.idOS AS Ordem_Servico, 
    c.Nome AS Cliente,
    os.Status, 
    (COALESCE(SUM(po.Subtotal_Peca), 0) + COALESCE(SUM(so.Subtotal_Servico), 0)) AS Valor_Estimado
FROM Ordem_Servico os
JOIN Cliente c ON os.idCliente = c.idCliente
LEFT JOIN Peca_OS po ON os.idOS = po.idOrdem_Servico
LEFT JOIN Servico_OS so ON os.idOS = so.idOrdem_Servico
WHERE os.Status = 'Aberto'
GROUP BY os.idOS, c.Nome, os.Status;
