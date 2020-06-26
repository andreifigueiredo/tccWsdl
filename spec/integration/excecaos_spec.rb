# require 'swagger_helper'

# describe 'Excecaos API' do
#   path '/api/v1/excecaos' do
#     post 'Create a excecao' do
#       tags 'Excecaos'
#       consumes 'application/json', 'application/xml'
#       parameter name: :excecao, in: :body, schema: {
#         type: :object,
#         proprieties: {
#           acao: {
#             acaoNome: { type: :string },
#             acaoClasse: { type: :string },
#           },
#           excecao: {
#             error: { type: :string },
#           },
#           http: {
#             viewReferer: { type: :string },
#             viewUrl: { type: :string },
#             viewMethod: { type: :string },
#           },
#           objSessao: {
#             objText: { type: :string },
#           },
#           parametros: [{
#             paramTipo: { type: :string },
#             paramNome: { type: :string },
#           }]
#         },
#         required: []
#       } 

#       response '201', 'excecao created' do
#         let(:excecao) { { acao: { acaoNome: "acaoNomeTeste", acaoClasse: "acaoClasseTeste" }, 
#                           excecao: { error: "errorTeste" },
#                           http: { viewReferer: "viewRefererTeste", viewUrl: "viewUrlTeste", viewMethod: "viewMethod" },
#                           objSessao: { objText: "objTextTeste" },
#                           parametros: { paramTipo: "paramTipoTeste", paramNome: "paramNomeTeste" } 
#                       } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:excecao) { { invalidParam: "paramAleatorioNListado"} }
#         run_test!
#       end
#     end
#   end 
# end