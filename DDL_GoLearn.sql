CREATE DATABASE db_golearn;

USE db_golearn;

CREATE TABLE usuarios(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE agendas(
    id_agenda INT AUTO_INCREMENT PRIMARY KEY,
    data_agenda DATE NOT NULL,
    lembrete VARCHAR(100), 
    id_usuario INT,
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE chats(
	id_chat INT AUTO_INCREMENT PRIMARY KEY,
    is_group BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE mensagens(
	id_mensagem INT AUTO_INCREMENT PRIMARY KEY,
    conteudo TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_chat INT,
    id_sender INT,
    FOREIGN KEY(id_chat) REFERENCES chats(id_chat),
    FOREIGN KEY(id_sender) REFERENCES usuarios(id_usuario)
);

CREATE TABLE membros(
	id_membro INT AUTO_INCREMENT PRIMARY KEY,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_chat INT,
    id_usuario INT,
    FOREIGN KEY(id_chat) REFERENCES chats(id_chat),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE administradores(
	id_adm INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100)
);

CREATE TABLE videoaulas(
	id_videoaula INT AUTO_INCREMENT PRIMARY KEY,
    video BLOB,
    descricao VARCHAR(100) NOT NULL,
	arquivo BLOB,
    imagem BLOB,
    id_adm INT,
    FOREIGN KEY(id_adm) REFERENCES administradores(id_adm)
);

CREATE TABLE atividades(
	id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
	arquivo BLOB,
    id_adm INT,
    FOREIGN KEY(id_adm) REFERENCES administradores(id_adm)
);

CREATE TABLE materiais(
	id_material INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
	arquivo BLOB,
    materia varchar(50),
    id_adm INT,
    FOREIGN KEY(id_adm) REFERENCES administradores(id_adm)
);

CREATE TABLE conteudos(
	id_conteudo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao varchar(100),
	arquivo BLOB,
    id_adm INT,
    FOREIGN KEY(id_adm) REFERENCES administradores(id_adm)
);

CREATE TABLE equipes(
	id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(100),
    imagem BLOB,
    id_conteudo INT,
    id_usuario INT,
    id_material INT,
    id_adm INT,
    id_videoaula INT,
    id_atividade INT,
    FOREIGN KEY(id_conteudo) REFERENCES conteudos(id_conteudo),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY(id_material) REFERENCES materiais(id_material),
    FOREIGN KEY(id_adm) REFERENCES administradores(id_adm),
    FOREIGN KEY(id_videoaula) REFERENCES videoaulas(id_videoaula),
    FOREIGN KEY(id_atividade) REFERENCES atividades(id_atividade)
);