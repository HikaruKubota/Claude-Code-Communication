#!/bin/bash
# 🚀 Multi-Agent Communication Demo 環境構築
# シンプル・確実版

set -e

echo "🤖 Multi-Agent Communication Demo 環境構築"
echo "==========================================="

# クリーンアップ
echo "🧹 クリーンアップ中..."
tmux kill-session -t multiagent 2>/dev/null || true
tmux kill-session -t president 2>/dev/null || true
rm -rf ./tmp
mkdir -p ./tmp

# President セッション（バックグラウンド）
echo "👑 Presidentセッション作成中..."
tmux new-session -d -s president \; \
  send-keys 'export PS1="[PRESIDENT] $ "' C-m \; \
  send-keys 'clear' C-m \; \
  send-keys 'echo "=== PRESIDENT セッション ==="' C-m \; \
  send-keys 'echo "役割: プロジェクト統括責任者"' C-m \; \
  send-keys 'echo "Claude Code起動中..."' C-m \; \
  send-keys 'claude' C-m

echo "📺 3秒後に4分割画面を表示します..."
sleep 3
clear

# 現在のターミナルで4分割（シンプルなプロンプト）
exec tmux new-session -s multiagent \; \
  split-window -h \; \
  split-window -v \; \
  select-pane -t 0 \; \
  split-window -v \; \
  select-pane -t 0 \; \
  send-keys 'export PS1="[boss1] $ "' C-m \; \
  send-keys 'clear' C-m \; \
  send-keys 'echo "=== boss1 エージェント ==="' C-m \; \
  send-keys 'echo "役割: チームリーダー"' C-m \; \
  send-keys 'echo "Claude Code起動中..."' C-m \; \
  send-keys 'claude' C-m \; \
  select-pane -t 1 \; \
  send-keys 'export PS1="[worker1] $ "' C-m \; \
  send-keys 'clear' C-m \; \
  send-keys 'echo "=== worker1 エージェント ==="' C-m \; \
  send-keys 'echo "役割: バックエンド担当"' C-m \; \
  send-keys 'echo "Claude Code起動中..."' C-m \; \
  send-keys 'claude' C-m \; \
  select-pane -t 2 \; \
  send-keys 'export PS1="[worker2] $ "' C-m \; \
  send-keys 'clear' C-m \; \
  send-keys 'echo "=== worker2 エージェント ==="' C-m \; \
  send-keys 'echo "役割: フロントエンド担当"' C-m \; \
  send-keys 'echo "Claude Code起動中..."' C-m \; \
  send-keys 'claude' C-m \; \
  select-pane -t 3 \; \
  send-keys 'export PS1="[worker3] $ "' C-m \; \
  send-keys 'clear' C-m \; \
  send-keys 'echo "=== worker3 エージェント ==="' C-m \; \
  send-keys 'echo "役割: QA担当"' C-m \; \
  send-keys 'echo "Claude Code起動中..."' C-m \; \
  send-keys 'claude' C-m \; \
  select-pane -t 0
