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
    "host = db
    port = 5432  
    dbname = evento  
    user = evento
    password = evento"
) or die (
    "Falha na conexão!".pg_last_error()
);

$queryResult = pg_exec(
    $dbconnect,
    $insertQuery
);