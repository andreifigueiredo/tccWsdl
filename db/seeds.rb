puts "Criando projetos..."
abelha_rainha = Project.create(name: "Abelha Rainha")
farmacorp = Project.create(name: "Farmacorp")

puts "Criando times..."
saturno = Team.create(name: "Saturno", project: abelha_rainha)
venus = Team.create(name: "Venus", project: farmacorp)

puts "Criando desenvolvedores..."
Developer.create(email: ENV['gmail_username'], password: "123123", admin: true)
Developer.create(email: "duartefellipe@gmail.com", password: "123123", admin: true)
Developer.create(email: "flavioreal10@gmail.com", password: "123123", admin: true)
anderson = Developer.create(email: "anderson@teste.com", password: "123123", admin: false, team: saturno)
eduardo = Developer.create(email: "eduardo@teste.com", password: "123123", admin: false, team: saturno)
Developer.create(email: "leandro@teste.com", password: "123123", admin: false, team: saturno)
Developer.create(email: "rodrigo@teste.com", password: "123123", admin: false, team: venus)
fernando = Developer.create(email: "fernando@teste.com", password: "123123", admin: false, team: venus)
Developer.create(email: "joao@teste.com", password: "123123", team: venus)

# --------------------------------------------------------------------

Timecop.freeze(Time.now - 10.days)
puts Time.now

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

puts "Criando exceções..."
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

# Erro exemplo 1
exemplo_atribuido = create_new_exception({
  actionName: 'Cadastro Usuário',
  actionClass: 'User',
  exception: "Não foi possível cadastrar usuário",
  project: abelha_rainha,
  viewReferer: "https://abelharainha.com/usuario",
  viewMethod: "post",
  viewUrl: "https://sistemaabelharainha.com/usuario",
  params: [
    {
      tipo: "string",
      name: "nome",
    },
    {
      tipo: "string",
      name: "email",
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

# Erro exemplo 2
exemplo_concluido = create_new_exception({
  actionName: 'Editar Usuário',
  actionClass: 'User',
  exception: "Não foi possível editar usuário",
  project: abelha_rainha,
  viewReferer: "https://abelharainha.com/usuario",
  viewMethod: "put",
  viewUrl: "https://sistemaabelharainha.com/usuario",
  params: [
    {
      tipo: "string",
      name: "nome",
    },
    {
      tipo: "string",
      name: "email",
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
  exception: "Não foi possível vender o medicamento rinosoro",
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
  exception: "Não foi possível cadastrar o medicamento Dipirona Genérico",
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

# Erro exemplo 3
exemplo_concluido_1 = create_new_exception({
  actionName: 'Cadastrar Usuário',
  actionClass: 'User',
  exception: "Não foi possível cadastrar usuário",
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
      name: "email",
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

# Erro exemplo 4
exemplo_concluido_2 = create_new_exception({
  actionName: 'Editar Usuário',
  actionClass: 'User',
  exception: "Não foi possível editar usuário",
  project: farmacorp,
  viewReferer: "https://farmacorp.com/produto",
  viewMethod: "put",
  viewUrl: "https://sistemafarmacorp.com/produto",
  params: [
    {
      tipo: "string",
      name: "nome",
    },
    {
      tipo: "string",
      name: "email",
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

# Erro exemplo 3
exemplo_atriuido_1 = create_new_exception({
  actionName: 'Deletar Usuário',
  actionClass: 'User',
  exception: "Não foi possível deletar usuário",
  project: farmacorp,
  viewReferer: "https://farmacorp.com/produto",
  viewMethod: "destroy",
  viewUrl: "https://sistemafarmacorp.com/produto",
  params: [
    {
      tipo: "id",
      name: "id",
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

# Erro exemplo 5
exemplo_concluido_3 = create_new_exception({
  actionName: 'Deletar Usuário',
  actionClass: 'User',
  exception: "Não foi possível deletar usuário",
  project: abelha_rainha,
  viewReferer: "https://abelharainha.com/usuario",
  viewMethod: "destroy",
  viewUrl: "https://sistemaabelharainha.com/usuario",
  params: [
    {
      tipo: "string",
      name: "nome",
    },
    {
      tipo: "string",
      name: "email",
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

puts "Criando dono_exceções..."
DonoExcecao.find_by_excecao_id(exemplo_atribuido.id).update(developer: eduardo)
DonoExcecao.find_by_excecao_id(exemplo_concluido.id).update(developer: eduardo)

Timecop.freeze(Time.now + 1.hours)
puts Time.now


DonoExcecao.find_by_excecao_id(exemplo_concluido.id).update(solved: true)
DonoExcecao.find_by_excecao_id(exemplo_concluido_3.id).update(developer: anderson)

DonoExcecao.find_by_excecao_id(exemplo_atriuido_1.id).update(developer: fernando)
DonoExcecao.find_by_excecao_id(exemplo_concluido_1.id).update(developer: fernando)
DonoExcecao.find_by_excecao_id(exemplo_concluido_2.id).update(developer: fernando)

Timecop.return
puts Time.now

DonoExcecao.find_by_excecao_id(exemplo_concluido_1.id).update(solved: true)
DonoExcecao.find_by_excecao_id(exemplo_concluido_2.id).update(solved: true)

DonoExcecao.find_by_excecao_id(exemplo_concluido_3.id).update(solved: true)


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