# README

## 名前

塾内データ管理アプリ

## 概要

授業報告、通知表、定期試験結果、模試、単語テストを管理できるアプリケーションです。

## 詳細 

| 機能名 | 機能詳細 |
| ------------- | ------------- |
| 授業報告  | 生徒、教科、授業報告本文、その授業での理解度を登録  |
| 通知表  | 生徒、学年、学期、9教科の成績を数字で登録。また、通知表の提出をしていない生徒を一覧で表示  |
| 定期試験  | 生徒、学年、試験名、9教科の得点を数字で登録。また、定期試験結果を提出していない生徒を一覧で表示  |
| 小テスト  | 毎週行われる小テストの結果を西暦、月と含めて登録。また、小テストを行っていない生徒を一覧で表示  |
| 単語テスト  | 毎週行われる単語テストの得点を登録  |
| 生徒  | 生徒氏名、学校、生まれ年、心理テストの結果を登録  |
| 学校  | 小中高、学校名を登録  |
| 講師  | 講師氏名、各講師ページへのリンクを表示  |
| 生徒ページ  | 各生徒の授業報告、担当講師、小テスト、通知表、定期試験、単語テストを一覧で表示。また、通知表、定期試験はグラフを表示  |
| 講師ページ  | 各講師が登録した授業報告、担当生徒、小テスト、通知表、定期試験、単語テストを一覧で表示  |

## 使い方

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

## 本番環境

- Ruby : 2.5.1
- Rails : 5.2.4.4
> - bundler : 2.1.4
- MySQL : 8.0
- EC2 VPC CertificateManager Route53
- Nginx
- Unicorn

## インストール方法

## ライセンス

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
