# 環境構築

この講座では GnuCOBOL を使って COBOL プログラムをコンパイルします。

## Ubuntu / WSL

```bash
sudo apt update
sudo apt install gnucobol
cobc --version
```

## macOS

```bash
brew install gnucobol
cobc --version
```

## Windows

Windows では WSL 上の Ubuntu を使う方法が簡単です。

1. Microsoft Store から Ubuntu をインストールします。
2. Ubuntu のターミナルを開きます。
3. Ubuntu / WSL の手順で GnuCOBOL をインストールします。

## 確認方法

`cobc --version` を実行し、バージョン情報が表示されれば準備完了です。
