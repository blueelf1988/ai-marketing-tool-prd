#!/usr/bin/env bash
# 一键安装 ai-marketing-tool-prd skill 到 Claude Code 用户级 skills 目录
set -euo pipefail

SKILL_NAME="ai-marketing-tool-prd"
SRC="$(cd "$(dirname "$0")" && pwd)/skills/$SKILL_NAME"
DEST="$HOME/.claude/skills/$SKILL_NAME"

if [ ! -d "$SRC" ]; then
  echo "✗ 找不到源目录: $SRC（请确认在仓库根目录运行）" >&2
  exit 1
fi

if [ -e "$DEST" ]; then
  echo "! 已存在 $DEST，备份为 ${DEST}.bak"
  rm -rf "${DEST}.bak"
  mv "$DEST" "${DEST}.bak"
fi

mkdir -p "$HOME/.claude/skills"
cp -r "$SRC" "$DEST"
echo "✓ 已安装到 $DEST"
echo "  （重启 Claude Code 后输入 /$SKILL_NAME 即可使用）"
