class Acao < ApplicationRecord
    has_many :excecaos

    has_many :parametros
end
