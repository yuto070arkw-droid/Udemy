# COBOL Reading Course Sample Programs

COBOL のソースコードを「読む力」を身につけるための講座用サンプル集です。各章は短いプログラムで構成し、予約語・DIVISION・SECTION・データ項目・制御構造を段階的に確認できます。

## 前提

- コンパイラ: GnuCOBOL 3.x 以降を想定
- 実行環境: Linux、macOS、または WSL
- 文字コード: UTF-8
- 学習目的: 業務ロジックを読むための基礎理解

## ディレクトリ構成

| 章 | 内容 |
|---|---|
| `01-hello` | 最小構成の COBOL プログラム |
| `02-input-output` | `ACCEPT` と `DISPLAY` |
| `03-calculation` | 四則演算と `COMPUTE` |
| `04-condition` | `IF` と `EVALUATE` |
| `05-loop` | `PERFORM` による繰り返し |
| `06-internal-subroutine` | 内部段落の呼び出し |
| `07-copybook` | `COPY` 句による共通定義 |
| `08-external-subroutine` | 外部サブプログラム呼び出し |
| `09-final-exercise` | 注文金額計算の総合演習 |
| `answers` | 読解演習の解答例 |
| `docs` | 環境構築・コンパイル・読解チェックリスト |

## 学習の進め方

1. `docs/environment-setup.md` で GnuCOBOL を準備します。
2. `docs/compile-commands.md` のコマンドで各プログラムをビルドします。
3. ソースを上から読み、`IDENTIFICATION`、`DATA`、`PROCEDURE` の役割を確認します。
4. 実行結果を予想してからプログラムを実行します。
5. `answers/reading-exercise-answers.md` で確認します。

## 基本コマンド例

```bash
cd cobol-reading-course/01-hello
cobc -x hello.cob -o hello
./hello
```

## 読解の観点

- どのデータ項目が入力・計算・出力に使われているか
- `PIC` 句で桁数や型がどう表現されているか
- 処理の入口と終了条件はどこか
- 条件分岐や繰り返しで値がどう変化するか
