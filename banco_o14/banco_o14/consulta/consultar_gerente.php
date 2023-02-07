<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>banco_o14</title>
</head>
<body>
    <h1>Gerente</h1>
        <div class="flex-container">
        <div id="box">
            <fieldset>
                <table border="1"><tr><th width="50%">Gerentes</th><th>bairros</th></tr>
                    <?php
                    include("../controle/conexao.php");
                    $conn = conectar();
                    $gerente = $_POST['txt_gerente'];
                    try{
                        $sql = "SELECT g.nome_gerente, b.nome_bairro FROM gerente g
                        INNER JOIN bairro b ON g.bairro_gerente=b.cod_bairro WHERE g.nome_gerente like '%$gerente%'";
                        foreach ($conn->query($sql) as $row){
                            print "<tr><td>".$row['nome_gerente']."</td>
                            <td>".$row['nome_bairro']."</td></tr>";
                        }
                    }catch(PDOException $ex){
                        echo 'Erro'.$ex->getMessage();
                    }
                    ?></table><br><a href='banco_o14'>Voltar</a></fieldset></div></div></body></html>