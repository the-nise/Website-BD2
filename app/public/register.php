<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro</title>
    <link rel="stylesheet" href="/bulma.css">
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
                <input class="input" name="nome" type="text" required>
                <label class="label" for="sobrenome">Sobrenome</label><br>
                <input class="input" name="sobrenome" type="text" required>
                <label class="label" for="idade">Idade</label><br>
                <input class="input" name="idade" type="number" required>
                <label class="label" for="cpf">CPF</label><br>
                <input class="input" name="cpf" type="text" required>
                <label class="label" for="data_ini">Data de início</label><br>
                <input class="input" name="data_ini" type="text" required>
                <label class="label" for="data_nasc">Data de nascimento</label><br>
                <input class="input" name="data_nasc" type="text" required><br>
                <label for="" class="label">Selecione seu cargo:</label>
                <div class="control">
                    <label class="radio">
                        <input id="Lojista" type="radio" value="isLogista" name="cargo">
                        Lojista
                    </label>
                    <label class="radio">
                        <input id="Despachante" type="radio" value="isDespachante" name="cargo">
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
                <div id="Colete">
                <label class="label">Tamanho do Colete Corretor de Postura</label><br>
                <input class="input" name="tamanhoColeteCorretorDePostura" type="text"><br>
                </div>
                <div id="Formacao">
                <label class="label">Formação</label><br>
                <input class="input" name="formacao" type="text"><br>
                </div>
                <div id="Polo">
                <label class="label">Id Região</label><br>
                <input class="input" name="idRegiao" type="text"><br>
                <label class="label">Seq Polo</label><br>
                <input class="input" name="seqPolo" type="text"><br>
                </div>
                <button class="button is-primary" type="submit">Salvar</button>
                <a href='index.php' class="button is-link is-outlined">Retornar</a>
            </form>
        </div>
    </section>
    <script>
        var Colete = document.getElementById("Colete");
        var Formacao = document.getElementById("Formacao");
        var Polo = document.getElementById("Polo");

        Polo.style.display = 'none';
        Formacao.style.display = 'none';
        Colete.style.display = 'none';

        document.body.addEventListener('change', function(evt)
        {
            console.log(evt);
            switch(evt.target.id)
            {
                case "Lojista":
                    Polo.style.display = 'block';
                    Formacao.style.display = 'block';
                    Colete.style.display = 'none';
                    break;
                case "Despachante":
                    Polo.style.display = 'block';
                    Colete.style.display = 'block';
                    Formacao.style.display = 'none';
                    break;
                default:
                    if(evt.target.defaultValue == "isAdmPolo" || evt.target.defaultValue == "isAdmRegiao" || evt.target.defaultValue == "isAdmEmpresa")
                    {
                        Polo.style.display = 'none';
                        Formacao.style.display = 'none';
                        Colete.style.display = 'none';
                    }
                    break;
            }
        });
    </script>
</body>

</html>