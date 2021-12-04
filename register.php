<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>

<body>
    <section class="section">
        <div class="container">
            <h1 class="title">
                Trabalho de Base de Dados 2
            </h1>
            <h2 class="subtitle">
                Cadastro de Usuário
            </h2>
            <form method="post" action="save_form.php">
                <label class="label" for="nome">Nome</label><br>
                <input class="input" name="nome" type="text">
                <label class="label" for="sobrenome">Sobrenome</label><br>
                <input class="input" name="sobrenome" type="text">
                <label class="label" for="idade">Idade</label><br>
                <input class="input" name="idade" type="number">
                <label class="label" for="cpf">CPF</label><br>
                <input class="input" name="cpf" type="text">
                <label class="label" for="data_ini">Data de início</label><br>
                <input class="input" name="data_ini" type="text">
                <label class="label" for="data_nasc">Data de nascimento</label><br>
                <input class="input" name="data_nasc" type="text"><br>
                <label for="" class="label">Selecione seu cargo:</label>
                <div class="control">
                    <label class="radio">
                        <input type="radio" value="isLogista" name="cargo">
                        Lojista
                    </label>
                    <label class="radio">
                        <input type="radio" value="isDespachante" name="cargo">
                        Despachante
                    </label>
                    <label class="radio">
                        <input type="radio" value="isAdmPolo" name="cargo">
                        Administrador de Polo
                    </label>
                    <label class="radio">
                        <input type="radio" value="isAdmRegiao" name="cargo">
                        Administrador de Região
                    </label>
                    <label class="radio">
                        <input type="radio" value="isAdmEmpresa" name="cargo">
                        Administrador da Empresa
                    </label>
                </div>
                <button class="button is-primary" type="submit">Salvar</button>
            </form>
        </div>
    </section>

</body>

</html>