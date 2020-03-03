require 'swagger_helper'

describe 'Excecaos API' do
  path '/api/v1/excecaos' do
    post 'Create a excecao' do
      tags 'Excecaos'
      consumes 'application/json', 'application/xml'
      parameter name: :excecao, in: :body, schema: {
        type: :object,
        proprieties: {

        },
        required: []
      } 

      response '201', 'excecao created' do
        let(:excecao) { {} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:excecao) { {} }
        run_test!
      end
    end
  end 
end