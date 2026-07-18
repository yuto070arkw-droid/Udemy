# 読解演習 解答例

## 01-hello

- 処理の入口は `PROCEDURE DIVISION` です。
- `DISPLAY` 文で文字列を標準出力に表示します。
- `STOP RUN` でプログラムを終了します。

## 02-input-output

- `ACCEPT WS-NAME` が入力処理です。
- `STRING` 文で固定文字列と入力値を結合します。
- `DELIMITED BY SPACE` により、名前の末尾空白を除いて結合します。

## 03-calculation

- `arithmetic.cob` は `ADD`、`SUBTRACT`、`MULTIPLY`、`DIVIDE` の基本形を示します。
- `compute.cob` は式として計算をまとめて書く `COMPUTE` の例です。
- `9V99` は小数点位置を暗黙的に表す表記です。

## 04-condition

- `IF` は単純な二分岐に向いています。
- `EVALUATE` は複数条件の分岐に向いています。
- `WHEN OTHER` はどの条件にも一致しない場合の処理です。

## 05-loop

- `PERFORM 5 TIMES` は回数固定の繰り返しです。
- `PERFORM UNTIL` は条件が真になるまで繰り返します。
- `PERFORM VARYING` はカウンタを初期値から増減させながら繰り返します。

## 06-internal-subroutine

- `CALCULATE-AMOUNT` と `DISPLAY-RESULT` は内部段落です。
- `PERFORM 段落名` で同じプログラム内の処理を呼び出します。

## 07-copybook

- `COPY "customer-data.cpy"` により共通データ定義を取り込みます。
- 複数プログラムで同じレコード定義を使う場合に便利です。

## 08-external-subroutine

- `CALL "CALCSUB" USING ...` が外部サブプログラム呼び出しです。
- 呼び出される側は `LINKAGE SECTION` と `PROCEDURE DIVISION USING` で引数を受け取ります。
- `GOBACK` は呼び出し元へ戻ります。

## 09-final-exercise

- 注文データの定義は `order-data.cpy` に分離されています。
- 注文金額は内部段落で計算します。
- 税額は外部サブプログラム `TAXCALC` で計算します。
- 最終的な合計は `ORDER-AMOUNT + TAX-AMOUNT` です。
