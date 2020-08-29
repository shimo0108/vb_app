# LET'S VOLLEY BALL

![8C28C274-4E6C-4342-A39D-DEDAC0F4C78B](https://user-images.githubusercontent.com/60634601/90243285-93c03100-de69-11ea-9e5a-b43901b4a8da.jpeg)


* 使用した技術<hr>
Ruby 2.6.5 <br>
Ruby on Rails 5.2<br>
Bootstrap4<br>
JavaScript<br>
Jquery<br>
Git<br>
GitHub<br>
PostgreSQL<br>
Docker<br>
AWS(VPC EC2 RDS)<br>

* データベースのER図<hr>

![データベーススキーマ (1)](https://user-images.githubusercontent.com/60634601/91532999-19ec7500-e94a-11ea-8d44-cf6f43eb747d.png)

作成ツールはcacooを使用。Cacooのデータベーススキーマ構成図の挿入機能を利用しデータベースの内容を変更してもゼロからやり直す必要がないよう一括変更できるように管理しています。データベースはpostgreSQLを採用。PgAdmin4を使用しcsvファイルからデータを取り込んでいます。

* データベースのER図<hr>

![AWS Integration ap-northeast-1](https://user-images.githubusercontent.com/60634601/91628481-106f1580-e9fb-11ea-85ed-61e9312b8061.png)


* 実装した機能<hr>
ユーザーログイン/ログアウト機能（Deviseを使用）<br>
かんたんログイン機能<br>
Twitter/facebook連携ログイン<br>
ページネーション機能<br>
一般的なCRUD機能<br>
ユーザー/チーム検索機能<br>
画像アップロード機能（ActiveStorage使用）<br>
ダイレクトメッセージ機能<br>
フォロー機能<br>
Twitterカード機能<br>
レスポンシブ対応<br>


ユーザーログイン
![vb_app1-min](https://user-images.githubusercontent.com/60634601/90308022-d8ee6c80-df16-11ea-9e7f-ae24f505d2e8.gif)

deviseを使用しログイン。ログアウトの機能を実装しました。

<hr>
かんたんログイン機能<br>

![vb_app_2-min](https://user-images.githubusercontent.com/60634601/90353552-7bc2fa00-e081-11ea-8674-e9b8043399ea.gif)

ポートフォリオとしてより多くのユーザー様にお使い頂けるようボタンひとつでログインできるよう実装しました。

<hr>
Twitter/facebook連携ログイン<br>

![vb_app_3-min](https://user-images.githubusercontent.com/60634601/90353601-972e0500-e081-11ea-89cc-218a481996af.gif)

gem "omniauth-twitter", "omniauth-facebook"を使用、twitter,facebookアカウントを使用してログインできるよう実装してあります。

<hr>
ページネーション機能<br>

![vb_app_4-min](https://user-images.githubusercontent.com/60634601/90353653-bc227800-e081-11ea-9c3a-b7755271b769.gif)

gem "kaminari"を使用、フォロー、フォロワーユーザー一覧画面、プレイヤー、チーム検索画面において実装してあります。

<hr>
一般的なCRUD機能<br>

![vb_app_5-min](https://user-images.githubusercontent.com/60634601/90353675-ce9cb180-e081-11ea-9d7d-9f30b66961a0.gif)

プレイヤー、チームの登録、編集、削除が行えます。ポジション選択では複数タグを選択できるよう設計しました。

<hr>
ユーザー/チーム検索機能<br>

![vb_app_6-min](https://user-images.githubusercontent.com/60634601/90353708-ed02ad00-e081-11ea-8fca-f84497636eb4.gif)

gem "ransack"を使用。性別、ポジション、練習参加可能日、都道府県から希望に合う条件を指定し、検索を行えるようにしています。<br>
また検索後は「クリア」ボタンで検索結果をクリアすることもできます。

<hr>
画像アップロード機能（ActiveStorage使用）<br>

![vb_app_7-min](https://user-images.githubusercontent.com/60634601/90353725-fc81f600-e081-11ea-9763-22c564ca20a4.gif)

ActiveStorageを使用しユーザーのプロフィール画像を登録できるよう実装しました。

<hr>
ダイレクトメッセージ機能<br>

![vb_app_8](https://user-images.githubusercontent.com/60634601/90353746-0d326c00-e082-11ea-8579-735fa8a1fb3a.gif)

ユーザーごとに個別でメールできる機能を実装。自分と相手のメッセージが視覚的にわかりやすくなるよう吹き出しの向きを変えられるよう実装しました。

<hr>
フォロー機能<br>

![vb_app_9-min](https://user-images.githubusercontent.com/60634601/90335075-0584b000-e00d-11ea-9685-075ede1b46b4.gif)

自分の気に入ったユーザーをフォローできるようフォロー、フォロワー機能を実装しました。

<hr>
Twitterカード機能<br>

![vb_app_10-min](https://user-images.githubusercontent.com/60634601/90353776-22a79600-e082-11ea-9651-8874dad82e31.gif)

ツイッターに自身のポートフォリオをシェアできるよう実装しました。

<hr>
レスポンシブ対応<br>

![vb_app_11-min](https://user-images.githubusercontent.com/60634601/90353815-45d24580-e082-11ea-8aad-4db21a257094.gif)

スマホ、タブレットからでもポートフォリオを見ていただくためにレスポンシブ対応のポートフォリオを作成しました。
<hr>
