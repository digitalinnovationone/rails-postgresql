# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections do |inflect|
  inflect.clear
  
  # Exemplos de pluralizações
  inflect.plural /([r|s|z])$/i, '\1es'
  inflect.plural /al$/i, 'ais'
  inflect.plural /el$/i, 'eis'
  inflect.plural /ol$/i, 'ois'
  inflect.plural /ul$/i, 'uis'
  inflect.plural /il$/i, 'is'

  # Exemplos de singularizações
  inflect.singular /([r|s|z])es$/i, '\1'
  inflect.singular /ais$/i, 'al'
  inflect.singular /eis$/i, 'el'
  inflect.singular /ois$/i, 'ol'
  inflect.singular /uis$/i, 'ul'
  inflect.singular /is$/i, 'il'

  # Exemplos de casos irregulares
  inflect.irregular 'país', 'países'
  
  # Exemplos de palavras incontáveis
  inflect.uncountable %w( táxi ônibus lápis fênix )
end
