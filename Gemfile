source 'https://rubygems.org'

#Preprocessors
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

#Backend
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'rack-cors', require: 'rack/cors'

#Адаптер для MongoDB
gem 'mongoid'
gem 'mongoid-slug'
gem 'mongoid-autoinc', require: 'autoinc'

#Аддон, который позволяет писать миграции базы данных
gem 'mongoid_rails_migrations'

#Работа с изображениями
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'
gem 'mini_magick'
gem 'mime-types'
gem 'carrierwave-imageoptimizer'

#Аддон, который добавляет возможность выбора представления для API
gem 'responders'

#Аддон, который сериализирует данные для вывода
gem 'active_model_serializers', '~> 0.8.0'

#Аддон, который позволяет добавлять ENUMы в модель
gem 'enumerize'

#Валидация через формы
gem 'reform'
gem 'reform-rails'

#Аутентификация пользователей с разными фичами
gem 'devise'

#Добавление, удаление, проверка ролей
gem 'rolify'

#Авторизация пользователей
gem 'pundit'

#Машина состояний
gem 'aasm'

#Обертка для API SMSc.ru
gem 'smsc'

#Поисковый движок
gem 'ransack', github: 'activerecord-hackery/ransack'

#Пагинация
gem 'kaminari-mongoid'

#Redis
gem 'redis', '~> 3.3.1'

#Sidekiq
gem 'sidekiq', '~> 4.2.2'

#QR code
gem 'rqrcode'

#Mobile PUSH
gem 'gcm'

#Swagger
gem 'swagger-docs'
gem 'grape-swagger-rails'

#Frontend
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'slim-rails'

group :test, :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'database_cleaner', '~> 1.5.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.5.0'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-sidekiq', '0.5.3'
  gem 'rubocop', require: false
end

group :test, :development, :staging do
  gem 'rack-pjax',    github: 'afcapel/rack-pjax'
  gem 'remotipart',   github: 'mshibuya/remotipart'
  gem 'rails_admin',  github: 'sferik/rails_admin'
end

