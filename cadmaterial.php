<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Define o tipo de conteúdo como JSON
header('Content-Type: application/json');

// Inclui a conexão com o banco (certifique-se que o arquivo existe)
require_once 'conexao.php';
$con->set_charset("utf8");

// Obtém os dados JSON enviados no corpo da requisição
$jsonParam = json_decode(file_get_contents('php://input'), true);

if (!$jsonParam) {
    echo json_encode(['success' => false, 'message' => 'Dados JSON inválidos ou ausentes.']);
    exit;
}

// Extrai e valida os dados de acordo com a tabela 'material'
$deEspecificacao = trim($jsonParam['deEspecificacao'] ?? '');
$qtMaterial      = floatval($jsonParam['qtMaterial'] ?? 0);
$dtEntrada       = !empty($jsonParam['dtEntrada']) ? date('Y-m-d', strtotime($jsonParam['dtEntrada'])) : date('Y-m-d');
$idTipoMaterial  = intval($jsonParam['idTipoMaterial'] ?? 0);

// Validação simples de campos obrigatórios
if (empty($deEspecificacao) || $idTipoMaterial <= 0) {
    echo json_encode(['success' => false, 'message' => 'Especificação e Tipo de Material são obrigatórios.']);
    exit;
}

// Prepara a consulta SQL
$stmt = $con->prepare("
    INSERT INTO material (deEspecificacao, qtMaterial, dtEntrada, idTipoMaterial)
    VALUES (?, ?, ?, ?)
");

if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Erro ao preparar a consulta: ' . $con->error]);
    exit;
}

// "d" para decimal/double, "s" para string, "i" para inteiro
$stmt->bind_param("sdsi", $deEspecificacao, $qtMaterial, $dtEntrada, $idTipoMaterial);

// Executa e retorna o resultado
if ($stmt->execute()) {
    echo json_encode([
        'success' => true, 
        'message' => 'Material inserido com sucesso!',
        'idGerado' => $stmt->insert_id
    ]);
} else {
    echo json_encode(['success' => false, 'message' => 'Erro ao registrar material: ' . $stmt->error]);
}

$stmt->close();
$con->close();

?>