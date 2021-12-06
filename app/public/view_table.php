<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Consulta</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>

<body>
    <section class="section">
        <div class="container">
            <h1 class="title">
                Trabalho de Base de Dados 2
            </h1>
            <h2 class="subtitle">
                Para consultar selecione os filtros e clique em buscar.
            </h2>
        </div>
        <!-- FORM DE FILTRO AQUI -->
        <table class="table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Idade</th>
                    <th>CPF</th>
                    <th>Data de Início</th>
                    <th>Cargo</th>
                    <th>Data de Nascimento</th>
                </tr>
            </thead>
            <tbody>
                <?php
                //form que redireciona para essa pagina
                //usa tag php para checar se ha filtros
                // verifica se tá empty, se não tiver, clausula where usando filtro, else sem filtro
                // $conex1 = pg_connect("host=localhost port=5432 dbname=pauload user=postgres password=changeme");
                // pg_close($conex1);
                // echo "Conexão realizada com sucesso!";
                $data = [[
                    'nome' => 'Thiago',
                    'sobrenome' => 'Goveia',
                    'idade' => '29',
                    'cpf' => '1111111111',
                    'data_inicio' => '05/07/2021',
                    'cargo' => 'Adm',
                    'data_nascimento' => '05/07/1992'
                ]];

                foreach ($data as $row) {
                    echo '<tr>';
                    echo '<td>' . $row['nome'] . '</td>';
                    echo '<td>' . $row['sobrenome'] . '</td>';
                    echo '<td>' . $row['idade'] . '</td>';
                    echo '<td>' . $row['cpf'] . '</td>';
                    echo '<td>' . $row['data_inicio'] . '</td>';
                    echo '<td>' . $row['cargo'] . '</td>';
                    echo '<td>' . $row['data_nascimento'] . '</td>';
                    echo '</tr>';
                }
                ?>
            </tbody>
        </table>

</body>

</html>