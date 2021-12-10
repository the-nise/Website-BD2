<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Consulta</title>
    <link rel="stylesheet" href="/bulma.css">
</head>

<body>
    <section class="section">
        <div class="container">
            <h1 class="title">
                Trabalho de Base de Dados 2
            </h1>
            <h2 class="subtitle">
                Para consultar, preencha os filtros desejados e clique em buscar.
            </h2>
        </div>
        <!-- FORM DE FILTRO AQUI -->
        <br>
        <br>
        <form class="columns" method="GET" action="">
            <div class="column">
            <label class="label" >Nome</label>
            <input class="input" name="Nome" type="text" placeholder="Nome">
            <label class="label">Sobrenome</label>
            <input class="input" name="Sobrenome" type="text" placeholder="Sobrenome">
            <label class="label">Idade</label>
            <input class="input" name="Idade" type="text" placeholder="Idade">
            <label class="label">CPF</label>
            <input class="input" name="CPF" type="text" placeholder="CPF">
            </div>
            <div class="column">
            
            <label class="label">Data de Início</label>
            <input class="input" name="Data_de_inicio" type="text" placeholder="Data de Início">
            <label class="label">Cargo</label>
            <select class="select" name="Cargo">
                <option value="">Não selecionado</option>
                <option value="isLojista">Lojista</option>
                <option value="isDespachante">Despachante</option>
                <option value="isAdmPolo">Administrador Polo</option>
                <option value="isAdmRegiao">Administrador Região</option>
                <option value="isAdmEmpresa">Administrador da Empresa</option>
            </select>
            <br>
            <label class="label">Data de Nascimento</label>
            
            <input class="input" name="Data_de_nasc" type="text" placeholder="Data de Nascimento">
            <br>
            <br>
            <button class="button is-success" type="submit">
               
            Filtrar
            </button>
            <a href='index.php' class="button is-link is-outlined">Retornar</a>
            </div>
            
        </form>
        

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

                $filter = [];
                $sql = [];

                if(count($_GET) != 0)
                {
                    if($_GET["Nome"] != NULL)
                    {
                        array_push($filter, $_GET["Nome"]);
                        array_push($sql, "nome");
                    }
                    if($_GET["Sobrenome"] != NULL)
                    {
                        array_push($filter, $_GET["Sobrenome"]);
                        array_push($sql, "sobrenome");
                    }
                    if($_GET["Idade"] != NULL)
                    {
                        array_push($filter, $_GET["Idade"]);
                        array_push($sql, "idade");
                    }
                    if($_GET["CPF"] != NULL)
                    {
                        array_push($filter, $_GET["CPF"]);
                        array_push($sql, "CPf");
                    }
                    if($_GET["Data_de_inicio"] != NULL)
                    {
                        array_push($filter, $_GET["Data_de_inicio"]);
                        array_push($sql, "dat_ini");
                    }
                    if(array_key_exists("Cargo", $_GET))
                    {
                        if($_GET["Cargo"] != NULL)
                        {
                            $stack = $_GET["Cargo"];
                            if($stack == "isLojista")
                            {
                                $stack = "isLogista";
                            }
                            array_push($filter, true);
                            array_push($sql, $stack);
                        }
                        
                    }
                    if($_GET["Data_de_nasc"] != NULL)
                    {
                        array_push($filter, $_GET["Data_de_nasc"]);
                        array_push($sql, "DATA_NASC");
                    }
                }

                $dbconnect = pg_connect (
                    "host = 192.168.122.58
                    port = 5432  
                    dbname = distrib  
                    user = bccibm21g3
                    password = 5100"
                ) or die (
                    "Falha na conexão!".pg_last_error()
                );
                
               

                if(count($filter) != 0)
                {
                    $filterQuery = "SELECT * FROM Usuario WHERE ";

                    for($i = 0; $i < count($filter) - 1; $i++) {
                        $filterQuery .= $sql[$i]  . " = '" . $filter[$i] . "'";
                        $filterQuery .= " AND ";
                    }
                    $filterQuery .= $sql[count($filter) - 1]  . " = '" . $filter[count($filter) - 1] . "'";
                    $filterQuery .= ";";
                }
                else
                {
                    $filterQuery = "SELECT * FROM Usuario;";
                }

                $result = pg_exec(
                    $dbconnect,
                    $filterQuery
                );
                //se nao ha nada no data, retornar "nenhum resulto correspondente"
                $data = pg_fetch_all($result);

                pg_close($dbconnect);


                //echo implode("|", array_keys($data[0]));

                for ($i = 0; $i < count($data); $i ++) {
                    echo '<tr>';
                    echo '<td>' . $data[$i]['nome'] . '</td>';
                    echo '<td>' . $data[$i]['sobrenome'] . '</td>';
                    echo '<td>' . $data[$i]['idade'] . '</td>';
                    echo '<td>' . $data[$i]['cpf'] . '</td>';
                    echo '<td>' . $data[$i]['dat_ini'] . '</td>';

                    if($data[$i]['islogista'] == 't')
                    {
                        echo '<td>' . "Lojista" . '</td>';
                    }
                    elseif($data[$i]['isdespachante'] == 't')
                    {
                        echo '<td>' . "Despachante" . '</td>';
                    }
                    elseif($data[$i]['isadmpolo'] == 't')
                    {
                        echo '<td>' . "Administrador do Polo" . '</td>';
                    }

                    elseif($data[$i]['isadmregiao'] == 't')
                    {
                        echo '<td>' . "Administrador da Região" . '</td>';
                    }

                    elseif($data[$i]['isadmempresa'] == 't')
                    {
                        echo '<td>' . "Administrador da Empresa" . '</td>';
                    }


                    echo '<td>' . $data[$i]['data_nasc'] . '</td>';
                    echo '</tr>';
                }
                ?>
            </tbody>
        </table>

</body>

</html>