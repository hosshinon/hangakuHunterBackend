# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# railsの起動時間を短縮する（標準gem）
gem "bootsnap", require: false

# MySQLに接続する
gem "mysql2", "~> 0.5"

# pumaサーバーを使えるようにする（標準gem）
gem "puma", "~> 5.0"

# rails本体（標準gem）
gem "rails", "~> 7.0.4"

# タイムゾーン情報を提供する（標準gem）
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# cors設定を管理する
gem "rack-cors"

# 環境毎の設定管理を行う
gem "config"

group :development, :test do
  # pry コンソールを使えるようにする。
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  # テストフレームワーク rspec を導入する
  gem "factory_bot_rails"
  gem "faker"
  gem "json_spec"
  gem "rspec-rails"
  # rubocop を使えるようにする。
  gem "rubocop-faker"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end
