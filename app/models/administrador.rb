class Administrador < ApplicationRecord
    validates :nome, presence: true, length: { maximum: 150 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :senha, presence: true, length: { maximum: 255 }
end
