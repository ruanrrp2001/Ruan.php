<?php
include("conexao.php");
$conn = conectar();
try{
    $bairro = $POST['cbx_bairro'];
    if(isset($bairro)){
        $stm = $conn->prepare("DELETE FROM bairro WHERE cod_bairro=?");
        $stm->bindValue(1,$bairro,PDO::PARAM_STR);
        $stm->execute();
        echo'
        <script>
        alert("Registro excluido com sucesso!");
        window.location.href = "../index.html";
        </script>
        ';
    }
}catch(PDOException $ex_){
    echo 'Erro'. $ex_->getMessage();
}
?>