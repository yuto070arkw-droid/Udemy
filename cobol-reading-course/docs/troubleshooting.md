# トラブルシューティング

## `cobc: command not found`

GnuCOBOL がインストールされていません。`docs/environment-setup.md` を確認してインストールしてください。

## `COPY file not found`

`COPY` 対象の `.cpy` ファイルがあるディレクトリでコンパイルしてください。必要に応じて `-I` オプションで copybook の検索パスを指定します。

```bash
cobc -x copy-main.cob -I . -o copy-main
```

## 日本語が文字化けする

ターミナルの文字コードを UTF-8 に設定してください。WSL や macOS の標準ターミナルでは通常 UTF-8 が使われます。

## 外部サブルーチンが見つからない

呼び出し元と呼び出し先を同時にコンパイルしてください。

```bash
cobc -x main.cob calcsub.cob -o external-main
```
