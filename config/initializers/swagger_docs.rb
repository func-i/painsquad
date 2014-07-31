Swagger::Docs::Config.register_apis({
  "1.0" => {:controller_base_path => "", :api_file_path => "public"}

  # "1.0" => {
  #   # the extension used for the API
  #   :api_extension_type => :json,
  #   # the output location where your .json files are written to
  #   :api_file_path => "/api/v1/",
  #   # the URL base path to your API
  #   :base_path => "http://painsquad.herokuapp.com",
  #   # if you want to delete all .json files at each generation
  #   :clean_directory => false,
  #   # add custom attributes to api-docs
  #   :attributes => {
  #     :info => {
  #       "title" => "PainSquad API",
  #       "description" => "API Documentation for PainSquad"
  #     }
  #   }
  # }
})