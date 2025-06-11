# Agent Communication System

## セットアップ
```bash
./setup.sh  # 4分割画面でtmuxセッションを作成し、各ペインでClaude Codeを自動起動
```

## エージェント構成
- **PRESIDENT** (現在のセッション): 統括責任者
- **boss1** (multiagent:0): チームリーダー
- **worker1** (multiagent:1): バックエンド担当
- **worker2** (multiagent:2): フロントエンド担当
- **worker3** (multiagent:3): QA担当

## あなたの役割
- **PRESIDENT**: @instructions/president.md
- **boss1**: @instructions/boss.md
- **worker1**: @instructions/worker1_backend.md
- **worker2**: @instructions/worker2_frontend.md
- **worker3**: @instructions/worker3_qa.md

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