CREATE DATABASE db_golearn;

USE db_golearn;

CREATE TABLE equipes (
	id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    imagem_equipe BLOB,
    privada BOOLEAN NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tarefas (
	id INT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    arquivo_anexado BLOB,
    arquivo_enviado BLOB,
    PRIMARY KEY(id)
);

CREATE TABLE agenda (
	id INT AUTO_INCREMENT,
    lembrete VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE usuario (
	id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    telefone CHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    colegas INT,
    administrador BOOLEAN,
    id_equipes INT NOT NULL,
    id_tarefas INT NOT NULL,
    id_agenda INT NOT NULL,
    FOREIGN KEY(id_equipes) REFERENCES equipes(id),
    FOREIGN KEY(id_tarefas) REFERENCES tarefas(id),
    FOREIGN KEY(id_agenda) REFERENCES agenda(id),
    PRIMARY KEY(id)
);

