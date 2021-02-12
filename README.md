# README

## 目次

1. [リンク](#link)
2. [名前](#name)
3. [概要](#overview)
4. [詳細](#description)
5. [デモ](#demo)
6. [開発環境、利用したツール](#development)
7. [本番環境](#production)
8. [インストール方法](#install)
9. [メール認証の設定](#mail)
10. [テスト方法](#test)
11. [デプロイ方法](#deploy)
12. [更新履歴](#update)
13. [バージョンアップ予定](#versionup)
14. [ライセンス](#license)
15. [config設定ファイル](#4file)

<a id="link"></a>
## リンク
[現場で稼働中(ログイン不可)](https://system.itto-takasaka.com/users/sign_in)<br>
[公開用レプリカ(ログイン可能)](https://portfolio.itto-takasaka.com/users/sign_in)<br>
ログイン用<br>
email: pro.only.21@gmail.com<br>
password: Password-1

<a id="name"></a>
## 名前

塾内データ管理アプリ

<a id="overview"></a>
## 概要

授業報告、通知表、定期試験結果、模試、単語テストを管理できるアプリケーションです。

<a id="description"></a>
## 詳細 

| 機能名 | 機能詳細 |
| ------------- | ------------- |
| 新規登録、ログイン  | deviseを用いたメール認証、認証後権限を与えることでログイン可能に(1)  |
| 授業報告  | 生徒、教科、授業報告本文、その授業での理解度を登録  |
| 通知表  | 生徒、学年、学期、9教科の成績を数字で登録。また、通知表の提出をしていない生徒を一覧で表示  |
| 定期試験  | 生徒、学年、試験名、9教科の得点を数字で登録。また、定期試験結果を提出していない生徒を一覧で表示  |
| 小テスト  | 毎週行われる小テストの結果を西暦、月と含めて登録。また、小テストを行っていない生徒を一覧で表示  |
| 単語テスト  | 毎週行われる単語テストの得点を登録  |
| 高校生ファイル登録  | 高校生の模試や成績、面談結果等の紙書類の写真を登録  |
| 生徒  | 生徒氏名、学校、生まれ年、心理テストの結果を登録  |
| 学校  | 小中高、学校名を登録  |
| 講師  | 講師氏名、各講師ページへのリンクを表示  |
| 生徒ページ  | 各生徒の授業報告、担当講師、小テスト、通知表、定期試験、単語テストを一覧で表示。また、通知表、定期試験はグラフを表示  |
| 講師ページ  | 各講師が登録した授業報告、担当生徒、小テスト、通知表、定期試験、単語テストを一覧で表示  |

(1)直接MySQLにUPDATE文を書くことで権限を付与。不便なため今後改良予定。

<a id="demo"></a>
## デモ

授業報告登録のデモ動画

<img src="https://github.com/hasebetakumi/itto/wiki/images/itto.gif">

<a id="development"></a>
## 開発環境、利用したツール

- Ruby : 2.5.1
- Rails : 5.2.4.4
> - Rubocop
> - Rspec
> - bundler : 2.1.4
- MySQL : 5.5.62
- Cloud9 EC2
- Docker Docker-compose
- CircleCI

<a id="production"></a>
## 本番環境

- Ruby : 2.5.1
- Rails : 5.2.4.4
> - bundler : 2.1.4
- MySQL : 8.0
- EC2 VPC CertificateManager Route53
- Nginx
- Unicorn

<a id="install"></a>
## インストール方法

gitのインストールはgitホームページを参照
[gitホームページ](https://git-scm.com/book/ja/v2/%E4%BD%BF%E3%81%84%E5%A7%8B%E3%82%81%E3%82%8B-Git%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)
<br>cloud9には初期インストールされてる

gitクローン

```
git clone https://github.com/hasebetakumi/itto.git
```

docker-composeのインストール

```
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

docker-composeコマンドを使えるように権限を与える

```
sudo chmod +x /usr/local/bin/docker-compose
```

docker-composeバージョン確認

```
docker-compose --version
```

アプリのディレクトリに移動

```
cd itto
```

docker imageの作成

```
docker-compose build
```

マスターキーの登録

```
オリジナルのローカルにあるmaster.keyをコピペ
```

起動

```
docker-compose up
```

データベースの作成

```
docker-compose run web bin/rake db:create db:migrate db:seed
```

seedsに初期ユーザーを登録しているため

```
email: nba.syuu.k@gmail.com
password: 111111
```

でログイン。下のメール認証の設定に進んでください。

<a id="mail"></a>
## メール認証の設定（gmailを用います）
configというgemを用いる。
すでにbundle installは行っているため、以下のコードを実行し設定ファイルを生成する。

```
bundle exec rails g config:install
```

config/settings.local.ymlというファイルが生成されるので、その中に

```
development:
    url: '開発環境のURL'
    email: "送信元に使用するアドレス@gmail.com"
    password: "上のgmailアカウントのこのアプリに対するアプリパスワード"
```

を記載。

また、config/environments/production.rb、config/environments/development.rb、config/devise.rbの中の<br>

```
"Settings.production[:url]"
"Settings.development[:url]"
"Settings.development[:email]"
"Settings.development[:password]"

```

の""を全て外す。
""をつけていないと、circleciのdb:create時に[]の中が空ですよと怒られる。<br>
中身が入っているsettings.local.ymlはgitignoreされているため当然だが、<
""をつけたままだと、メール認証は機能しないので注意
（これはどうすれば楽になるのか、）


これで開発環境でのメール認証設定は終了。

しかし、このファイルはgitignoreしているため、本番環境にはgit cloneできない。
本番環境ではviコマンド等でconfig/environments/production.rb、config/devise.rbの中を、

```
Settings.production[:url]→本番環境のURL
Settings.development[:email]→送信元gmail
Settings.development[:password]→上のgmailアカウントのこのアプリに対するアプリパスワード
```

に、手動で変更する必要がある。

<a id="test"></a>
## テスト方法

アプリのディレクトリに移動し
静的テスト

```
rubocop
```

動的テスト

```
docker-compose run web bundle exec rspec
```

<a id="deploy"></a>
## デプロイ方法

Qiitaに情報を記載<br>
[githubにあるrailsアプリをAWSにデプロイ](https://qiita.com/hasebetakumi/items/72c62060458207e23a10)

<a id="update"></a>
## 更新履歴

2021/02/09 高校生の成績等の画像を登録するシステム追加

<a id="versionup"></a>
## バージョンアップ予定

* 連動コンボボックス
* 新年度で自動で学年が更新される
* 単語テストの作成
* 権限付与の仕方（塾内wifiからのみアクセスできるIP制限を検討中）
* 同姓同名登録時に注意勧告
* LINEと連携し、担当生徒の何が提出されていないのか知らせる

<a id="license"></a>
## ライセンス

Copyright © 2021, Takumi Hasebe

ポートフォリオ：
[Hasebe Takumi's Portfolio](https://intro.itto-takasaka.com/)

連絡先：　pro.only.21@gmail.com

<a id="4file"></a>