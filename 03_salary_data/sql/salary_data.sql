SELECT * FROM salary_data LIMIT 30;

-- Bloco 1: Fundamentos e Filtros
-- Busca por Título: Encontre o Gender e o Salary de todos os funcionários cujo cargo (Job Title) seja 
-- 'Data Analyst'.

SELECT Gender, Salary
FROM salary_data
WHERE job_title	== 'Data Analyst'


-- Filtragem Múltipla: Liste o Job Title de todas as mulheres com Education Level de 'Master's'.

SELECT Gender, education_level, job_title
FROM salary_data
WHERE Gender == 'Female' and education_level == "Master's"

-- Funcionário Mais Experiente: Encontre o Job Title e o Salary da pessoa com o maior número de Years 
-- of Experience.

SELECT job_title, Salary, years_of_experience
FROM salary_data
ORDER BY years_of_experience DESC
LIMIT 10;

-- Busca por Palavra-Chave: Liste todos os cargos que contêm a palavra 'Manager' no nome. 

SELECT *
FROM salary_data
WHERE job_title LIKE '%Manager%'

-- Bloco 2: Agregação e Análise (AVG, SUM, GROUP BY)
-- Salário Médio por Educação: Calcule o salário médio (AVG(Salary)) para cada Education Level distinto.

SELECT education_level, round(avg(Salary),2) as media_salarial
FROM salary_data
GROUP BY education_level
ORDER BY media_salarial DESC;

-- Experiência Média por Gênero: Qual é a média de anos de experiência para Male (Homem) versus Female (Mulher)?

SELECT Gender, round(avg(years_of_experience),2) as media_experiencia
FROM salary_data
GROUP BY Gender;

-- Salário Total por Idade: Calcule o salário total para cada Age distinta na tabela.

SELECT Age, sum(Salary) as soma_salarios
FROM salary_data
GROUP BY age
ORDER BY soma_salarios DESC;

-- Bloco 3: Ranking e Condicionais (ORDER BY, LIMIT, HAVING)
-- Top 5 Salários Médios: Encontre os 5 cargos (Job Title) com o maior salário médio, listando o cargo e 
-- o salário médio, em ordem decrescente.

SELECT job_title, round(avg(Salary),2) as salario_medio
FROM salary_data
GROUP BY job_title
ORDER BY salario_medio DESC
LIMIT 5;

-- Filtro por Limite: Conte quantos funcionários existem para cada nível de educação, mas exiba apenas 
-- os níveis de educação onde o salário médio seja superior a $100.000 (Use a cláusula HAVING).

SELECT education_level, count(education_level) as qtde_funcionarios, round(avg(Salary),2) as salario_medio
FROM salary_data
GROUP BY education_level
HAVING salario_medio > 100000





















