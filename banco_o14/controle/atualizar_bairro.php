<?php
include("conexao.php");
$conn = conectar();

try{
    $cod_bairro = $_POST['cbx_bairro'];
    $up_bairro = $_POST['txt_bairro'];

    $sql = "UPDATE bairro SET nome_bairro=? WHERE cod_bairro=$cod_bairro";
    $stmt = $conn->prepare($sql);
    $stmt->bindvalue(1,$up_bairro,PDO::PARAM_STR);
    $stmt->execute();
    echo'<script>
    alert("Registro salvo com sucesso!");
    window.location.href = "../index.html";
    </script>';
}catch(PDOException $ex){
    echo 'chama o gilson,gilson, chama a policia!!!'.$ex->getMessage();
}
?>