#!/bin/bash

# パッケージのインストール
echo "Installing necessary packages from package_list.txt..."
sudo dpkg --set-selections < package_list.txt
sudo apt-get update
sudo apt-get dselect-upgrade -y

# VSCodeのLaTeX自動コンパイル設定
VSCODE_SETTINGS_PATH="$HOME/.config/Code/User/settings.json"

echo "Setting up LaTeX auto-compilation configuration in VSCode..."

# 必要なディレクトリを作成
mkdir -p "$(dirname "$VSCODE_SETTINGS_PATH")"

# 設定内容
read -r -d '' SETTINGS_CONTENT << EOM
{
    "[tex]": {
        "editor.suggest.snippetsPreventQuickSuggestions": false,
        "editor.tabSize": 2
    },
    "[latex]": {
        "editor.suggest.snippetsPreventQuickSuggestions": false,
        "editor.tabSize": 2
    },
    "[bibtex]": {
        "editor.tabSize": 2
    },
    "latex-workshop.intellisense.package.enabled": true,
    "latex-workshop.latex.autoClean.run": "onBuilt",
    "latex-workshop.latex.clean.fileTypes": [
        "*.aux",
        "*.bbl",
        "*.blg",
        "*.idx",
        "*.ind",
        "*.lof",
        "*.lot",
        "*.out",
        "*.toc",
        "*.acn",
        "*.acr",
        "*.alg",
        "*.glg",
        "*.glo",
        "*.gls",
        "*.ist",
        "*.fls",
        "*.log",
        "*.fdb_latexmk",
        "*.snm",
        "*.nav",
        "*.dvi",
        "*.ilg",
        "*.synctex.gz"
    ],
    "latex-workshop.latex.outDir": "",
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex",
            "tools": ["xelatex"]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-shell-escape",
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-xelatex",
                "-outdir=%OUTDIR%",
                "%DOC%"
            ]
        }
    ]
}
EOM

# settings.jsonに設定を追加
echo "$SETTINGS_CONTENT" > "$VSCODE_SETTINGS_PATH"

echo "LaTeX auto-compilation configuration is complete. Please restart VSCode to apply changes."
