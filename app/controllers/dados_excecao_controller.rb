class DadosExcecaoController < ApplicationController

  def index
    @dados_excecao = Requisicao.all

    # Daru::View.table_library = :googlecharts
    
    # @data_rows = []
    # @dados_excecao.each do |dado|
    #   @data_rows << [{c: [ 
    #     {v: dado.acao.nome}, 
    #     {v: dado.acao.classe}, 
    #     {v: dado.agent}, 
    #     {v: dado.encode},
    #     {v: dado.http.view_url}
    #   ]}
    #   ]
    # end

    # @data = {
    #   cols: [{label: 'Nome', type: 'string'},
    #           {label: 'Classe', type: 'string'},
    #           {label: 'Agente', type: 'string'},
    #           {label: 'Encode', type: 'string'},
    #           {label: 'Url', type: 'string'}
    #         ],
    #   rows: @data_rows
    #   }

    # dataTableRows = Daru::DataFrame.rows(@data)

    # # binding.pry
    # @dataTable = Daru::View::Table.new(dataTableRows, adapter: :datatables)
  end
end
