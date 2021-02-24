require 'simplecov'

# FIXME: minimum_coverage no bitbucket pipeline
# Ao executar o minimum_coverage ocorre um problema no bitbucket pipeline que é:
# a leitura em ambiente local marca uma porcentagem muito maior que no ambiente do bitbucket.

# SimpleCov.minimum_coverage 95
# SimpleCov.maximum_coverage_drop 1
# SimpleCov.refuse_coverage_drop
SimpleCov.start 'rails' do
  add_filter %w[bin db config spec test]
  add_filter ["app/channels", "app/helpers"]


  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Lib", "app/lib"

end