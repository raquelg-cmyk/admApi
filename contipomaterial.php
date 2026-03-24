<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Inclui a conexão existente
require_once 'conexao.php';
$con->set_charset("utf8");

// SQL simplificado: apenas a tabela tipomaterial
$sql = "SELECT 
            idTipoMaterial, 
            deTipoMaterial, 
            deUnidadeMedida, 
            deLocalEstoque 
        FROM tipomaterial";

$result = $con->query($sql);

$response = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $response[] = $row;
    }
} else {
    // Retorno padrão vazio caso a tabela esteja limpa
    $response[] = [
        "idTipoMaterial" => 0,
        "deTipoMaterial" => "Nenhum registro encontrado",
        "deUnidadeMedida" => "",
        "deLocalEstoque" => ""
    ];
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($response, JSON_UNESCAPED_UNICODE);

$con->close();
?>