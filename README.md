## robosys2024
ロボットシステム学の練習リポジトリ

# PCCS色相環

![test](https://github.com/Leftback/robosys2024/actions/workflows/test.yml/badge.svg)

## 概要

標準入力から読み込んだ１～２４の色相番号に対して、PCCSの色相記号及び日本語の色相名を出力するスクリプトです。入力は全角・半角のどちらにも対応しています。

## 使用方法
### Githubからのクローンと実行の手順

* 1,下記のコマンドでリポジトリのクローンを行ってください。
    ```
    git clone https://github.com/Leftback/robosys2024
    ```
* 2,下記のコマンドでディレクトリに移動してください。
    ```
    cd robosys2024
    ```

* 3,下記のようにecho のあとに１～２４のいづれかの数字を入力してください。
    ```
    echo 1~24のいづれかの数字 |./PCCS_color
    ```

* 4,入力された色相番号に対応したPCCSの色相記号及び日本語の色相名が出力されます。
    ```
    色相記号/日本語の色相名
    ```

## 実行例
### 正常な入力に対する出力
* 半角数字
   > echo 1 |./PCCS_color

   > 1:pR/紫みの赤

* 全角数字
   > echo １ |./PCCS_color

   > 1:pR/紫みの赤

### 異常な入力に対する出力
* 指定範囲外の数字
   > echo 25 |./PCCS_color

   > 入力が範囲外です。1～24の数値を入力してください。

   > echo 0 |./PCCS_color

   > 入力が範囲外です。1～24の数値を入力してください。

* 小数
   > echo 1.5 |./PCCS_color

   > 無効な入力です。数値を入力してください。

* 文字
   > echo a |./PCCS_color

   > 無効な入力です。数値を入力してください。

* 未入力
   > echo |./PCCS_color

   > 無効な入力です。数値を入力してください。

* スペース
   > echo   |./PCCS_color

   >無効な入力です。数値を入力してください。 

## 用語の補足説明
* PCCS（Practical Color Co-ordinate System、日本色研配色体系）は、色彩調和を目的として日本で開発されたカラーシステムです。ヒュー(Hue)と呼ぶ色相と、明度と彩度をまとめたトーン(Tone)で色を整理し、表示します。これをヒュートーンシステムと呼びます。
* 色相環は２４色相で構成され、心理四原色(赤、黄、緑、青)を基にしています。

# 環境
## 必要なソフトウェア
* Python
  * テスト済みバージョン: 3.7~3.10

## テスト環境
* ubuntu20.04 on Windows

## ライセンス
* このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。
* このパッケージのPCCS_color,test.bash以外のコードは, 下記のスライド（CC-BY-SA 4.0 by ryuichi ueda）のものを, 本人の許可を得て自身の著作としたものです.
  * https://github.com/ryuichiueda/slides_marp/tree/master/robosys2024
- © 2024 Leftback
