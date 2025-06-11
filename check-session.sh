#!/bin/bash
# 現在のセッション名を確認するスクリプト

# tmux内かどうか確認
if [ -z "$TMUX" ]; then
    echo "❌ 現在tmuxセッション内にいません"
    exit 1
fi

# セッション名を取得
SESSION_NAME=$(tmux display-message -p '#S')
echo "📍 現在のセッション: $SESSION_NAME"

# エージェント判定
case "$SESSION_NAME" in
    "president")
        echo "👑 あなたはPRESIDENTです"
        echo "役割: プロジェクト統括責任者"
        echo "指示書: ./instructions/president.md"
        ;;
    "multiagent")
        # ペイン番号でエージェントを判定
        PANE_INDEX=$(tmux display-message -p '#P')
        case "$PANE_INDEX" in
            "0")
                echo "🎯 あなたはboss1です"
                echo "役割: チームリーダー"
                echo "指示書: ./instructions/boss.md"
                ;;
            "1")
                echo "👷 あなたはworker1（バックエンド担当）です"
                echo "役割: バックエンド開発・API実装"
                echo "指示書: ./instructions/worker1_backend.md"
                ;;
            "2")
                echo "👷 あなたはworker2（フロントエンド担当）です"
                echo "役割: フロントエンド開発・UI/UX実装"
                echo "指示書: ./instructions/worker2_frontend.md"
                ;;
            "3")
                echo "👷 あなたはworker3（QA担当）です"
                echo "役割: 品質保証・テスト実行"
                echo "指示書: ./instructions/worker3_qa.md"
                ;;
            *)
                echo "❓ 不明なペイン番号: $PANE_INDEX"
                ;;
        esac
        ;;
    *)
        echo "❓ 不明なセッション: $SESSION_NAME"
        ;;
esac