abelha_rainha = Project.create(name: "Abelha Rainha")
farmacorp = Project.create(name: "Farmacorp")

saturno = Team.create(name: "Saturno", project: abelha_rainha)
venus = Team.create(name: "Venus", project: farmacorp)

Developer.create(email: ENV['gmail_username'], password: "123123", admin: true)
Developer.create(email: "duartefellipe@gmail.com", password: "123123", admin: true)
Developer.create(email: "anderson@teste.com", password: "123123", admin: false, team: saturno)
Developer.create(email: "rodrigo@teste.com", password: "123123", admin: false, team: venus)
Developer.create(email: "fernando@teste.com", password: "123123", admin: false, team: venus)

def create_new_exception( actionName:, actionClass:, exception:, project:, viewReferer:, viewMethod:, viewUrl:, params:, objText: )
  newAcao = Acao.create(nome: actionName, classe: actionClass)
  newExc = newAcao.excecaos.create(error: exception, project: project)
  newView = newExc.create_http(view_referer: viewReferer, view_method: viewMethod, view_url: viewUrl)
  params.each do |param|
    newPar = newExc.parametros.create(param_tipo: param[:tipo], param_nome: param[:name])
  end
  newSess = newExc.create_sessao
  newObj = newSess.create_obj_sessao(obj_text: objText)
end

# erro mais simples
create_new_exception({
  actionName: 'VenderProdutos',
  actionClass: 'Produto',
  exception: "erro mais simples",
  project: abelha_rainha,
  viewReferer: "https://abelharainha.com/vendas",
  viewMethod: "post",
  viewUrl: "https://sistemaabelharainha.com/vendas",
  params: [
    {
      tipo: "float",
      name: "valor",
    },
    {
      tipo: "string",
      name: "codigo",
    },
    {
      tipo: "string",
      name: "quantidade",
    },
  ],
  objText: "HTTP/1.1 200 OK
  Content-Type: application/javascript
  Cache-Control: public, max-age=31536000
  X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
  X-Runtime: 0.005849
  Content-Length: 27512
  "
})

# erro mais crítico
create_new_exception({
  actionName: 'VenderProdutos',
  actionClass: 'Produto',
  exception: "erro mais crítico",
  project: abelha_rainha,
  viewReferer: "https://abelharainha.com/vendas",
  viewMethod: "post",
  viewUrl: "https://sistemaabelharainha.com/vendas",
  params: [
    {
      tipo: "float",
      name: "valor",
    },
    {
      tipo: "string",
      name: "codigo",
    },
    {
      tipo: "string",
      name: "quantidade",
    },
  ],
  objText: "HTTP/1.1 200 OK
  Content-Type: application/javascript
  Cache-Control: public, max-age=31536000
  X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
  X-Runtime: 0.005849
  Content-Length: 27512
  "
})

# Não foi possível cadastrar usuário Ricardo
create_new_exception({
  actionName: 'CadastrarUsuário',
  actionClass: 'Usuário',
  exception: "Não foi possível cadastrar usuário Ricardo",
  project: farmacorp,
  viewReferer: "https://farmacorp.com/usuario",
  viewMethod: "post",
  viewUrl: "https://sistemafarmacorp.com/usuário",
  params: [
    {
      tipo: "string",
      name: "email",
    },
    {
      tipo: "string",
      name: "nome",
    },
    {
      tipo: "string",
      name: "cpf",
    },
  ],
  objText: "HTTP/1.1 200 OK
  Content-Type: application/javascript
  Cache-Control: public, max-age=31536000
  X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
  X-Runtime: 0.005849
  Content-Length: 27512
  "
})

# Não foi possível vender o produto
create_new_exception({
  actionName: 'VenderProdutos',
  actionClass: 'Produto',
  exception: "Não foi possível completar venda",
  project: farmacorp,
  viewReferer: "https://farmacorp.com/produto",
  viewMethod: "post",
  viewUrl: "https://sistemafarmacorp.com/produto",
  params: [
    {
      tipo: "string",
      name: "valor",
    },
    {
      tipo: "string",
      name: "codigo",
    },
    {
      tipo: "string",
      name: "quantidade",
    },
  ],
  objText: "HTTP/1.1 200 OK
  Content-Type: application/javascript
  Cache-Control: public, max-age=31536000
  X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
  X-Runtime: 0.005849
  Content-Length: 27512
  "
})


