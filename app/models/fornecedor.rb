class Fornecedor < ApplicationRecord
  belongs_to :fornecedor_tipo
  has_many :fornecedores_enderecos, dependent: :destroy
  has_many :enderecos, through: :fornecedores_enderecos

  validates_presence_of :nome, :cnpj, :fornecedor_tipo_id
  validates_format_of :cnpj, with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, allow_blank: true, message: "deve ter o formato XX.XXX.XXX/XXXX-XX" #, on: :update
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, allow_blank: true
  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, allow_blank: true, message: "deve ter o formato XXXXX-XXX" #, on: :update

  validates_uniqueness_of :email, case_sensitive: false #, scope: :cnpj

  attr_accessor :confirmacao_senha
  validates_confirmation_of :senha, if: :deve_ter_senha_confirmada?

  validates_acceptance_of :termos_de_uso

  # validate :precisa_ter_cnpj_nome_email_iguais

  def cnpj_valido?
    cnpj_validar = self.cnpj.to_s
    cnpj_validar = cnpj_validar.scan(/\d/).join

    return false if cnpj_validar.length != 14
    return false if cnpj_validar.scan(/\d/).uniq.length == 1

    digits = cnpj_validar.chars.map(&:to_i)
    verification_digits = digits[-2, 2]

    calculated_digits = calculate_verification_digits(digits[0...12])

    calculated_digits == verification_digits
  end

  private

  def precisa_ter_cnpj_nome_email_iguais
    if self.cnpj != self.nome || self.cnpj != self.email
      self.errors.add("Validação customizada", "O CNPJ precisa ser igual a nome e email")
    end
  end
  
  def deve_ter_senha_confirmada?
    return self.confirmacao_senha.blank? && self.senha.blank?

    if self.confirmacao_senha != self.senha
      self.errors.add("Confirmação senha", "está diferente da senha")
    end
  end
  
  def calculate_verification_digits(digits)
    first_digit = calculate_digit(digits, [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2])
    second_digit = calculate_digit(digits + [first_digit], [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2])

    [first_digit, second_digit]
  end

  def calculate_digit(digits, multipliers)
    sum = digits.zip(multipliers).map { |a, b| a * b }.reduce(:+)
    mod = sum % 11
    mod < 2 ? 0 : 11 - mod
  end
end
