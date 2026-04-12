# Udemy模試作成 ワークスペース

Udemy講座用として、アジャイルソフトウェア開発試験（Lv1〜Lv2相当）対策の模試を作成するための作業フォルダ。

目標は、**本番で迷うが正解は一意**の品質を維持しながら、最終的に **180問** を完成させること。

## 目的

- 実務シナリオベースの4択問題を作る
- 10問単位で作成、レビュー、修正を回す
- Excel管理形式で蓄積し、最終的にUdemy投入用へ整形する

## 現在の進捗

- `Q1〜Q20` 作成済み
- `Q1〜Q10` はレビュー完了済み
- 模擬試験と公式参考書の参照メモを整理済み

## 再整理後のフォルダ構成

```text
UdemyWork/
├─ README.md
├─ docs/
│  ├─ project/
│  └─ rules/
│     ├─ authoring_rules.md
│     ├─ review_checklist.md
│     └─ domains.md
├─ references/
│  ├─ official/
│  │  └─ official_question_notes.md
│  ├─ mock-exams/
│  │  └─ mock_exam_round1_notes.md
│  └─ strategy/
│     ├─ udemy_trap_points.md
│     └─ harder_question_design_rules.md
├─ drafts/
│  └─ batches/
│     └─ q011_q020.md
├─ data/
│  └─ excel/
│     ├─ reviewed/
│     │  ├─ Agile_Q1_10.xlsx
│     │  └─ Agile_Q11_20.xlsx
│     └─ master/
└─ export/
   └─ udemy_import_text/
```

## フォルダの役割

- `docs/rules/`
  作問ルール、レビュー観点、ドメイン定義を置く
- `references/official/`
  公式参考書・公式問題の判断軸を整理したメモを置く
- `references/mock-exams/`
  模擬試験の論点、誤答パターン、難易度所感を整理したメモを置く
- `references/strategy/`
  Udemy用に強化したい引っかけや学習価値の観点を置く
- `drafts/batches/`
  10問単位の下書きファイルを置く
- `data/excel/reviewed/`
  レビュー済み、またはレビュー反映済みの分割Excelを置く
- `data/excel/master/`
  最終集約用のマスターExcelを置く
- `export/udemy_import_text/`
  Udemy投入用の整形済みファイルを置く

## 使い方

1. `docs/rules/authoring_rules.md` を確認する
2. `references/official/official_question_notes.md` で原則を確認する
3. `references/mock-exams/mock_exam_round1_notes.md` で誤答パターンを確認する
4. `references/strategy/udemy_trap_points.md` で引っかかりポイントを確認する
5. `references/strategy/harder_question_design_rules.md` で本試験寄りに難化させる観点を確認する
6. `drafts/batches/` に10問単位で下書きを作る
7. 確定したら `data/excel/reviewed/` にExcelとして保存する
8. 最終的に `data/excel/master/` へ集約する

## 作問方針

- 実務シナリオベース
- 正解は一意
- 誤答も自然でそれっぽくする
- 用語暗記ではなく理解を問う
- 本試験で迷うレベルにする
- `スクラムマスター` ではなく `チームリーダー` を使う
- 曖昧な `チーム` 表現は避け、必要に応じて `開発チーム` を使う

## 参照メモの使い分け

- `official_question_notes.md`
  公式の判断軸、原則、出題傾向の確認用
- `mock_exam_round1_notes.md`
  模擬試験の選択肢構造、誤答の崩し方、難易度感の確認用
- `udemy_trap_points.md`
  受験者が引っかかりやすい誤解を、Udemy用問題へ反映するためのメモ
- `harder_question_design_rules.md`
  模試2回分では足りなかった難度を補い、本試験寄りへ難化させるための設計ルール

## 次の作業候補

- `Q21〜Q30` の作成
- `data/excel/master/Agile_180Q_Master.xlsx` の作成
- ドメインと難易度の偏りチェック
