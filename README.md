# Enhancing GLM-Based Lapse Rate Models for EV Calculation Using Interpretable Machine Learning

This repository contains the replication code, tutorial materials, and data for the paper presented at the **33rd International Congress of Actuaries (ICA2026 Tokyo)**:

> **Enhancing GLM-Based Lapse Rate Models for EV Calculation Using Interpretable Machine Learning**  
> *A Case Study of US Life Insurance Lapse Experience Analysis and EV Lapse Assumption Setting*  
> **Authors:** Reiji Kozuma, Ryoichi Asashiba, Yoshihiro Matsumori, and Hirokazu Iwasawa

---

## 🌐 Language Navigation
- [English](#english)
- [日本語 (Japanese)](#日本語-japanese)

---

<a name="english"></a>
## English

### 1. Overview
In actuarial practice, machine learning models often face adoption barriers due to opacity in high-stakes financial valuations. This research demonstrates a hybrid approach: using **Maximum Interpretation Decomposition (MID)** (implemented in the R package [`midr`](https://cran.r-project.org/package=midr)) to extract non-linear effects and interaction insights from a high-performing black-box model (XGBoost) and systematically embedding them into an interpretable Generalized Linear Model (GLM). 

The framework is evaluated not only through statistical metrics (Log-loss, ROC-AUC) but also through a simplified **Embedded Value (EV) Analysis of Movement (AoM)**, focusing on experience variances.

### 2. Repository Contents

| Directory / File | Description |
| :--- | :--- |
| `inst_midlapseev_basic` | **Basic Tutorial**: Preprocessing, model training (GLM/XGBoost), MID functional decomposition, visualization, and refined GLM construction (Items I-1 to I-3). |
| `inst_midlapseev_ev` | **EV Valuation Tutorial**: Disaggregating duration cohorts, gross premium estimation, backward recursive cash flow projections, and waterfall EV AoM generation. |
| `inst_midlapseev_reprod`| **Replication Tutorial**: Full rolling-window pipeline, `Workflow` reference class, multi-strata GLM fitting, Bayesian hyperparameter tuning, and zero-lapse cell probability analysis. |
| `paper/` | Full paper manuscript (WIP). |
| `cso/2001 CSO.xlsx` | Compiled 2001 CSO Mortality Tables formatted for premium estimation. |
| `inst_midlapseev_common.R` | Shared R utility script providing functions (it.read, it.run, it.extract) for chunk reuse and child-document rendering across .qmd files. |
| `papermidrreferences_2617.bib` | BibTeX bibliography database containing literature references cited across the paper and tutorials. |
| `apa.csl` | Citation Style Language (CSL) stylesheet defining APA 7th edition reference formatting for Quarto rendering. |

### 3. Data Sources & Attributions

1. **SOA Lapse Study Dataset:**
   - Sourced from the Society of Actuaries (SOA) *2014 Post Level Term Lapse & Mortality Report*.
   - Can be obtained via the R package [`insurance`](https://github.com/kevinykuo/insurance) or the public dataset repository.
2. **2001 CSO Mortality Tables (`data/2001 CSO.xlsx`):**
   - The mortality tables included in `data/2001 CSO.xlsx` are compiled from public rate tables provided by the Society of Actuaries (SOA), including the *2001 CSO Preferred Class Structure Mortality Tables* and the *SOA Mortality and Other Rate Tables (mort.soa.org)*.
   - **Notice on Fair Use:** These tables are compiled, aggregated, and formatted strictly for the purpose of ensuring scientific reproducibility of the research paper. Original rights, copyrights, and intellectual property in the underlying mortality tables belong to their respective copyright holders (SOA / NAIC). This file is provided solely for non-commercial academic research, verification, and educational purposes.

### 4. Computational Requirements
- **R** (>= 4.6.0)
- **Key Packages:** `midr`, `tidyverse`, `xgboost`, `readxl`, `ROCR`, `waterfalls`, `tidymodels`
- **Rendering:** Quarto CLI (>= 1.4) with a functional XeLaTeX environment (e.g., TinyTeX, TeX Live).

### 5. Updates & Work-in-Progress Notice
This repository and its accompanying materials are maintained by the authors and may be updated or refined periodically as research progresses and further feedback is received.

### 6. Disclaimer
The views, methodologies, and opinions expressed in this repository and the accompanying papers are solely those of the authors and do not necessarily represent the official views, policies, or positions of their respective employers, the Institute of Actuaries of Japan (IAJ), or the International Actuarial Association (IAA).

### 7. License
- **Source Code (`.qmd`, `.R`):** Licensed under the [MIT License](LICENSE).
- **Documents & Manuscript (PDFs):** Licensed under the [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) License.

---

<a name="日本語-japanese"></a>
## 日本語 (Japanese)

### 1. 概要
アクチュアリー実務において、機械学習モデルのブラックボックス性は財務評価やガバナンスにおける大きな障壁となっています。本研究では、高精度な XGBoost を新解釈手法 **Maximum Interpretation Decomposition (MID)**（Rパッケージ [`midr`](https://cran.r-project.org/package=midr)）で関数分解し、得られた非線形効果や交互作用の知見を解釈可能な一般化線形モデル（GLM）へと還元・高度化するハイブリッド・アプローチを提案しています。

統計的予測指標（Log-loss、ROC-AUC）に加え、アクチュアリーにとって馴染み深い **Embedded Value (EV) 変動要因分析（AoM）** に基づく前提実績差異を通じて財務インパクトを評価しています。

### 2. リポジトリの構成

| ディレクトリ / ファイル名 | 内容説明 |
| :--- | :--- |
| `inst_midlapseev_basic` | **基本編**：データ前処理、モデル構築（GLM/XGBoost）、MIDによる関数分解と可視化、モデル改良（I-1〜I-3）、精度評価。 |
| `inst_midlapseev_ev` | **EV計算編**：経過年数（duration）の細分化、2001 CSO生命表を用いた保険料計算、後ろ向き再帰キャッシュフロー展開、ウォーターフォール図によるEV変動要因分析（AoM）。 |
| `inst_midlapseev_reprod`| **論文再現編**：ローリングウィンドウ処理、`Workflow`参照クラスによるパイプライン管理、層別GLMの構築、ベイズ最適化によるXGBoostチューニング、論文全数値の完全再現。 |
| `paper/` | 論文本文（WIP）。 |
| `cso/2001 CSO.xlsx` | 保険料概算のために成形・集約した 2001 CSO 生命表。 |
| `inst_midlapseev_common.R` | 各 .qmd ファイル間でコードチャンクの再利用や子ドキュメント実行（it.read, it.run, it.extract）を担う共通ユーティリティスクリプト。 |
| `papermidrreferences_2617.bib` | 論文および各チュートリアルで引用されている参考文献の書誌情報を格納した BibTeX ファイル。 |
| `apa.csl` | Quarto レンダリング時に文献引用スタイル（APA 第7版）を適用するための CSL 定義ファイル。 |

### 3. データの出典および再配布に関する注記

1. **SOA Lapse Study データセット：**
   - 米国アクチュアリー会（Society of Actuaries: SOA）公表の「2014 Post Level Term Lapse & Mortality Report」に基づくデータです。
   - Rの [`insurance`](https://github.com/kevinykuo/insurance) パッケージ等を通じて取得可能です。
2. **2001 CSO 生命表データ（`data/2001 CSO.xlsx`）：**
   - 本ファイルに含まれる死亡率データは、SOAが公表している公開テーブル（*2001 CSO Preferred Class Structure Mortality Tables* および *SOA Mortality and Other Rate Tables (mort.soa.org)*）から抽出・集約したものです。
   - **利用上の注記：** 本ファイルは、元論文の研究結果を第三者が完全に検証・再現できるようにすることを目的として、公開データを本研究の計算フォーマットに合わせて再構成・配置したものです。原データの著作権および知的財産権は原著作者（SOA / NAIC等）に帰属します。本データは非営利の学術研究・検証および学習目的でのみ利用されることを前提としています。

### 4. 動作環境
- **R** (>= 4.6.0)
- **主要パッケージ：** `midr`, `tidyverse`, `xgboost`, `readxl`, `ROCR`, `waterfalls`, `tidymodels`
- **PDFレンダリング：** Quarto CLI (>= 1.4) および XeLaTeX 環境（TinyTeX や TeX Live など）。

### 5. 更新方針
本リポジトリに格納されているコードおよびドキュメントは、読者からのフィードバックや追加的な検証作業等に基づき、今後も随時アップデート（Work in progress）される可能性があります。

### 6. 免責事項 (Disclaimer)
本リポジトリおよび付随するドキュメントに記載された知見、意見、およびモデリング手法は著者個人の研究に基づくものであり、著者らの所属先企業、公益社団法人 日本アクチュアリー会（IAJ）、または国際アクチュアリー連盟（IAA）の公式な見解や方針を代表するものではありません。

### 7. ライセンス
- **ソースコード (`.qmd`, `.R`):** [MIT License](LICENSE) の下で公開されています。
- **文書・論文 (`.pdf`):** [クリエイティブ・コモンズ 表示 4.0 国際 ライセンス (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/deed.ja) の下で公開されています。