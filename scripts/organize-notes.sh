#!/bin/bash

# 笔记整理脚本
# 用法: ./scripts/organize-notes.sh [选项]
# 选项:
#   -c, --clean   清理临时文件
#   -s, --stats   显示统计信息
#   -b, --backup  创建备份

set -e

NOTES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$NOTES_DIR/../note-backup"
LOG_FILE="$NOTES_DIR/scripts/organize.log"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[$(date '+%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

show_stats() {
    log "📊 笔记统计信息"
    echo "========================================"
    
    # 文件统计
    total_files=$(find "$NOTES_DIR" -name "*.md" | wc -l)
    log "总 Markdown 文件数: $total_files"
    
    # 按目录统计
    echo ""
    log "按目录统计:"
    for dir in guides projects learning references daily templates; do
        if [ -d "$NOTES_DIR/$dir" ]; then
            count=$(find "$NOTES_DIR/$dir" -name "*.md" | wc -l)
            if [ $count -gt 0 ]; then
                echo "  $dir/: $count 个文件"
            fi
        fi
    done
    
    # 最近更新
    echo ""
    log "最近更新的文件:"
    find "$NOTES_DIR" -name "*.md" -exec stat -c "%y %n" {} \; | \
        sort -r | head -5 | while read line; do
        date=$(echo "$line" | awk '{print $1}')
        file=$(echo "$line" | awk '{print $4}')
        echo "  $date - ${file#$NOTES_DIR/}"
    done
    
    # 文件大小
    echo ""
    log "文件大小统计:"
    total_size=$(find "$NOTES_DIR" -name "*.md" -exec du -ch {} + | grep total | awk '{print $1}')
    log "总大小: $total_size"
}

create_backup() {
    log "💾 创建备份..."
    timestamp=$(date '+%Y%m%d_%H%M%S')
    backup_path="$BACKUP_DIR/note_backup_$timestamp"
    
    mkdir -p "$BACKUP_DIR"
    cp -r "$NOTES_DIR" "$backup_path"
    
    # 清理旧备份（保留最近7天）
    find "$BACKUP_DIR" -type d -name "note_backup_*" -mtime +7 -exec rm -rf {} \;
    
    log "备份完成: $backup_path"
}

clean_tmp_files() {
    log "🧹 清理临时文件..."
    
    # 清理空文件
    find "$NOTES_DIR" -name "*.md" -size 0 -delete
    
    # 清理临时文件
    find "$NOTES_DIR" -name "*.tmp" -delete
    find "$NOTES_DIR" -name "*.bak" -delete
    
    # 清理 ~ 结尾的备份文件
    find "$NOTES_DIR" -name "*~" -delete
    
    log "清理完成"
}

update_readme_stats() {
    log "📝 更新 README 统计信息..."
    
    # 更新总笔记数
    total_notes=$(find "$NOTES_DIR" -name "*.md" | wc -l)
    
    # 更新 README.md
    sed -i "s/总笔记数：.*/总笔记数：$total_notes/" "$NOTES_DIR/README.md"
    sed -i "s/最后更新：.*/最后更新：$(date +"%Y-%m-%d")/" "$NOTES_DIR/README.md"
    
    log "README 已更新"
}

main() {
    log "🚀 开始整理笔记..."
    
    case "${1:-}" in
        -s|--stats)
            show_stats
            ;;
        -b|--backup)
            create_backup
            ;;
        -c|--clean)
            clean_tmp_files
            ;;
        *)
            # 默认执行所有操作
            create_backup
            clean_tmp_files
            update_readme_stats
            show_stats
            ;;
    esac
    
    log "✅ 整理完成！"
}

main "$@"
