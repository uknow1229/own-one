source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', github: "rails/rails", branch: "6-1-stable"
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-packaging', require: false
  gem 'rubocop-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '>= 3.26'
  # gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  # gem 'webdrivers'

  # テスティングフレームワーク
  gem 'rspec-rails'
  # テスト用データの作成
  gem 'factory_bot_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# 登録、ログイン
gem 'devise'

# 検索機能
gem 'ransack'

# ページネーション
gem 'kaminari','~> 1.2.1'
gem 'bootstrap5-kaminari-views'

# 画像の処理
gem 'image_processing', '~>1.2'

# enumで定義した値をi18n化
gem 'enum_help'

# デバッグツール
gem 'pry-byebug'

# i18n対応
gem 'rails-i18n'

gem 'jquery-rails'

# ダミーデータ作成
gem 'faker'

# 管理画面
gem 'rails_admin'

# 権限管理
gem 'cancancan'

# カレンダー機能
gem 'simple_calendar'

# 環境変数を管理
gem 'dotenv-rails'
group :production do
  gem 'mysql2'
end

# OGP, メタタグの設定
gem "meta-tags"

gem "net-smtp"
gem "net-pop"
gem "net-imap"

