/*c:\xampp\mysql\bin
/.mysql -u root -p //Comando de acesso ao mysql (sem senha, pressione enter)
SHOW DATABASES; //Comando para visualizar bancos
DROP DATABASE banco_o14;*/

CREATE DATABASE IF NOT EXISTS banco_o14;
USE banco_o14;

CREATE TABLE bairro(
    cod_bairro INT AUTO_INCREMENT,
    nome_bairro VARCHAR(45) NOT NULL,
    PRIMARY KEY(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE gerente(
    cod_gerente   INT auto_increment,
    nome_gerente  VARCHAR(45),
    bairro_gerente INT,
    PRIMARY KEY(cod_gerente),
    FOREIGN KEY(bairro_gerente) REFERENCES bairro(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE tipo_conta(
    conta INT,
    tipo_conta VARCHAR(55),
    PRIMARY KEY(conta)  
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE tipo_transacao(
    cod_operacao INT,
    nome_operacao VARCHAR(50),
    PRIMARY KEY(cod_operacao)    
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE usuario(
    cod_usuario INT AUTO_INCREMENT,
    nome_usuario VARCHAR(45) NOT NULL,
    bairro_usuario INT NOT NULL,
    email_usuario VARCHAR(115);
    senha VARCHAR();
    PRIMARY KEY(cod_usuario),
    FOREIGN KEY(bairro_usuario) REFERENCES bairro(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(45) NOT NULL,
    bairro_cliente INT,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY (bairro_cliente) REFERENCES bairro(cod_bairro)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE agencia(
    num_agencia INT AUTO_INCREMENT,
    gerente_agencia INT,
    PRIMARY KEY(num_agencia),
    FOREIGN KEY (gerente_agencia) REFERENCES gerente(cod_gerente)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE conta(
    num_conta INT AUTO_INCREMENT,
    cliente_conta INT,
    tipo_conta INT,
    agencia_conta INT,
    saldo_conta	DOUBLE NOT NULL,
    PRIMARY KEY (num_conta),
    FOREIGN KEY (cliente_conta) REFERENCES cliente(id_cliente),
    FOREIGN KEY (tipo_conta) REFERENCES tipo_conta(conta),
    FOREIGN KEY (agencia_conta) REFERENCES agencia(num_agencia)    
)ENGINE=innoDB DEFAULT CHARSET=utf8;

CREATE TABLE conta_transacao(
    cod_transacao INT AUTO_INCREMENT,
    fk_cod_transacao INT,
    conta_transacao 	INT,
    valor DOUBLE NOT NULL,
    PRIMARY KEY (cod_transacao),
    FOREIGN KEY (conta_transacao) REFERENCES conta(num_conta),
    FOREIGN KEY (fk_cod_transacao) REFERENCES tipo_transacao(cod_operacao)
)ENGINE=innoDB DEFAULT CHARSET=utf8;

    INSERT INTO bairro(nome_bairro) VALUES ('Asa sul'),('Asa norte'),('Lago sul'),('Lago norte');

    INSERT INTO tipo_transacao(tipo_transacao) VALUES ('deposito'),('saque');

    INSERT INTO agencia(gerente_agencia) VALUES (1),(2),(1),(3);

    INSERT INTO gerente(nome_gerente,bairro_gerente) VALUES ('Gilson da Americanas',1),('Mauricio da Ambev',3),
                ('Silvio da IBM',1),('Davison do BB',2),('Davison do BB',4),('Ruan da caixa',1);

    INSERT INTO cliente(nome_cliente,bairro_cliente) VALUES ('Gilson da Americanas',1),('Mauricio da Ambev',3),
                ('Silvio da IBM',1),('Davison do BB',2),('Davison do BB',4),('Ruan da caixa',1);

    INSERT INTO usuario(nome_usuario,bairro_usuario) VALUES ('Oto',2),('Anna',4),('Gorety',1),('Odety',1);

    SELECT nome_usuario, nome_bairro FROM usuario INNER JOIN bairro ON bairro_usuario=cod_bairro;

    SELECT * FROM bairro;

    ALTER TABLE gerente ADD bairro_gerente INT;

/*Verificar comondo modify*/

    RENAME TABLE transacao TO conta_transacao;

    ALTER TABLE gerente MODIFY nome_gerente NOT NULL;

    ALTER TABLE tipo_transacao MODIFY transacao INT AUTO;

    ALTER TABLE tipo_transacao CHANGE tipo_transacao nome_operacao VARCHAR(50);

    ALTER TABLE tipo_transacao DROP INDEX cod_operacao;

    ALTER TABLE gerente ADD FOREIGN KEY (bairro_gerente) REFERENCES bairro(cod_bairro);

    SELECT c.nome_gerente, b.nome_bairro FROM gerente c 
    INNER JOIN bairro b ON c.bairro_gerente=b.cod_bairro;

    SELECT a.num_agencia, g.nome_gerente FROM agencia a 
    INNER JOIN gerente g ON g.cod_gerente=a.gerente_agencia;

    INSERT INTO tipo_conta(conta,tipo_conta) VALUES (5001,"Conta corrente"),(5051,"Poupança"),(6001,"Investimento");

    INSERT INTO tipo_transacao(cod_operacao,nome_operacao) VALUES (5586,'Deposito'),(4586,'Saque');

    INSERT INTO agencia(gerente_agencia) VALUES (1),(2),(1),(3);
    
    INSERT INTO cliente(nome_cliente,bairro_cliente) VALUES ('Gilson da Americanas',1), ('Mauricio da Ambev',3),
    ('Silvio da IBM',1),('Davidson do BB',2),('Ruan da caixa',1);

    INSERT INTO conta(cliente_conta,tipo_conta,agencia_conta) VALUES (1,5001,1),(2,5001,2),
    (3,5001,1),(4,5001,2),(5,5001,4);

    INSERT INTO conta_transacao(fk_cod_transacao,conta_transacao,valor) VALUES (5586,19,500),(5586,20,1300),
    (4586,21,300),(4586,22,200),(5586,23,1500);

    SELECT c.nome_cliente, sum(s.valor) AS saldo FROM cliente c
    INNER JOIN conta o ON o.cliente_conta=c.id_cliente
    INNER JOIN conta_transacao s ON s.conta_transacao=o.num_conta
    GROUP BY c.nome_cliente;

    SELECT c.nome_cliente, s.valor FROM cliente c
    INNER JOIN conta o ON o.cliente_conta=id_cliente
    INNER JOIN conta_transacao s ON s.conta_transacao=o.