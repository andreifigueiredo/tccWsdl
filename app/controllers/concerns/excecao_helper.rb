module ExcecaoHelper
  extend ActiveSupport::Concern
  
  included do
    def create_excecoes parametros
      begin

        # binding.pry

        acao_nome = parametros[:acao][:acaoNome]
        acao_classe = parametros[:acao][:acaoClasse]
        view_referer = parametros[:http][:viewReferer]
        view_url = parametros[:http][:viewUrl]
        view_method = parametros[:http][:viewMethod]
        obj_text = parametros[:objSessao][:objText]
        # a array of parametros
        # param_tipo = parametros[:parametros][:paramTipo]
        # param_nome = parametros[:parametros][:paramNome]
        excecao_error = parametros[:excecao][:error]
        project = Project.find_by_code(parametros[:code])

        # binding.pry
        newAcao = Acao.create(nome: acao_nome, classe: acao_classe)
        puts newAcao.id
        newExc = newAcao.excecaos.create(error: excecao_error, project: project)
        puts newExc.id
        newView = newExc.create_http(view_referer: view_referer, view_method: view_method, view_url: view_url)
        puts newView.id
        parametros[:parametros].each do |parametro|
          # binding.pry
          newPar = newExc.parametros.create(param_tipo: parametro[:paramTipo], param_nome: parametro[:paramNome])
          puts newPar.id
        end
        newSess = newExc.create_sessao
        puts newSess.id
        newObj = newSess.create_obj_sessao(obj_text: obj_text)
        puts newObj.id

        return newExc
      rescue
        return nil
      end
    end
  end
end