# Não foi possível vender o produto
create_new_exception({
  actionName: 'CadastrarProduto',
  actionClass: 'Produto',
  exception: "Não foi possível cadastrar o produto",
  project: farmacorp,
  viewReferer: "https://farmacorp.com/produto",
  viewMethod: "post",
  viewUrl: "https://sistemafarmacorp.com/produto",
  params: [
    {
      tipo: "string",
      name: "nome",
    },
    {
      tipo: "string",
      name: "codigo",
    },
    {
      tipo: "string",
      name: "receita",
    },
  ],
  objText: "HTTP/1.1 200 OK
  Content-Type: application/javascript
  Cache-Control: public, max-age=31536000
  X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
  X-Runtime: 0.005849
  Content-Length: 27512
  "
})

# --------------------------------------------------------------------

# erro mais simples
# create_new_exception({
#   actionName: 'VenderProdutos',
#   actionClass: 'Produto',
#   exception: "erro mais simples",
#   project: abelha_rainha_carla,
#   viewReferer: "https://abelharainha.com/vendas",
#   viewMethod: "post",
#   viewUrl: "https://sistemaabelharainha.com/vendas",
#   params: [
#     {
#       tipo: "float",
#       name: "valor",
#     },
#     {
#       tipo: "string",
#       name: "codigo",
#     },
#     {
#       tipo: "string",
#       name: "quantidade",
#     },
#   ],
#   objText: "HTTP/1.1 200 OK
#   Content-Type: application/javascript
#   Cache-Control: public, max-age=31536000
#   X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
#   X-Runtime: 0.005849
#   Content-Length: 27512
#   "
# })

# # erro mais crítico
# create_new_exception({
#   actionName: 'VenderProdutos',
#   actionClass: 'Produto',
#   exception: "erro mais crítico",
#   project: abelha_rainha_carla,
#   viewReferer: "https://abelharainha.com/vendas",
#   viewMethod: "post",
#   viewUrl: "https://sistemaabelharainha.com/vendas",
#   params: [
#     {
#       tipo: "float",
#       name: "valor",
#     },
#     {
#       tipo: "string",
#       name: "codigo",
#     },
#     {
#       tipo: "string",
#       name: "quantidade",
#     },
#   ],
#   objText: "HTTP/1.1 200 OK
#   Content-Type: application/javascript
#   Cache-Control: public, max-age=31536000
#   X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
#   X-Runtime: 0.005849
#   Content-Length: 27512
#   "
# })

# # Não foi possível cadastrar usuário Ricardo
# create_new_exception({
#   actionName: 'CadastrarUsuário',
#   actionClass: 'Usuário',
#   exception: "Não foi possível cadastrar usuário Ricardo",
#   project: farmacorp_carla,
#   viewReferer: "https://farmacorp.com/usuario",
#   viewMethod: "post",
#   viewUrl: "https://sistemafarmacorp.com/usuário",
#   params: [
#     {
#       tipo: "string",
#       name: "email",
#     },
#     {
#       tipo: "string",
#       name: "nome",
#     },
#     {
#       tipo: "string",
#       name: "cpf",
#     },
#   ],
#   objText: "HTTP/1.1 200 OK
#   Content-Type: application/javascript
#   Cache-Control: public, max-age=31536000
#   X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
#   X-Runtime: 0.005849
#   Content-Length: 27512
#   "
# })

# # Não foi possível vender o produto
# create_new_exception({
#   actionName: 'VenderProdutos',
#   actionClass: 'Produto',
#   exception: "Não foi possível completar venda",
#   project: farmacorp_carla,
#   viewReferer: "https://farmacorp.com/produto",
#   viewMethod: "post",
#   viewUrl: "https://sistemafarmacorp.com/produto",
#   params: [
#     {
#       tipo: "string",
#       name: "valor",
#     },
#     {
#       tipo: "string",
#       name: "codigo",
#     },
#     {
#       tipo: "string",
#       name: "quantidade",
#     },
#   ],
#   objText: "HTTP/1.1 200 OK
#   Content-Type: application/javascript
#   Cache-Control: public, max-age=31536000
#   X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
#   X-Runtime: 0.005849
#   Content-Length: 27512
#   "
# })


# # Não foi possível vender o produto
# create_new_exception({
#   actionName: 'CadastrarProduto',
#   actionClass: 'Produto',
#   exception: "Não foi possível cadastrar o produto",
#   project: farmacorp_carla,
#   viewReferer: "https://farmacorp.com/produto",
#   viewMethod: "post",
#   viewUrl: "https://sistemafarmacorp.com/produto",
#   params: [
#     {
#       tipo: "string",
#       name: "nome",
#     },
#     {
#       tipo: "string",
#       name: "codigo",
#     },
#     {
#       tipo: "string",
#       name: "receita",
#     },
#   ],
#   objText: "HTTP/1.1 200 OK
#   Content-Type: application/javascript
#   Cache-Control: public, max-age=31536000
#   X-Request-Id: 34e554e2-2c88-43e8-b012-3ee8622a8574
#   X-Runtime: 0.005849
#   Content-Length: 27512
#   "
# })