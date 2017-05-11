# Departmets-Library

## Description

* 部署の図書管理アプリ
* Raspberypi + Rails + Unicorn

## Features

- 部署の蔵書情報の管理
    - 書籍のISBN（バーコードの１段目）によりAmazonから蔵書情報を取得して登録できます
- 貸出管理
    - 社員証とバーコードスキャンによる貸出・返却が可能

## Requirement

- ruby 2.2.2+
- Rails 5.1

## Installation

1. Installation
* このリポジトリをclone
2. set env
* 環境変数を設定
```
### rails settings
RAILS_ROOT=/root/cloudlib
ASSOCIATE_TAG=associate_tag
AWS_ACCESS_KEY=aws_access_key
AWS_CECRET_KEY=aws_cert_key

# production
CLOUDLIB_DATABASE_USERNAME=username
CLOUDLIB_DATABASE_PASSWORD=passward
SECRET_KEY_BASE=kye_base

# development
CLOUDLIB_DATABASE_USERNAME_DEFAULT=username
CLOUDLIB_DATABASE_PASSWORD_DEFAULT=passward
CLOUDLIB_DATABASE_HOST_DEFAULT=dbhost
SECRET_KEY_BASE_DEVELOPMENT=key_base

# test
SECRET_KEY_BASE_TEST=key_base

```
3. 起動
```
bundle Install
```

## License

[MIT](http://b4b4r07.mit-license.org)
