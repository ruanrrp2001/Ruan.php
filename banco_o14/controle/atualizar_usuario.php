
<?php
include("conexao.php");
$conn = conectar();

try{
    $cod_usuario = $_POST['cbx_usuario'];
    $up_usuario = $_POST['txt_usuario'];
    $up_email = $_POST['txt_email'];

    $sql = "UPDATE usuario SET nome_usuario=?, email=? WHERE cod_usuario=$cod_usuario";
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(1,$up_usuario,PDO::PARAM_STR);
    $stmt->bindValue(2,$up_email,PDO::PARAM_STR);
    $stmt->execute();
    echo'<script>
    alert("Registro salvo com sucesso!");
    window.location.href = "../index.html";
    </script>';
}catch(PDOException $ex){
    echo 'chama o gilson,gilson, chama a policia!!!'.$ex->getMessage();
}
?>