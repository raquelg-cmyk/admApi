<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Inclui a conexão existente
require_once 'conexao.php';
$con->set_charset("utf8");

// Decode JSON input (se necessário para futuras expansões)
json_decode(file_get_contents('php://input'), true);

// SQL atualizado com JOIN entre 'material' e 'tipomaterial'
$sql = "SELECT 	
            m.dtEntrada,
            m.idMaterial,
            t.deUnidadeMedida,	
            m.qtMaterial, 
            t.idTipoMaterial
        FROM material m
        JOIN tipomaterial t ON t.idTipoMaterial = m.idTipoMaterial";

$result = $con->query($sql);

$response = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $response[] = $row;
    }
} else {
    // Retorno padrão vazio respeitando a nova estrutura de colunas
    $response[] = [
        "dtEntrada" => "0000-00-00",
        "idMaterial" => 0,
        "deUnidadeMedida" => "",
        "qtMaterial" => 0.00,
        "idTipoMaterial" => 0
    ];
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($response, JSON_UNESCAPED_UNICODE);

$con->close();
?>