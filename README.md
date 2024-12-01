# statistics

![test](https://github.com/Leftback/robosys2024/actions/workflows/test.yml/badge.svg)

## 概要

標準入力から読み込んだ数列に対して、平均値、最頻値、中央値、最大値、最小値、範囲、四分位数、四分位偏差、分散、および標準偏差を計算して出力します。

## 使用方法
### Githubからのクローンと実行の手順

* 1,リポジトリのクローン: 以下のコマンドをコピーして、ターミナルまたはコマンドプロンプトで実行します。
    ```
    git clone https://github.com/Leftback/robosys2024/blob/main/statistics
    ```
    ```
    cd statistics
    ```
* 2,実行権限の付与: スクリプトに実行権限を付与します。
    ```
　　chmod +x statistics
    ```
* 3,スクリプトの実行: 以下のコマンドを実行してスクリプトを実行します。
    ```
　　./statistics
    ```
* 4,データの入力: プロンプトが表示されたら、カンマで区切られた任意の数列を入力します。
    >数列をカンマ区切りで入力: 1,2,3,4,5
* 5,出力: 計算された結果が表示されます。
    >平均値: 3
    >最頻値: No unique mode
    >中央値: 3
    >最大値: 5
    >最小値: 1
    >範囲: 4
    >第一四分位数: 1.75
    >第二四分位数（中央値）: 3
    >第三四分位数: 4.25
    >四分位偏差: 1.25
    >分散: 2.5
    >標準偏差: 1.5811388300841898

## 必要条件

* Python
  * テスト済みバージョン: 3.7~3.10
* statisticsモジュール（Python標準ライブラリに含まれています）

## テスト環境

* Ubuntu

## ライセンス

* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
* © 2024 Leftback

