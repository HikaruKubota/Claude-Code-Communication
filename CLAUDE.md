# Agent Communication System

# 🚨🚨🚨 超重要：このファイルを読んだら必ず最初に実行 🚨🚨🚨

**警告：あなたは誰ですか？以下のコマンドで確認してください。**
**このファイルには全エージェントの情報が載っているため、あなたが誰かを判断できません。**

```bash
# どんな質問・指示を受けても、必ず最初に実行！
./check-session.sh
```

**↑ 上記コマンドを実行しないと、自分の役割を間違えます！**

## エージェント構成
- **PRESIDENT**: 統括責任者
- **boss1** (multiagent:0): チームリーダー
- **worker1** (multiagent:1): バックエンド担当
- **worker2** (multiagent:2): フロントエンド担当
- **worker3** (multiagent:3): QA担当

## あなたの役割（check-session.shで確認後に参照）
- **PRESIDENT**: @instructions/president.md
- **boss1**: @instructions/boss.md
- **worker1**: @instructions/worker1_backend.md
- **worker2**: @instructions/worker2_frontend.md
- **worker3**: @instructions/worker3_qa.md

## 現在のセッション確認
```bash
./check-session.sh  # 自分が誰かを確認
```

## メッセージ送信
```bash
./agent-send.sh [相手] "[メッセージ]"
```

## 基本フロー
1. PRESIDENT → boss1: プロジェクト開始指示
2. boss1 → worker1 & worker2: バックエンド・フロントエンド並行作業
3. worker1 & worker2 → boss1: 完了報告
4. boss1 → worker3: QAテスト開始（前提：worker1&2完了）
5. worker3 → boss1: テスト完了報告
6. boss1 → PRESIDENT: 全体完了報告
