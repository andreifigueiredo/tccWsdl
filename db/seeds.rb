# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Developer.create(email: ENV['owner'], password: "123123", admin: true)
Developer.create(email: "duartefellipe@gmail.com", password: "123123", admin: true)
abelha_rainha = Project.create(name: "Padaria Abelha Rainha")
farmacorp = Project.create(name: "Farmácia Farmacorp")
# newAcao = Acao.create(nome: acao_nome, classe: acao_classe)
# newExc = newAcao.excecaos.create(error: excecao_error, project: project)
# newView = newExc.create_http(view_referer: view_referer, view_method: view_method, view_url: view_url)
# newPar = newExc.parametros.create(param_tipo: parametro[:paramTipo], param_nome: parametro[:paramNome])
# newSess = newExc.create_sessao
# newObj = newSess.create_obj_sessao(obj_text: obj_text)

