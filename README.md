# オブジェクトストアから古いバックアップを枝刈りするスクリプト

## 使い方

環境変数か`prune_cloud_backup.env`から以下の変数を読みます。

* `S3_BUCKET` 対象のS3バケット姪
* `S3_PREFIX` S3の検索prefix (省略可能)
* `EXPIRE_HOURLY` この日数は全てのバックアップファイルを保存
* `EXPIRE_DAILY` この日数は日次バックアップを保存

現在はAmazon S3のみ対応です。AWS CLIと[jq](https://stedolan.github.io/jq/)が必要です。

## 動作

以下のように動作します。

* `EXPIRE_HOURLY`で指定した日数は全てのバックアップファイルを保存
* それを超えると、`EXPIRE_DAILY`で指定した日数は、その日の最初のバックアップのみを残して削除
* それを超えると、その月の最初のバックアップのみを残して削除

## 権限

IAM RoleなどでAWS CLIがそのまま動く環境を想定しています。
コマンドラインオプション等でキーを指定する機能はありません。

TODO: 未チェック

* S3
  * s3:ListObject
  * s3:DeleteObject

