<?php
include("conexao.php");
$conn = conectar();

$user = $_POST['txt_user'];
$bairro = $_POST['cbx_bairro'];
$mail = $_POST['txt_mail'];
$pass = md5($_POST['txt_pass']);
$conf = md5($_POST['txt_conf']);
try{
if($pass<>$conf){
    echo '<script>
    alert("senhas não conferem, Usuário não cadastrado");
    window.location.href = "../formulario/cad_usuario.php";
    </script>';
}else{
    $sql = ("INSERT INTO usuario(nome_usuario,bairro_usuario,senha,email)VALUES (?,?,?,?)");
    $stm = $conn->prepare($sql);
    $stm->bindvalue(1,$user,PDO::PARAM_STR);
    $stm->bindvalue(2,$bairro,PDO::PARAM_STR);
    $stm->bindvalue(3,$pass,PDO::PARAM_STR);
    $stm->bindvalue(4,$mail,PDO::PARAM_STR);
    $stm->execute();
    echo'<script>
    alert("registro salvo com sucesso!");
    window.location.href = "../formulario/cad_usuario.php";
    </script>';
}
}catch(PDOException $ex_){
    echo 'erro' . $ex_->getMessage();
}
?>
