<?php
include("conexao.php");
$conn = conectar();
try{
    $gerente = $_POST["txt_gerente"];
    $bairro = $_POST["cbx_bairro"];
    if(isset ($gerente)){
        $stmt = $conn->prepare("INSERT INTO gerente(nome_gerente,bairro_gerente)VALUES(?,?");
        $stmt->bindvalue(1,$gerente,PDO :: PARAM_STR);
        $stmt->bindvalue(2,$bairro, PDO :: PARAM_STR);
        $stmt->execute();
    }
    echo'<script>
    alert("Registro salvo com Sucesso");
    window.location.HREF = "../formulario/cad_gerente.php";
    </script>';

    }
}