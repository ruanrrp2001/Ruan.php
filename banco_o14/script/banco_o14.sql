/* mysql -u root -p comando de acesso ao mysql 
SHOW DATABASES comando para visualizar bancos*/
CREATE DATABASE banco_o14;
USE banco_o14;

create table bairro(
    cod_bairro INT NOT NULL AUTO_INCREMENT,
    nome_bairro VARCHAR(45) NOT NULL,
    PRIMARY KEY(cod_bairro)
);

create table usuario(
    cod_usuario INT NOT NULL AUTO_INCREMENT,
    nome_usuario VARCHAR(45) NOT NULL,
    bairro_usuario INT NOT NULL,
    PRIMARY KEY(cod_usuario),
    FOREIGN KEY(bairro_usuario) REFERENCES bairro(cod_bairro)
);
INSERT INTO bairro(nome_bairro) VALUES ('Asa sul'), ('Asa norte'), ('Lago sul'), ('Lago norte');
INSERT INTO usuario(nome_usuario,bairro_usuario) VALUES ('oto',2), ('anna',4), ('gorety',1), ('odety',1);
SELECT nome_usuario, nome_bairro FROM usuario INNER JOIN bairro ON bairro_usuario=cod_bairro;
SELECT * FROM bairro;
ALTER TABLE usuario ADD senha VARCHAR(30);
ALTER TABLE usuario MODIFY senha VARCHAR(32);