# My Todo
「重要性」と「緊急性」を軸にあなたのタスクを管理するアプリです。
http://175.41.230.217/users/sign_in

# 概要
長期的な目標を立てる、身体を鍛える、ルーティーンで発生している業務を無くす仕組みづくり等、  やらなければいけないとわかっていてもついつい後回しになりがちな「重要だけど緊急性は低い」タスクに  どれだけ時間を使えているかを視覚化することで、日々の改善に繋がるアプリです。

## デモ
タスクを追加すると画面左「未設定」のカウントが変わります。<br>
[![Image from Gyazo](https://i.gyazo.com/e215bb09632769c9a9cded798feca578.gif)](https://gyazo.com/e215bb09632769c9a9cded798feca578)

編集画面から優先度を選択するとトップページ画面左のカウントが変わります。<br>
[![Image from Gyazo](https://i.gyazo.com/652bd015b2b1015b11b6a5893ffd56e3.gif)](https://gyazo.com/652bd015b2b1015b11b6a5893ffd56e3)

# 機能
* ユーザー登録とログイン(ゲスト閲覧用ログイン有)
* タスクの追加
* タスクの編集（タスク名修正,優先度選択,期限設定)
* タスクの削除
* 分類された優先度のカウント
* 分類された優先度の割合算出

# 使い方
1. 画面右下の「ゲストログイン(閲覧用)」を選択
1. 画面下部の「＋タスク追加」フォームからタスクを入力
1. 入力したタスクのタスク名を選択すると編集画面に遷移
1. 編集画面でタスク名修正、優先度を選択、期限日を設定し更新ボタンでトップページに戻る
1. タスク名の横の「○」をクリックするとタスクが削除される

# 技術
* Ruby : 2.5.1
* Rails : 5.2.3
* インフラ : AWS
* WEBサーバー : Nginx
* Devise : ログイン機能
* ajax : タスク追加と削除
* RSpec : テストコード
* コードレビュー : Rubocop
* 自動デプロイ : Capistrano

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|email|string|null: false, unique:true|
|password|string|null: false, unique:true|
### Association
- has_many: tasks

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|priority|string||
|deadline|date||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to: user

# ライセンス
This project is licensed free.  
ご自由にご利用ください