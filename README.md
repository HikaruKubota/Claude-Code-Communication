# 🤖 Tmux Multi-Agent Communication Demo

Agent同士がやり取りするtmux環境のデモシステム

## 🎯 デモ概要

PRESIDENT → BOSS → Workers の階層型指示システムを体感できます

### 👥 エージェント構成

```
📊 PRESIDENT セッション (1ペイン)
└── PRESIDENT: プロジェクト統括責任者

📊 multiagent セッション (4ペイン)  
├── boss1: チームリーダー
├── worker1: バックエンド担当
├── worker2: フロントエンド担当
└── worker3: QA担当
```

## 🚀 クイックスタート

### 0. リポジトリのクローン

```bash
git clone https://github.com/nishimoto265/Claude-Code-Communication.git
cd Claude-Code-Communication
```

### 1. tmux環境構築

⚠️ **注意**: 既存の `multiagent` と `president` セッションがある場合は自動的に削除されます。

```bash
./setup.sh
```

### 2. 画面確認

setup.shを実行すると、現在のターミナルが自動的に4分割画面（multiagentセッション）に切り替わります。

別ターミナルでPRESIDENTセッションを確認する場合：
```bash
tmux attach-session -t president
```

### 3. Claude Code起動

setup.shを実行すると、各ペインで自動的にClaude Codeが起動します。
初回起動時は認証が必要になる場合があります。

### 4. デモ実行

別ターミナルでPRESIDENTセッションにアタッチし、以下を入力：
```
あなたはpresidentです。指示書に従って
```

または、現在のセッションから送信：
```bash
./agent-send.sh president "あなたはpresidentです。指示書に従って"
```

## 📜 指示書について

各エージェントの役割別指示書：
- **PRESIDENT**: `instructions/president.md`
- **boss1**: `instructions/boss.md` 
- **worker1**: `instructions/worker1_backend.md` (バックエンド担当)
- **worker2**: `instructions/worker2_frontend.md` (フロントエンド担当)
- **worker3**: `instructions/worker3_qa.md` (QA担当)

**Claude Code参照**: `CLAUDE.md` でシステム構造を確認

**作業フロー:**
- **PRESIDENT**: 「あなたはpresidentです。指示書に従って」→ boss1に指示送信
- **boss1**: PRESIDENT指示受信 → worker1,2に並行作業指示 → 両者完了後worker3に指示
- **worker1,2**: バックエンド/フロントエンド作業実行 → 個別に完了報告
- **worker3**: worker1,2完了確認後、QAテスト実行 → 完了報告

## 🎬 期待される動作フロー

```
1. PRESIDENT → boss1: "あなたはboss1です。Hello World プロジェクト開始指示"
2. boss1 → worker1,2: バックエンド/フロントエンド作業を並行で指示
3. worker1 → boss1: "バックエンド作業完了しました"
4. worker2 → boss1: "フロントエンド作業完了しました"
5. boss1 → worker3: "バックエンドとフロントエンドの実装が完了しました。QAテストを実行してください"
6. worker3 → boss1: "QAテスト完了しました"
7. boss1 → PRESIDENT: "全員完了しました"
```

## 🔧 手動操作

### agent-send.shを使った送信

```bash
# 基本送信
./agent-send.sh [エージェント名] [メッセージ]

# 例
./agent-send.sh boss1 "緊急タスクです"
./agent-send.sh worker1 "作業完了しました"
./agent-send.sh president "最終報告です"

# エージェント一覧確認
./agent-send.sh --list
```

## 🧪 確認・デバッグ

### ログ確認

```bash
# 送信ログ確認
cat logs/send_log.txt

# 特定エージェントのログ
grep "boss1" logs/send_log.txt

# 完了ファイル確認
ls -la ./tmp/worker*_done.txt
```

### セッション状態確認

```bash
# セッション一覧
tmux list-sessions

# ペイン一覧
tmux list-panes -t multiagent
tmux list-panes -t president
```

## 🔄 環境リセット

```bash
# セッション削除
tmux kill-session -t multiagent
tmux kill-session -t president

# 完了ファイル削除
rm -f ./tmp/worker*_done.txt

# 再構築（自動クリア付き）
./setup.sh
```

---

🚀 **Agent Communication を体感してください！** 🤖✨ 