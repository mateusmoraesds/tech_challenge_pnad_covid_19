CREATE OR REPLACE TABLE `tech3_pesquisa_covid.GOLD_RESPOSTAS_CONSOLIDADAS` AS

-- ===================== MAIO =====================
SELECT
    '2020-05' AS Mes_Pesquisa,
	  id,
    UF,
    Capital,
    Regiao_Metropolitana,

    CASE Regiao_Domicilio
        WHEN 1 THEN 'Urbana'
        WHEN 2 THEN 'Rural'
    END AS Regiao_Domicilio,

    CASE Tipo_Area
        WHEN 1 THEN 'Capital'
        WHEN 2 THEN 'Resto da RM'
        WHEN 3 THEN 'Resto da RIDE'
        WHEN 4 THEN 'Resto da UF'
    END AS Tipo_Area,

    -- SINTOMAS
    CASE Teve_Febre WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Teve_Febre,
    CASE Teve_Tosse WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Teve_Tosse,
    CASE Dificuldade_Respiracao WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Dificuldade_Respiracao,
    CASE Dor_no_Peito WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Dor_no_Peito,
    CASE Perda_Cheiro_Sabor WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Perda_Cheiro_Sabor,

    -- ATENDIMENTO
    CASE CAST(Foi_Atendimento_Saude AS INT64)
        WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado'
    END AS Foi_Atendimento_Saude,

    -- AÇÕES
    CASE CAST(Ficou_Em_Casa AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Ficou_Em_Casa,
    CASE CAST(Ligou_Profissional_Saude AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Ligou_Profissional_Saude,
    CASE CAST(Medicacao_Conta_Propria AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Medicacao_Conta_Propria,
    CASE CAST(Medicacao_Orientada AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Medicacao_Orientada,
    CASE CAST(Visita_Profissional_SUS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Visita_Profissional_SUS,
    CASE CAST(Visita_Profissional_Particular AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Visita_Profissional_Particular,

    -- LOCAIS
    CASE CAST(Atendimento_UBS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_UBS,
    CASE CAST(Atendimento_UPA AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_UPA,
    CASE CAST(Atendimento_Hospital_SUS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_Hospital_SUS,

    CASE CAST(Internado_Hospital AS INT64)
        WHEN 1 THEN 'Sim'
        WHEN 2 THEN 'Não'
        WHEN 3 THEN 'Não foi atendido'
        WHEN 9 THEN 'Ignorado'
    END AS Internado_Hospital,

    CASE CAST(Entubado AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Entubado,
    CASE CAST(Plano_Saude AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Plano_Saude,

    -- TRABALHO
    CASE CAST(Afastado_Trabalho AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Afastado_Trabalho,

    CASE CAST(Tempo_Afastamento AS INT64)
        WHEN 1 THEN 'Menos de 1 mês'
        WHEN 2 THEN '1 mês a <1 ano'
        WHEN 3 THEN '1 a <2 anos'
        WHEN 4 THEN '2 anos ou mais'
    END AS Tempo_Afastamento,

    CASE CAST(Tipo_Vinculo AS INT64)
        WHEN 1 THEN 'CLT'
        WHEN 2 THEN 'Servidor público'
        WHEN 3 THEN 'Não'
    END AS Tipo_Vinculo,

    CASE CAST(Faixa_Rendimento AS INT64)
        WHEN 0 THEN '0-100'
        WHEN 1 THEN '101-300'
        WHEN 2 THEN '301-600'
        WHEN 3 THEN '601-800'
        WHEN 4 THEN '801-1600'
        WHEN 5 THEN '1601-3000'
        WHEN 6 THEN '3001-10000'
        WHEN 7 THEN '10001-50000'
        WHEN 8 THEN '50001-100000'
        WHEN 9 THEN 'Mais de 100000'
    END AS Faixa_Rendimento,

    CASE CAST(Trabalho_Remoto AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Trabalho_Remoto,

    -- RENDA
    CASE CAST(Aposentadoria_Pensao AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Aposentadoria_Pensao,
    CASE CAST(Bolsa_Familia AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Bolsa_Familia,
    CASE CAST(Auxilio_Emergencial AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Auxilio_Emergencial,
    CASE CAST(Seguro_Desemprego AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Seguro_Desemprego,
    CASE CAST(Outros_Rendimentos AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Outros_Rendimentos,

    -- DOMICÍLIO
    CASE Situacao_Domicilio
        WHEN 1 THEN 'Próprio pago'
        WHEN 2 THEN 'Próprio pagando'
        WHEN 3 THEN 'Alugado'
        WHEN 4 THEN 'Cedido empregador'
        WHEN 5 THEN 'Cedido familiar'
        WHEN 6 THEN 'Outro cedido'
        WHEN 7 THEN 'Outra condição'
    END AS Situacao_Domicilio,

    CASE CAST(Faixa_Aluguel AS INT64)
        WHEN 0 THEN '1-100'
        WHEN 1 THEN '101-300'
        WHEN 2 THEN '301-600'
        WHEN 3 THEN '601-800'
        WHEN 4 THEN '801-1600'
        WHEN 5 THEN '1601-3000'
        WHEN 6 THEN '3001-10000'
        WHEN 7 THEN '10001-50000'
        WHEN 8 THEN '50001-100000'
        WHEN 9 THEN 'Mais de 100000'
        WHEN 8 THEN 'Aluguel a vencer'
    END AS Faixa_Aluguel

FROM `tech3_pesquisa_covid.SILVER_PNAD_COVID_052020`

UNION ALL

-- ===================== JUNHO =====================
SELECT
    '2020-06' AS Mes_Pesquisa,
	  id,
    UF,
    Capital,
    Regiao_Metropolitana,

    CASE Regiao_Domicilio
        WHEN 1 THEN 'Urbana'
        WHEN 2 THEN 'Rural'
    END AS Regiao_Domicilio,

    CASE Tipo_Area
        WHEN 1 THEN 'Capital'
        WHEN 2 THEN 'Resto da RM'
        WHEN 3 THEN 'Resto da RIDE'
        WHEN 4 THEN 'Resto da UF'
    END AS Tipo_Area,

    -- SINTOMAS
    CASE Teve_Febre WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Teve_Febre,
    CASE Teve_Tosse WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Teve_Tosse,
    CASE Dificuldade_Respiracao WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Dificuldade_Respiracao,
    CASE Dor_no_Peito WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Dor_no_Peito,
    CASE Perda_Cheiro_Sabor WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Perda_Cheiro_Sabor,

    -- ATENDIMENTO
    CASE CAST(Foi_Atendimento_Saude AS INT64)
        WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado'
    END AS Foi_Atendimento_Saude,

    -- AÇÕES
    CASE CAST(Ficou_Em_Casa AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Ficou_Em_Casa,
    CASE CAST(Ligou_Profissional_Saude AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Ligou_Profissional_Saude,
    CASE CAST(Medicacao_Conta_Propria AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Medicacao_Conta_Propria,
    CASE CAST(Medicacao_Orientada AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Medicacao_Orientada,
    CASE CAST(Visita_Profissional_SUS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Visita_Profissional_SUS,
    CASE CAST(Visita_Profissional_Particular AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Visita_Profissional_Particular,

    -- LOCAIS
    CASE CAST(Atendimento_UBS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_UBS,
    CASE CAST(Atendimento_UPA AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_UPA,
    CASE CAST(Atendimento_Hospital_SUS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_Hospital_SUS,

    CASE CAST(Internado_Hospital AS INT64)
        WHEN 1 THEN 'Sim'
        WHEN 2 THEN 'Não'
        WHEN 3 THEN 'Não foi atendido'
        WHEN 9 THEN 'Ignorado'
    END AS Internado_Hospital,

    CASE CAST(Entubado AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Entubado,
    CASE CAST(Plano_Saude AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Plano_Saude,

    -- TRABALHO
    CASE CAST(Afastado_Trabalho AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Afastado_Trabalho,

    CASE CAST(Tempo_Afastamento AS INT64)
        WHEN 1 THEN 'Menos de 1 mês'
        WHEN 2 THEN '1 mês a <1 ano'
        WHEN 3 THEN '1 a <2 anos'
        WHEN 4 THEN '2 anos ou mais'
    END AS Tempo_Afastamento,

    CASE CAST(Tipo_Vinculo AS INT64)
        WHEN 1 THEN 'CLT'
        WHEN 2 THEN 'Servidor público'
        WHEN 3 THEN 'Não'
    END AS Tipo_Vinculo,

    CASE CAST(Faixa_Rendimento AS INT64)
        WHEN 0 THEN '0-100'
        WHEN 1 THEN '101-300'
        WHEN 2 THEN '301-600'
        WHEN 3 THEN '601-800'
        WHEN 4 THEN '801-1600'
        WHEN 5 THEN '1601-3000'
        WHEN 6 THEN '3001-10000'
        WHEN 7 THEN '10001-50000'
        WHEN 8 THEN '50001-100000'
        WHEN 9 THEN 'Mais de 100000'
    END AS Faixa_Rendimento,

    CASE CAST(Trabalho_Remoto AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Trabalho_Remoto,

    -- RENDA
    CASE CAST(Aposentadoria_Pensao AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Aposentadoria_Pensao,
    CASE CAST(Bolsa_Familia AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Bolsa_Familia,
    CASE CAST(Auxilio_Emergencial AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Auxilio_Emergencial,
    CASE CAST(Seguro_Desemprego AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Seguro_Desemprego,
    CASE CAST(Outros_Rendimentos AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Outros_Rendimentos,

    -- DOMICÍLIO
    CASE Situacao_Domicilio
        WHEN 1 THEN 'Próprio pago'
        WHEN 2 THEN 'Próprio pagando'
        WHEN 3 THEN 'Alugado'
        WHEN 4 THEN 'Cedido empregador'
        WHEN 5 THEN 'Cedido familiar'
        WHEN 6 THEN 'Outro cedido'
        WHEN 7 THEN 'Outra condição'
    END AS Situacao_Domicilio,

    CASE CAST(Faixa_Aluguel AS INT64)
        WHEN 0 THEN '1-100'
        WHEN 1 THEN '101-300'
        WHEN 2 THEN '301-600'
        WHEN 3 THEN '601-800'
        WHEN 4 THEN '801-1600'
        WHEN 5 THEN '1601-3000'
        WHEN 6 THEN '3001-10000'
        WHEN 7 THEN '10001-50000'
        WHEN 8 THEN '50001-100000'
        WHEN 9 THEN 'Mais de 100000'
        WHEN 8 THEN 'Aluguel a vencer'
    END AS Faixa_Aluguel

FROM `tech3_pesquisa_covid.SILVER_PNAD_COVID_062020`

UNION ALL 

-- ===================== JULHO =====================
SELECT
    '2020-07' AS Mes_Pesquisa,
	  id,
    UF,
    Capital,
    Regiao_Metropolitana,

    CASE Regiao_Domicilio
        WHEN 1 THEN 'Urbana'
        WHEN 2 THEN 'Rural'
    END AS Regiao_Domicilio,

    CASE Tipo_Area
        WHEN 1 THEN 'Capital'
        WHEN 2 THEN 'Resto da RM'
        WHEN 3 THEN 'Resto da RIDE'
        WHEN 4 THEN 'Resto da UF'
    END AS Tipo_Area,

    -- SINTOMAS
    CASE Teve_Febre WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Teve_Febre,
    CASE Teve_Tosse WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Teve_Tosse,
    CASE Dificuldade_Respiracao WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Dificuldade_Respiracao,
    CASE Dor_no_Peito WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Dor_no_Peito,
    CASE Perda_Cheiro_Sabor WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 3 THEN 'Não sabe' WHEN 9 THEN 'Ignorado' END AS Perda_Cheiro_Sabor,

    -- ATENDIMENTO
    CASE CAST(Foi_Atendimento_Saude AS INT64)
        WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado'
    END AS Foi_Atendimento_Saude,

    -- AÇÕES
    CASE CAST(Ficou_Em_Casa AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Ficou_Em_Casa,
    CASE CAST(Ligou_Profissional_Saude AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Ligou_Profissional_Saude,
    CASE CAST(Medicacao_Conta_Propria AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Medicacao_Conta_Propria,
    CASE CAST(Medicacao_Orientada AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Medicacao_Orientada,
    CASE CAST(Visita_Profissional_SUS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Visita_Profissional_SUS,
    CASE CAST(Visita_Profissional_Particular AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Visita_Profissional_Particular,

    -- LOCAIS
    CASE CAST(Atendimento_UBS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_UBS,
    CASE CAST(Atendimento_UPA AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_UPA,
    CASE CAST(Atendimento_Hospital_SUS AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Atendimento_Hospital_SUS,

    CASE CAST(Internado_Hospital AS INT64)
        WHEN 1 THEN 'Sim'
        WHEN 2 THEN 'Não'
        WHEN 3 THEN 'Não foi atendido'
        WHEN 9 THEN 'Ignorado'
    END AS Internado_Hospital,

    CASE CAST(Entubado AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Entubado,
    CASE CAST(Plano_Saude AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' WHEN 9 THEN 'Ignorado' END AS Plano_Saude,

    -- TRABALHO
    CASE CAST(Afastado_Trabalho AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Afastado_Trabalho,

    CASE CAST(Tempo_Afastamento AS INT64)
        WHEN 1 THEN 'Menos de 1 mês'
        WHEN 2 THEN '1 mês a <1 ano'
        WHEN 3 THEN '1 a <2 anos'
        WHEN 4 THEN '2 anos ou mais'
    END AS Tempo_Afastamento,

    CASE CAST(Tipo_Vinculo AS INT64)
        WHEN 1 THEN 'CLT'
        WHEN 2 THEN 'Servidor público'
        WHEN 3 THEN 'Não'
    END AS Tipo_Vinculo,

    CASE CAST(Faixa_Rendimento AS INT64)
        WHEN 0 THEN '0-100'
        WHEN 1 THEN '101-300'
        WHEN 2 THEN '301-600'
        WHEN 3 THEN '601-800'
        WHEN 4 THEN '801-1600'
        WHEN 5 THEN '1601-3000'
        WHEN 6 THEN '3001-10000'
        WHEN 7 THEN '10001-50000'
        WHEN 8 THEN '50001-100000'
        WHEN 9 THEN 'Mais de 100000'
    END AS Faixa_Rendimento,

    CASE CAST(Trabalho_Remoto AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Trabalho_Remoto,

    -- RENDA
    CASE CAST(Aposentadoria_Pensao AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Aposentadoria_Pensao,
    CASE CAST(Bolsa_Familia AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Bolsa_Familia,
    CASE CAST(Auxilio_Emergencial AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Auxilio_Emergencial,
    CASE CAST(Seguro_Desemprego AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Seguro_Desemprego,
    CASE CAST(Outros_Rendimentos AS INT64) WHEN 1 THEN 'Sim' WHEN 2 THEN 'Não' END AS Outros_Rendimentos,

    -- DOMICÍLIO
    CASE Situacao_Domicilio
        WHEN 1 THEN 'Próprio pago'
        WHEN 2 THEN 'Próprio pagando'
        WHEN 3 THEN 'Alugado'
        WHEN 4 THEN 'Cedido empregador'
        WHEN 5 THEN 'Cedido familiar'
        WHEN 6 THEN 'Outro cedido'
        WHEN 7 THEN 'Outra condição'
    END AS Situacao_Domicilio,

    CASE CAST(Faixa_Aluguel AS INT64)
        WHEN 0 THEN '1-100'
        WHEN 1 THEN '101-300'
        WHEN 2 THEN '301-600'
        WHEN 3 THEN '601-800'
        WHEN 4 THEN '801-1600'
        WHEN 5 THEN '1601-3000'
        WHEN 6 THEN '3001-10000'
        WHEN 7 THEN '10001-50000'
        WHEN 8 THEN '50001-100000'
        WHEN 9 THEN 'Mais de 100000'
        WHEN 8 THEN 'Aluguel a vencer'
    END AS Faixa_Aluguel

FROM `tech3_pesquisa_covid.SILVER_PNAD_COVID_072020`