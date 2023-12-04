class Administrador < ApplicationRecord
    validates :nome, presence: true, length: { maximum: 150 }
    validates :email, presence: true, length: { maximum: 200 }
    validates :senha, presence: true, length: { maximum: 200 }
end
