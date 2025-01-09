# 環境構築
1. 環境構築スクリプトの実行を許可する。
```bash
chmod +x setup_env.sh
```
2. 環境構築スクリプトを実行する。
```bash
./setup_env.sh
```


# 手動実行手順

## 必要なパッケージのインストール
```bash
sudo dpkg --set-selections < package_list.txt
sudo apt-get update
sudo apt-get dselect-upgrade
```

## latex × vscodeの自動コンパイル設定。
- ワークスペースの推奨拡張機能をインストールし、settings.jsonに以下の設定を追加する。
```json　23VR008N_高林秀_20241206
{
    "[tex]": {
        // スニペット補完中にも補完を使えるようにする
        "editor.suggest.snippetsPreventQuickSuggestions": false,
        // インデント幅を2にする
        "editor.tabSize": 2
    },

    "[latex]": {
        // スニペット補完中にも補完を使えるようにする
        "editor.suggest.snippetsPreventQuickSuggestions": false,
        // インデント幅を2にする
        "editor.tabSize": 2
    },

    "[bibtex]": {
        // インデント幅を2にする
        "editor.tabSize": 2
    },


    // ---------- LaTeX Workshop ----------
    // 使用パッケージのコマンドや環境の補完を有効にする
    "latex-workshop.intellisense.package.enabled": true,
    // 生成ファイルを削除するときに対象とするファイル
    // デフォルト値に "*.synctex.gz" を追加
    "latex-workshop.latex.autoClean.run": "onBuilt",
    "latex-workshop.latex.clean.fileTypes": [
        "*.aux",
        "*.bbl",
        "*.bib",
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
    // 生成ファイルを現在のディレクトリに吐き出す
    "latex-workshop.latex.outDir": "",
    // ビルドのレシピ
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex -> bibtex -> xelatex*2",
            "tools": [
                "xelatex",
                "bibtex",
                "xelatex",
                "xelatex"
            ]
        }
    ],
    // ビルドのレシピに使われるパーツ
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
            ],
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%DOCFILE%"
            ],
        }
    ],
}
```