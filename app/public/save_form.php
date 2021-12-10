<?php

$nome = $_POST['nome'];
$sobrenome = $_POST['sobrenome'];
$idade = $_POST['idade'];
$cpf = $_POST['cpf'];
$data_ini = $_POST['data_ini'];
$data_nasc = $_POST['data_nasc'];
$cargo = $_POST['cargo'];
$isLogista = ($cargo == 'isLogista') ? 1 : 0;
$isDespachante = ($cargo == 'isDespachante') ? 1 : 0;
$isAdmPolo = ($cargo == 'isAdmPolo') ? 1 : 0;
$isAdmRegiao = ($cargo == 'isAdmRegiao') ? 1 : 0;
$isAdmEmpresa = ($cargo == 'isAdmEmpresa') ? 1 : 0;
$tamanhoColeteCorretorDePostura = $_POST["tamanhoColeteCorretorDePostura"];
$formacao = $_POST["formacao"];
$idRegiao = $_POST["idRegiao"];
$seqPolo = $_POST["seqPolo"];

$insertQuery =
    "INSERT INTO
        usuario 
            (nome, 
            sobrenome, 
            idade, 
            CPf, 
            dat_ini, 
            isLogista, 
            isDespachante, 
            isAdmPolo, 
            isAdmRegiao, 
            isAdmEmpresa, 
            DATA_NASC)
        VALUES 
            ('$nome',
             '$sobrenome',
             '$idade', 
             '$cpf', 
             '$data_ini', 
             '$isLogista', 
             '$isDespachante', 
             '$isAdmPolo', 
             '$isAdmRegiao', 
             '$isAdmEmpresa', 
             '$data_nasc'
            )";

$dbconnect = pg_connect (
    "host = 192.168.122.58
    port = 5432  
    dbname = distrib  
    user = bccibm21g3
    password = 5100"
) or die (
    "Falha na conexão!".pg_last_error()
);

$queryResult = pg_exec(
    $dbconnect,
    $insertQuery
);

$queryResult = pg_exec(
    $dbconnect,
    "SELECT * FROM Usuario WHERE CPf = '" . $cpf . "';"
);

$id = pg_fetch_array($queryResult, 0)["idusuario"];

pg_close($dbconnect);
if($isLogista == 1)
{
    $insertQuery = 
    "INSERT INTO 
        lojista
            (Usuario_idUsuario,
            loja_polo_regiao_idregiao, 
            loja_polo_secPolo)
        VALUES
            ('$id',
            '$idRegiao',
            '$seqPolo');
    INSERT INTO
        curriculo
            (formacao, 
            lojista_Usuario_idUsuario)
        VALUES
            ('$formacao',
            '$id');

    ";
}
elseif($isDespachante == 1)
{
    $insertQuery =
    "INSERT INTO
        despachante
            (Usuario_idUsuario,
            polo_regiao_idregiao,
            polo_secPolo,
            tamanhoColeteCorretorDePostura)
        VALUES
            ('$id', 
            '$idRegiao',
            '$seqPolo',
            '$tamanhoColeteCorretorDePostura');
    ";
}

if($isLogista || $isDespachante)
{
    $queryResult = pg_exec(
        $dbconnect,
        $insertQuery
    );
}

header("Location: /register.php");
exit();
