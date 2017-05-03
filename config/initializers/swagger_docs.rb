class Swagger::Docs::Config
  def self.base_api_controller; Mobile::BaseController end
end
Swagger::Docs::Config.register_apis({
    '1.0' => {
        :api_extension_type => :json,
        :api_file_path => 'public/swagger/',
        :base_path => Rails.application.config.host,
        :clean_directory => true,
        :attributes => {
            :info => {
                'title' => 'Swagger FITCLUBS App',
            }
        }
    }
})