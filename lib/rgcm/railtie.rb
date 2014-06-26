module Rgcm
  class Railtie < Rails::Railtie

    initializer 'setup rgcm' do
      config_file = Rails.root.join('config', 'rgcm.yml')
      if config_file.file?
        Rgcm::Config.config = YAML.load(ERB.new(config_file.read).result)[Rails.env]
      end
      config.after_initialize do
        puts "\nRgcm config not found. Create a config file at: config/rgcm.yml" unless config_file.file?
      end
    end

  end
end