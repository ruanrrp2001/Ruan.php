<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../estilo/geral.css">
    <title>Banco_o14</title>
</head>
<body>
        <form method="post" action="../controle/atualizar_bairro.php">
        <fieldset><legend><h3>ATUALIZAR BAIRRO<h3></legends>
        <label>Escolha o bairro a ser atualizado</label><br><br>
        <?php require_once("../modulo/select_bairro.php");?><br><br>
        <label>Digite um novo nome para o bairro</label><br><br>
        <input type="text" name="txt_bairro"><br><br>
        <input type="submit" value="Atualizar"><br>
</fieldset></form>

</body>
</html>