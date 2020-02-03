module ExcecaoHelper
  extend ActiveSupport::Concern
  
  included do
    def create_excecoes params
      acao_nome = params[:acao][:acaoNome]
      acao_classe = params[:acao][:acaoClasse]
      view_referer = params[:http][:viewReferer]
      view_url = params[:http][:viewUrl]
      view_method = params[:http][:viewMethod]
      obj_text = params[:objSessao][:objText]
      # a array of params
      # param_tipo = params[:parametros][:paramTipo]
      # param_nome = params[:parametros][:paramNome]
      excecao_error = params[:excecao][:error]

      newAcao = Acao.create(nome: acao_nome, classe: acao_classe)
      puts newAcao.id
      newExc = newAcao.requisicaos.create(error: excecao_error)
      puts newExc.id
      newView = newExc.create_http(view_referer: view_referer, view_method: view_method, view_url: view_url)
      puts newView.id
      params[:parametros].each do |parametro|
        # binding.pry
        newPar = newExc.parametros.create(param_tipo: parametro[:paramTipo], param_nome: parametro[:paramNome])
        puts newPar.id
      end
      newSess = newExc.create_sessao
      puts newSess.id
      newObj = newSess.create_obj_sessao(obj_text: obj_text)
      puts newObj.id
    end