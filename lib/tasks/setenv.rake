desc 'Set ENV on heroku'
task :setenv do
  configatron.configure_from_yaml("config/config.yml")

  configatron.development.to_hash.each do |key,names|
    names.each do |name,value|
      config_name = [key,name].join('_').upcase
      system('heroku', 'config:add', "#{config_name}=" + value)
    end
  end
end
