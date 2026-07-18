# コンパイルコマンド集

各ディレクトリで以下のコマンドを実行します。

## 01-hello

```bash
cd cobol-reading-course/01-hello
cobc -x hello.cob -o hello
./hello
```

## 02-input-output

```bash
cd cobol-reading-course/02-input-output
cobc -x input-output.cob -o input-output
./input-output
```

## 03-calculation

```bash
cd cobol-reading-course/03-calculation
cobc -x arithmetic.cob -o arithmetic
./arithmetic
cobc -x compute.cob -o compute
./compute
```

## 04-condition

```bash
cd cobol-reading-course/04-condition
cobc -x if-sample.cob -o if-sample
./if-sample
cobc -x evaluate-sample.cob -o evaluate-sample
./evaluate-sample
```

## 05-loop

```bash
cd cobol-reading-course/05-loop
cobc -x perform-times.cob -o perform-times
./perform-times
cobc -x perform-until.cob -o perform-until
./perform-until
cobc -x perform-varying.cob -o perform-varying
./perform-varying
```

## 06-internal-subroutine

```bash
cd cobol-reading-course/06-internal-subroutine
cobc -x internal-subroutine.cob -o internal-subroutine
./internal-subroutine
```

## 07-copybook

```bash
cd cobol-reading-course/07-copybook
cobc -x copy-main.cob -o copy-main
./copy-main
```

## 08-external-subroutine

```bash
cd cobol-reading-course/08-external-subroutine
cobc -x main.cob calcsub.cob -o external-main
./external-main
```

## 09-final-exercise

```bash
cd cobol-reading-course/09-final-exercise
cobc -x order-main.cob taxcalc.cob -o order-main
./order-main
```
