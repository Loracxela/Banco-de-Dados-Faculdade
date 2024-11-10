SHOW DATABASES;
CREATE DATABASE db_Faculdade;
USE db_Faculdade;


SELECT Disciplina.nome AS nome_disciplina, AVG (n.valor) AS Media_nota
FROM Curso c 
JOIN Disciplina d ON c.id = d.idCurso 
JOIN nota n ON d.id = n.idDisciplina 
GROUP BY Disciplina.nome; 

SELECT Curso.nome_curso, Aluno.nome_aluno
FROM Aluno
INNER JOIN AlunoCursoalunoidAluno
ON Aluno.idAluno = AlunoCurso.IdAluno
INNER JOIN Curso
ON Curso.idCurso = AlunoCurso.idCurso
ORDER BY Curso.nome_curso DESC;

-- Criar Tabela Aluno --

CREATE TABLE Aluno (
  idAluno INT NOT NULL,
  matricula VARCHAR(10) NOT NULL,
  nome_aluno VARCHAR(50) NOT NULL,
  PRIMARY KEY (idAluno)
);

-- Criar Tabela Curso --

CREATE TABLE Curso (
  idCurso INT NOT NULL,
  nome_curso VARCHAR(50) NOT NULL,
  PRIMARY KEY (idCurso)
);

-- Criar Tabela Disciplina --

CREATE TABLE Disciplina (
  idDisciplina INT NOT NULL,
  nome_disciplina VARCHAR(50) NOT NULL,
  cargaHoraria INT NOT NULL, 
  PRIMARY KEY (idDisciplina)
);

-- Criar Tabela Historico --

CREATE TABLE Historico (
  idAluno INT NOT NULL,
  idDisciplina INT NOT NULL, 
  nota FLOAT NOT NULL,
  dataHistorico DATE NOT NULL,
  FOREIGN KEY (idAluno) REFERENCES Aluno (idAluno),
  FOREIGN KEY (idDisciplina) REFERENCES Disciplina (idDisciplina)
);

-- Criar Tabela AlunoCurso --

CREATE TABLE AlunoCurso (
  idAluno INT NOT NULL, 
  idCurso INT NOT NULL, 
  anoEntrada INT NOT NULL,
  FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno),
  FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- Criar Tabela Grade --

CREATE TABLE Grade (
  idGrade INT NOT NULL,
  idCurso INT NOT NULL,
  ano INT NOT NULL,
  cargaHorariaTotal INT NOT NULL,
  PRIMARY KEY (idGrade),
  FOREIGN KEY (idCurso) REFERENCES Curso (idCurso)
);

-- Criar Tabela GradeDisciplina --

CREATE TABLE GradeDisciplina (
  idGrade INT NOT NULL,
  idDisciplina INT NOT NULL,
  FOREIGN KEY (idGrade) REFERENCES Grade (idGrade),
  FOREIGN KEY (idDisciplina) REFERENCES Disciplina (idDisciplina)
);

-- Dados Aluno --

  insert into Aluno values ( 1, 'ADS001', 'Alice de Souza');
  insert into Aluno values ( 2, 'BDS001', 'Ana Luiza de Paula');
  insert into Aluno values ( 3, 'CDS001', 'Maria Helena Mantovani');
  insert into Aluno values ( 4, 'DSM001', 'Marta da Silva');
  insert into Aluno values( 5, 'ENC001', 'Viviane Chaves Filha');
  insert into Aluno values ( 6, 'ENS001', 'Paula Roberta Vitorino');
  insert into Aluno values ( 7, 'GTI001', 'Miriam Miranda');
  insert into Aluno values ( 8, 'JDS001', 'Beatriz Leopoldina');
  insert into Aluno values ( 9, 'RCS001', 'Nicole Amanda de Jesus');
  insert into Aluno values (10, 'RCS002', 'Vitor Martins');
  insert into Aluno values (11, 'JDS002', 'João Augusto de Moura');
  insert into Aluno values (12, 'GTI002', 'Matheus Murilo de Souza');
  insert into Aluno values (13, 'ENS002', 'Mario Vicente');
  insert into Aluno values (14, 'ENC002', 'Antônio Cozer');
  insert into Aluno values (15, 'DSM002', 'Luciano Tucolo');
  insert into Aluno values (16, 'CDS002', 'Guilherme Koeriche');
  insert into Aluno values (17, 'BDS002', 'Lucas Cochuelo');
  insert into Aluno values (18, 'ADS002', 'Diogo Furlan');
  insert into Aluno values (19, 'ADS003', 'Marcelo Luis dos Santos');
    
  select * from Aluno;
    
