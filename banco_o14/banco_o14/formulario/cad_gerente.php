<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>banco_o14</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <form method="post" action="../controle/inserir_gerente.php">
        <fieldset>
            <legend><h3>Cadastro de gerente</h3></legend>
            <label>Nome do gerente: </label>
            <input type="text" name="txt_gerente" required><br>
            <label>Bairro do gerente: </label>
            <?php require_once ("../modulo/select_bairro.php");?><br>
            <input type="submit" value="Cadastrar">
</fildset>
</body>
</html>