/* mysql -u root -p comando de acesso ao mysql 
SHOW DATABASES comando para visualizar bancos*/
CREATE DATABASE banco_o14;
USE banco_o14;

create table bairro(
    cod_bairro INT AUTO_INCREMENT,
    nome_bairro VARCHAR(45) NOT NULL,
    PRIMARY KEY(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

create table usuario(
    cod_usuario INT AUTO_INCREMENT,
    nome_usuario VARCHAR(45) NOT NULL,
    bairro_usuario INT NOT NULL,
    email VARCHAR(115),
    senha VARCHAR (45),
    PRIMARY KEY(cod_usuario),
    FOREIGN KEY(bairro_usuario) REFERENCES bairro(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(45) NOT NULL,
    bairro_cliente INT,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(bairro_cliente) REFERENCES bairro(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE conta(
    num_conta INT AUTO_INCREMENT,
    cliente_conta INT,
    tipo_conta INT,
    agencia_conta INT,
    saldo_conta   DOUBLE NOT NULL,
    PRIMARY KEY (num_conta),
    FOREIGN KEY (cliente_conta) REFERENCES cliente(id_cliente),
    FOREIGN KEY (tipo_conta)    REFERENCES tipo_conta(conta),
    FOREIGN KEY (agencia_conta) REFERENCES agencia(num_agencia)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE agencia(
    num_agencia INT AUTO_INCREMENT,
    gerente_agencia INT,
    PRIMARY KEY (num_agencia),
    FOREIGN KEY (gerente_agencia) REFERENCES gerente(cod_gerente)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE tipo_conta(
    conta INT,
    tipo_conta VARCHAR(55),
    PRIMARY KEY(conta)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE gerente(
    cod_gerente INT AUTO_INCREMENT,
    nome_gerente VARCHAR(45),
    bairro_gerente INT,
    PRIMARY KEY(cod_gerente)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE transacao(
    cod_transacao INT AUTO_INCREMENT,
    tipo_trasacao INT,
    conta_trasacao INT,
    valor DOUBLE NOT NULL,
    PRIMARY KEY(cod_transacao),
    FOREIGN KEY(conta_trasacao) REFERENCES conta(num_conta)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE tipo_transacao(
    transacao INT,
    tipo_transacao VARCHAR(55) NOT NULL
)ENGINE=innoDB DEFAULT CHARSET=utf8;

INSERT INTO bairro(nome_bairro) VALUES ('Asa sul'), ('Asa norte'), ('Lago sul'), ('Lago norte');

INSERT INTO usuario(nome_usuario,bairro_usuario) VALUES ('oto',2), ('anna',4), ('gorety',1), ('odety',1);

SELECT nome_usuario, nome_bairro FROM usuario INNER JOIN bairro ON bairro_usuario=cod_bairro;

SELECT * FROM bairro;

ALTER TABLE gerente ADD bairro_gerente INT;

ALTER TABLE tipo_conta MODIFY tipo VARCHAR(75);

ALTER TABLE tipo_conta CHANGE tipo_conta tipo VARCHAR(75) NOT NULL;

ALTER TABLE gerente ADD FOREIGN KEY (bairro_gerente) REFERENCES bairro(cod_bairro);