-- Dados Curso --
    
  insert into Curso values (1, 'Análise e Desenvolvimento de Sistemas');
  insert into Curso values (2, 'Banco de Dados');
  insert into Curso values (3, 'Ciência de Dados');
  insert into Curso values (4, 'Desenvolvimento Mobile');
  insert into Curso values (5, 'Engenharia da Computação');
  insert into Curso values (6, 'Engenharia de Software');
  insert into Curso values (7, 'Gestão da Tecnologia da Informação');
  insert into Curso values (8, 'Jogos Digitais');
  insert into Curso values (9, 'Redes de Computadores');
    
  select * from Curso;
    
-- Dados Disciplina --

  insert into Disciplina values ( 1, 'Análise de Sistemas', 60);
  insert into Disciplina values ( 2, 'Arquitetura de Computadores', 60);
  insert into Disciplina values ( 3, 'Atividade Extensionista I', 40);
  insert into Disciplina values ( 4, 'Atividade Extensionista II', 40);
  insert into Disciplina values ( 5, 'Banco de Dados', 60);
  insert into Disciplina values ( 6, 'Empreendedorismo', 40);
  insert into Disciplina values ( 7, 'Engenharia de Software', 60);
  insert into Disciplina values ( 8, 'Fundamentos de Sistemas de Informação', 60);
  insert into Disciplina values ( 9, 'Gestão de Projetos de Software', 60);
  insert into Disciplina values (10, 'Lógica de Programação e Algoritmos', 80);
  insert into Disciplina values (11, 'Matemática Computacional', 40);
  insert into Disciplina values (12, 'Programação de Computadores', 80);
  insert into Disciplina values (13, 'Programação Orientada a Objetos', 80);
  insert into Disciplina values (14, 'Sistema Gerenciador de Banco de Dados', 60);
  insert into Disciplina values (15, 'Sistemas Operacionais', 60);
    
  select * from Disciplina; 
    
-- Dados Historico --

  insert into Historico values ( 3,  1, 90, '2022-12-09'); 
  insert into Historico values ( 3,  3, 75, '2022-12-09');
  insert into Historico values ( 3,  5, 85, '2022-12-09');
  insert into Historico values ( 9,  1, 80, '2022-12-16');
  insert into Historico values ( 9,  9, 75, '2022-12-16');
  insert into Historico values ( 9, 11, 70, '2022-12-16');
  insert into Historico values (13, 12, 70, '2022-12-09');
  insert into Historico values (13, 13, 70, '2022-12-09');
  insert into Historico values (13, 14, 82, '2022-12-09');
  insert into Historico values (15,  2, 76, '2022-12-16');
  insert into Historico values (15,  4, 80, '2022-12-16');
  insert into Historico values (15,  6, 89, '2022-12-16');
    
  select * from Historico;
    
-- Dados AlunoCurso --

  insert into AlunoCurso values ( 1, 1, 2023);
  insert into AlunoCurso values ( 2, 2, 2023);
  insert into AlunoCurso values ( 3, 3, 2022);
  insert into AlunoCurso values ( 4, 4, 2023);
  insert into AlunoCurso values ( 5, 5, 2023);
  insert into AlunoCurso values ( 6, 6, 2023);
  insert into AlunoCurso values ( 7, 7, 2023);
  insert into AlunoCurso values ( 8, 8, 2023);
  insert into AlunoCurso values ( 9, 9, 2022);
  insert into AlunoCurso values (10, 9, 2023);
  insert into AlunoCurso values (11, 8, 2023);
  insert into AlunoCurso values(12, 7, 2023);
  insert into AlunoCurso values (13, 6, 2022);
  insert into AlunoCurso values (14, 5, 2023);
  insert into AlunoCurso values (15, 4, 2022);
  insert into AlunoCurso values (16, 3, 2023);
  insert into AlunoCurso values (17, 2, 2023);
  insert into AlunoCurso values (18, 1, 2023);
  insert into AlunoCurso values (19, 1, 2023);
    
  select * from AlunoCurso; 

