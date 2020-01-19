# 短縮URL作成サービスtippy.jp


## About

【公開中】[http://tippy.jp](http://tippy.jp)

**Ruby on Rails 6.0で開発した自分用のURL短縮サービスです。**

  - ユーザーのサインアップ、ログイン、ログアウト
  - Adminユーザーの設定
  - 短縮URLへの任意の文字列の使用
  - 短縮URLの編集・削除
  - クリック数の記録
  - QRコードの表示


## TODO

* 本番環境のディスクがログファイルで汚染されていく問題
* 定期的にサーバー再起動したい
* https対応
* reCAPTCHA v3導入


## Install (in Production)

nginxとmysqlは設定済みとします

```bash
$ git clone this_repo

$ cd rails_url_shortener

$ bundle install --path vendor/bundle --without development test

$ touch config/master.key

$ vi config/master.key

$ bundle exec rails db:migrate

$ bundle exec rails db:seed

$ bundle exec rails c

# adminユーザーの追加
irb(main):001:0> User.create(name: "", password: "", admin: true)

irb(main):001:0> quit

$ bundle exec rails webpacker:install

$ bundle exec rails webpacker:compile

# メモリが足りないときは以下コマンドでMYSQLを停止するとよい
$ sudo service mysqld stop

```


## Lanch (in Production)
```bash
$ bundle exec rails s -e production
# -dは不要。あると動かない。

$ sudo systemctl start nginx

```


## Stop (in Production)
```bash
$ ps aux | grep puma

$ kill -15 {processID}

# sudo systemctl stop nginx

```


## Install (in Development)

多分色々間違っています

```bash
$ git clone this_repo

$ cd url_shortener

$ bundle install --path vendor/bundle

$ bundle exec rails webpacker:install

$ bundle exec rails db:migrate

$ bundle exec rails db:seed

# ほか何かあるかも。yarnが入っていないときとか。

```


## Lanch (in Development)

```bash
$ bundle exec rails s

# 別タブで

$ ./bin/webpack-dev-server

```


## Access to database

```bash
$ bundle exec rails dbconsole

sqlite> .tables

sqlite> .schema users

sqlite> select * from users;

sqlite> .quit

```


## 作業ログ

rails new前後の手順のメモ

```
mkdir url-shortener

cd url-shortener

rbenv local 2.7.0

gem update bundler

bundle init

vi Gemfile
# GemfileにRailsを追加

bundle install --path vendor/bundle

bundle exec rails new . -B -M -C -S -T --database=mysql

vi Gemfile
# bcryptとi18nを追加

bundle install

yarn add bootstrap jquery popper.js @fortawesome/fontawesome-free

bundle exec rails webpacker:install

bundle exec rails db:create

bundle exec rails s
# localhost:3000で起動できていることを確認
```

