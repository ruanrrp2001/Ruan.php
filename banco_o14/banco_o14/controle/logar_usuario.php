<?php
include("conexão.php");
$conn = conectar();

try{
    session_start();
    $user = $_POST["txt_user"];
    $pass = md5($_POST["txt_pass"]);

    $sql = ("SELECT * FROM usuario where nome_usuario ='$user'");

    foreach ($conn->query ($sql) as $row) {
        $usuario = $row['nome_usuario'];
        $senha = $row['senha'];
    }
    if($usuario == $user and $pass == md5($senha)) {
    $_SESSION['usuario'] = $user;
    $_SESSION['senha'] = $pass;
    echo'
    <script>
    alert("Acesso liberado!");
    window.location.href = "../banco_o14/index.html";
    </script>
    ';
    } else {
        unset ($_SESSION['$user']);
        unset ($_SESSION['$pass']);
        echo '<script'
        alert("Acesso não liberado, tente novamente!");
        window.location.herf = "../formulario/loguin.php";
        </script>
        ';
}
    }catch(PDOException $ex_){
        echo 'Erro'.$ex_->getMenssage();
    }
    ?>