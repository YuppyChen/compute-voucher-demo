#!/bin/bash
# Git 仓库发布脚本

echo "=== 算力券演示系统 - Git 仓库发布 ==="
echo ""

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "发现未提交的更改，正在添加..."
    git add -A
    git commit -m "更新项目文件"
fi

# 显示当前提交历史
echo "当前提交历史："
git log --oneline -3
echo ""

# 检查远程仓库
if git remote | grep -q origin; then
    echo "已配置远程仓库："
    git remote -v
    echo ""
    echo "正在推送到远程仓库..."
    git push -u origin main
else
    echo "未配置远程仓库。"
    echo ""
    echo "请按以下步骤操作："
    echo ""
    echo "1. 在 GitHub/GitLab/Bitbucket 创建新仓库"
    echo "2. 复制仓库地址（例如：https://github.com/username/repo.git）"
    echo "3. 运行以下命令添加远程仓库："
    echo "   git remote add origin <你的仓库地址>"
    echo "4. 然后推送代码："
    echo "   git push -u origin main"
    echo ""
    echo "或者直接运行："
    echo "   git remote add origin <你的仓库地址>"
    echo "   git push -u origin main"
fi