-- Dados Grade --

  insert into Grade values ( 1, 1, 2021, 880);
  insert into Grade values ( 2, 2, 2022, 880);
  insert into Grade values ( 3, 3, 2022, 880);
  insert into Grade values ( 4, 4, 2022, 880);
  insert into Grade values ( 5, 5, 2019, 880);
  insert into Grade values ( 6, 6, 2022, 880);
  insert into Grade values ( 7, 7, 2022, 880);
  insert into Grade values ( 8, 8, 2022, 880);
  insert into Grade values ( 9, 9, 2019, 880);
  insert into Grade values (10, 1, 2023, 880);
  insert into Grade values (11, 5, 2023, 880);
  insert into Grade values (12, 9, 2023, 880);
    
   select * from Grade;

-- Dados Grade Disciplina --

  insert into GradeDisciplina values ( 1, 1), ( 1, 2), ( 1, 3), ( 1, 4), ( 1, 5), ( 1, 6), ( 1, 7), ( 1, 8), ( 1, 9), ( 1, 10), ( 1, 11), ( 1, 12), ( 1, 13), ( 1, 14), ( 1, 15);
  insert into GradeDisciplina values ( 2, 1), ( 2, 2), ( 2, 3), ( 2, 4), ( 2, 5), ( 2, 6), ( 2, 7), ( 2, 8), ( 2, 9), ( 2, 10), ( 2, 11), ( 2, 12), ( 2, 13), ( 2, 14), ( 2, 15);
  insert into GradeDisciplina values ( 3, 1), ( 3, 2), ( 3, 3), ( 3, 4), ( 3, 5), ( 3, 6), ( 3, 7), ( 3, 8), ( 3, 9), ( 3, 10), ( 3, 11), ( 3, 12), ( 3, 13), ( 3, 14), ( 3, 15);
  insert into GradeDisciplina values ( 4, 1), ( 4, 2), ( 4, 3), ( 4, 4), ( 4, 5), ( 4, 6), ( 4, 7), ( 4, 8), ( 4, 9), ( 4, 10), ( 4, 11), ( 4, 12), ( 4, 13), ( 4, 14), ( 4, 15);
  insert into GradeDisciplina values ( 5, 1), ( 5, 2), ( 5, 3), ( 5, 4), ( 5, 5), ( 5, 6), ( 5, 7), ( 5, 8), ( 5, 9), ( 5, 10), ( 5, 11), ( 5, 12), ( 5, 13), ( 5, 14), ( 5, 15);
  insert into GradeDisciplina values ( 6, 1), ( 6, 2), ( 6, 3), ( 6, 4), ( 6, 5), ( 6, 6), ( 6, 7), ( 6, 8), ( 6, 9), ( 6, 10), ( 6, 11), ( 6, 12), ( 6, 13), ( 6, 14), ( 6, 15);
  insert into GradeDisciplina values ( 7, 1), ( 7, 2), ( 7, 3), ( 7, 4), ( 7, 5), ( 7, 6), ( 7, 7), ( 7, 8), ( 7, 9), ( 7, 10), ( 7, 11), ( 7, 12), ( 7, 13), ( 7, 14), ( 7, 15);
  insert into GradeDisciplina values ( 8, 1), ( 8, 2), ( 8, 3), ( 8, 4), ( 8, 5), ( 8, 6), ( 8, 7), ( 8, 8), ( 8, 9), ( 8, 10), ( 8, 11), ( 8, 12), ( 8, 13), ( 8, 14), ( 8, 15);
  insert into GradeDisciplina values ( 9, 1), ( 9, 2), ( 9, 3), ( 9, 4), ( 9, 5), ( 9, 6), ( 9, 7), ( 9, 8), ( 9, 9), ( 9, 10), ( 9, 11), ( 9, 12), ( 9, 13), ( 9, 14), ( 9, 15);
  insert into GradeDisciplina values (10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8), (10, 9), (10, 10), (10, 11), (10, 12), (10, 13), (10, 14), (10, 15);
  insert into GradeDisciplina values (11, 1), (11, 2), (11, 3), (11, 4), (11, 5), (11, 6), (11, 7), (11, 8), (11, 9), (11, 10), (11, 11), (11, 12), (11, 13), (11, 14), (11, 15);
  insert into GradeDisciplina values (12, 1), (12, 2), (12, 3), (12, 4), (12, 5), (12, 6), (12, 7), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12), (12, 13), (12, 14), (12, 15);
    
  select * from GradeDisciplina;  
