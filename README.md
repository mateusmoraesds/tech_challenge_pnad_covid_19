# tech_challenge_pnad_covid_19
Este projeto tem como objetivo a construção de um Data Lake baseado nos dados da PNAD COVID-19, disponibilizados pelo IBGE, com foco na estruturação, tratamento e análise de dados para geração de insights sobre os impactos da pandemia no Brasil.
-
🎯 Objetivos
Implementar uma arquitetura de dados moderna (medalhão)
Estruturar pipeline de ingestão e transformação
Modelar dados para consumo analítico
Desenvolver dashboard interativo no Power BI
Gerar insights relevantes sobre a pandemia
-
🏗️ Arquitetura de Dados
-
O projeto segue o conceito de arquitetura medalhão:

🥉 Bronze
-
Dados brutos extraídos diretamente da fonte (IBGE)
Armazenamento em Google Cloud Storage
Sem tratamento ou modificação
-
🥈 Silver
-
Tratamento e padronização dos dados
Conversão de tipos
Tratamento de valores nulos
Padronização de respostas categóricas
-
🥇 Gold
-
Dados consolidados e modelados
Estrutura dimensional
Preparação para consumo no Power BI
-
☁️ Tecnologias Utilizadas
-
Google Cloud Storage (GCS) – Data Lake
BigQuery – Processamento e modelagem
SQL – Transformações de dados
Power BI – Visualização e análise
-
📊 Modelagem de Dados
-
Foi adotado o modelo dimensional (estrela):
-
Fato: Respostas da PNAD
Dimensões:
Unidade Federativa (UF)
Região Metropolitana
Capital
Calendário
-
📈 Principais Insights
-
Redução na busca por atendimento médico ao longo do tempo
Crescimento contínuo das internações
Desigualdade regional nos impactos da pandemia
Maior volume de internações em faixas de renda mais altas
Predominância de indivíduos sem plano de saúde entre os internados
Redução de sintomas associada a possível adaptação comportamental
