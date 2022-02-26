# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

abelha_rainha = Project.create(name: "Padaria Abelha Rainha (Duarte)")
farmacorp = Project.create(name: "Farmácia Farmacorp (Duarte)")
saturno_team = Team.create(name: "Saturno (Duarte)", project: abelha_rainha)
venus_team = Team.create(name: "Venus (Duarte)", project: farmacorp)

abelha_rainha_carla = Project.create(name: "Padaria Abelha Rainha (Carla)")
farmacorp_carla = Project.create(name: "Farmácia Farmacorp (Carla)")
saturno_team_carla = Team.create(name: "Saturno (Carla)", project: abelha_rainha_carla)
venus_team_carla = Team.create(name: "Venus (Carla)", project: farmacorp_carla)

Developer.create(email: ENV['gmail_username'], password: "123123", admin: true)
Developer.create(email: "duartefellipe@gmail.com", password: "123123", admin: true)
Developer.create(email: "anderson@teste.com", password: "123123", admin: false, team: saturno_team)
Developer.create(email: "rodrigo@teste.com", password: "123123", admin: false, team: venus_team)
Developer.create(email: "fernando@teste.com", password: "123123", admin: false, team: venus_team)

# primeira action
newAcao = Acao.create(nome: 'VenderProdutos', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "erro mais simples", project: abelha_rainha)
newView = newExc.create_http(view_referer: "https://abelharainha.com/vendas", view_method: "post", view_url: "https://sistemaabelharainha.com/vendas")
newPar = newExc.parametros.create(param_tipo: "float", param_nome: "valor")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "quantidade")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# primeira action
newAcao = Acao.create(nome: 'VenderProdutos', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "erro mais crítico", project: abelha_rainha)
newView = newExc.create_http(view_referer: "https://abelharainha.com/vendas", view_method: "post", view_url: "https://sistemaabelharainha.com/vendas")
newPar = newExc.parametros.create(param_tipo: "float", param_nome: "valor")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "quantidade")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# segunda action
newAcao = Acao.create(nome: 'CadastrarCliente', classe: 'Cliente')
newExc = newAcao.excecaos.create(error: "Não foi possível cadastrar o cliente", project: farmacorp)
newView = newExc.create_http(view_referer: "https://farmacorp.com/cliente", view_method: "post", view_url: "https://sistemafarmacorp.com/cliente")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "email")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "nome")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "cpf")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# terceira action
newAcao = Acao.create(nome: 'VenderProdutos', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "Não foi possível vender o produto", project: abelha_rainha)
newView = newExc.create_http(view_referer: "https://farmacorp.com/vendas", view_method: "post", view_url: "https://sistemafarmacorp.com/vendas")
newPar = newExc.parametros.create(param_tipo: "float", param_nome: "valor")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "quantidade")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# segunda action
newAcao = Acao.create(nome: 'CadastrarProduto', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "Não foi possível cadastrar o produto", project: farmacorp)
newView = newExc.create_http(view_referer: "https://farmacorp.com/produto", view_method: "post", view_url: "https://sistemafarmacorp.com/produto")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "nome")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "receita")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# primeira action
newAcao = Acao.create(nome: 'VenderProdutos', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "erro mais simples", project: abelha_rainha_carla)
newView = newExc.create_http(view_referer: "https://abelharainha.com/vendas", view_method: "post", view_url: "https://sistemaabelharainha.com/vendas")
newPar = newExc.parametros.create(param_tipo: "float", param_nome: "valor")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "quantidade")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# primeira action
newAcao = Acao.create(nome: 'VenderProdutos', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "erro mais crítico", project: abelha_rainha_carla)
newView = newExc.create_http(view_referer: "https://abelharainha.com/vendas", view_method: "post", view_url: "https://sistemaabelharainha.com/vendas")
newPar = newExc.parametros.create(param_tipo: "float", param_nome: "valor")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "quantidade")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# segunda action
newAcao = Acao.create(nome: 'CadastrarCliente', classe: 'Cliente')
newExc = newAcao.excecaos.create(error: "Não foi possível cadastrar o cliente", project: farmacorp_carla)
newView = newExc.create_http(view_referer: "https://farmacorp.com/cliente", view_method: "post", view_url: "https://sistemafarmacorp.com/cliente")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "email")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "nome")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "cpf")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# terceira action
newAcao = Acao.create(nome: 'VenderProdutos', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "Não foi possível vender o produto", project: abelha_rainha_carla)
newView = newExc.create_http(view_referer: "https://farmacorp.com/vendas", view_method: "post", view_url: "https://sistemafarmacorp.com/vendas")
newPar = newExc.parametros.create(param_tipo: "float", param_nome: "valor")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "quantidade")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")

# segunda action
newAcao = Acao.create(nome: 'CadastrarProduto', classe: 'Produto')
newExc = newAcao.excecaos.create(error: "Não foi possível cadastrar o produto", project: farmacorp_carla)
newView = newExc.create_http(view_referer: "https://farmacorp.com/produto", view_method: "post", view_url: "https://sistemafarmacorp.com/produto")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "nome")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "codigo")
newPar = newExc.parametros.create(param_tipo: "string", param_nome: "receita")
newSess = newExc.create_sessao
newObj = newSess.create_obj_sessao(obj_text: "HTTP/1.1 200 OK
Content-Type: application/javascript
Cache-Control: public, max-age=31536000
X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
X-Runtime: 0.005849
Content-Length: 27512
")