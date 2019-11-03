class WsdlServicesController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "SendLog",
      :args => {
        :acao => {
          :acaoNome => :string,
          :acaoClasse => :string,
        },
        :requisicao => {
          :reqAgent => :string,
          :reqEncode => :string,
        },
        :http => {
          :viewReferer => :string,
          :viewUrl => :string,
          :viewMethod => :string,
        },
        :objSessao => {
          :objText => :string,
        },
        :parametros => [{
          :paramTipo => :string,
          :paramNome => :string,
        }]
      },
      :return => nil,
      :to => :send_log

  def send_log

    # binding.pry
      acao_nome = params[:acao][:acaoNome]
      acao_classe = params[:acao][:acaoClasse]
      view_referer = params[:http][:viewReferer]
      view_url = params[:http][:viewUrl]
      view_method = params[:http][:viewMethod]
      obj_text = params[:objSessao][:objText]
      # a array of params
      # param_tipo = params[:parametros][:paramTipo]
      # param_nome = params[:parametros][:paramNome]
      req_agent = params[:requisicao][:reqAgent]
      req_encode = params[:requisicao][:reqEncode]


      puts "Inicio Query"
      # A excecao apenas guardava data/hora, rails faz isso por padrão
      # puts newExc.id
      newAcao = Acao.create(nome: acao_nome, classe: acao_classe)
      puts newAcao.id
      newReq = newAcao.requisicaos.create(agent: req_agent, encode: req_encode)
      puts newReq.id
      newView = newReq.create_http(view_referer: view_referer, view_method: view_method, view_url: view_url)
      puts newView.id

      params[:parametros].each do |parametro|
        # binding.pry
        newPar = newReq.parametros.create(param_tipo: parametro[:paramTipo], param_nome: parametro[:paramNome])
        puts newPar.id
      end
      newSess = newReq.create_sessao
      puts newSess.id
      newObj = newSess.create_obj_sessao(obj_text: obj_text)
      puts newObj.id
      
      puts "Fim Query" 
      render :soap => nil
  end
=begin

soap_action "sum",
  :args => {:a => :integer, :b => :integer},
  :return => :integer
def sum
  result = (params[:a] + params[:b])
  render :soap => result
end

soap_action "substract",
  :args => {:a => :integer, :b => :integer},
  :return => :integer
def substract
  render :soap => (params[:a] - params[:b])
end

soap_action "multiply",
  :args => {:a => :integer, :b => :integer},
  :return => :integer
def multiply
  render :soap => (params[:a] * params[:b])
end

soap_action "divide",
  :args => {:a => :integer, :b => :integer},
  :return => :integer
def divide
  render :soap => (params[:a] / params[:b])
end
=end

end
