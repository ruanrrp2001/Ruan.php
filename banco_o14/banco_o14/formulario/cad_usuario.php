<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banco o14</title>
</head>
<body>
    <h3>CADASTRO DE USUARIO</h3>
    <form method="post" action="../controle/inserir_usuario.php">
        <fieldset>
            <legend><h3>CADASTRO DE USUARIO</h3></legend>
            <label>Usuário:</label><br><input type="text" name="txt_user" required><br>
            <label>Bairro:</label><br><?php require_once ("../modulo/select_bairro.php");?><br>
            <label>E-mail:</label><br><input type="email" name="txt_mail" required><br>
            <label>Senha:</label><br><input type="password" name="txt_pass" required><br>
            <label>Confirmar senha:</label><br><input type="password" name="txt_conf" required><br><br>
                <input type="submit" value="cadastrar"><br>
</fieldset></form></body></html>
