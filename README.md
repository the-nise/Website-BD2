rodar `docker-compose up` e show

conectar ao banco com datagrip ou qlqr outra coisa
usando as credenciais descritas no docker-compose.yml
rodar migrations na ordem:

1. define_eventos
2. init_usuarios
3. outros (menos o drop)


conexoes ao banco no codigo devem fazer referencia ao container do banco (alterar antes de subir pro cacto).