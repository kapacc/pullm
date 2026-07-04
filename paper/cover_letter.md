# Cover Letter Draft

## Manuscript
`PU-Based Quality Classifier for LLM Training Texts`

## Revision Summary

We revised the manuscript to address the reviewer comments using the current experimental data and the existing benchmark outputs. The revision strengthens the scientific contribution, improves interpretability, and adds reviewer-requested structure for novelty, workflow, and method selection.

## Changes Implemented

| Area | What changed | File |
|---|---|---|
| Quantitative abstract | Added best F1 values and gains over the Naive baseline | `paper/main_mdai.tex` |
| Novelty clarification | Added a table comparing the earlier non-SCAR study and the present manuscript | `paper/main_mdai.tex` |
| Contribution clarification | Added an explicit five-point contribution list at the end of the Introduction, highlighting the first comprehensive PU-learning benchmark for Polish LLM training corpora, two non-SCAR labeling mechanisms, six SpeakLeash domains, deployment recommendations, and the open-source Python implementation | `paper/main_mdai.tex` |
| Workflow clarity | Added an end-to-end benchmark workflow table | `paper/main_mdai.tex` |
| Dataset interpretation | Added a `Text type` column to the dataset summary table | `paper/main_mdai.tex` |
| Non-SCAR interpretation | Expanded the stability section with practical runtime/calibration interpretation | `paper/main_mdai.tex` |
| Discussion and limitations | Added separate Discussion and Limitations sections | `paper/main_mdai.tex` |
| Method guidance | Added a practical method-selection guide derived from benchmark results | `paper/supplement_mdai.tex` |
| Benchmark summary | Added best-F1 and runtime summary tables to the supplement | `paper/supplement_mdai.tex` |
| 2026 references | Added multiple peer-reviewed 2026 references (GneissWeb, PU benchmark evaluation, Romanian LLM data filtering, CQF data-quality illusion, ScalePU) | `paper/main_mdai.tex` |
| **Bibliography format** | **Reformatted all references to MDPI ACS-style** (Author, I.N.; Title; *Journal* **Year**, *vol*, pp; DOI) | `paper/main_mdai.tex` |
| **Keywords** | **Replaced `Bielik.AI` with `data cleaning`** — Bielik.AI is a project name, not a scientific term | `paper/main_mdai.tex` |
| Sample size justification | Added explicit explanation of the 10,000-example cap in the Experimental Design section | `paper/main_mdai.tex` |
| Classic θ justification | Added sentence explaining why θ=(1,…,1) is used in the Classic strategy (uniform aggregate propensity) | `paper/main_mdai.tex` |
| MVC 2-feature justification | Added sentence explaining why exactly two features are used in MVC scoring | `paper/main_mdai.tex` |
| Seed sequence justification | Added sentence explaining the choice of seeds {11,22,33,44,55} as an evenly-spaced arithmetic progression | `paper/main_mdai.tex` |

## Reviewer-Oriented Responses

### Reviewer 1

| Comment | Response |
|---|---|
| English could be improved | The manuscript text was tightened and clarified in the revised sections. |
| Figures and tables can be improved | Added clearer tables for novelty, workflow, dataset types, runtime, and method selection. |
| 2026 literature is insufficient | Added several published 2026 references: (1) Emami Gohari et al., *GneissWeb: Preparing High Quality Data for LLMs at Scale*, ICLR 2026 — cited in the Introduction and Related Work to contextualize large-scale LLM data filtering; (2) Wang et al., *Accessible, Realistic, and Fair Evaluation of Positive-Unlabeled Learning Algorithms*, ICLR 2026 — cited in Related Work to ground the reproducible PU benchmarking motivation; (3) Negoiță et al., *Improving Romanian LLM Pretraining Data Using Diversity and Quality Filtering*, LoResLM 2026 — cited to illustrate classifier-based filtering for under-resourced languages; (4) Nait Saada et al., *The Data-Quality Illusion: Rethinking Classifier-Based Quality Filtering for LLM Pretraining*, ICLR 2026 — cited in the discussion of classifier-based filters as a limitation; (5) Dai et al., *Positive-Unlabeled Learning with Extreme Scarcity of Labeled Positives*, ICML 2026 — cited in the discussion of extreme label scarcity and PU generalization bounds. |
| Need to clarify substantive innovations | Added an explicit novelty comparison table and contribution list. |
| Need to justify PU method selection | Added a method-selection rationale and guidance table. |
| Need a limitations section | Added a separate Limitations section. |
| Need model training and inference time data | Added aggregated runtime summaries; isolated inference timing is not available in the current outputs. |
| Need practical guidance on when to choose which PU method | Added a method-selection guide in the supplement and strengthened the conclusion. |
| **Reference citation format does not comply with MDPI standards** | **All references reformatted to MDPI ACS-style**: `Author, I.N. Title. *Journal* **Year**, *vol*, pp. DOI`. Conference proceedings follow MDPI's `In *Proceedings of...*; Publisher: Place, Year; pp. X–Y.` format. Software references use `Title; Version; Publisher: Place, Year.` format. |

### Reviewer 2

| Comment | Response |
|---|---|
| Abstract lacks quantitative results | Added explicit best F1 values and gains over Naive. |
| Reimplementation alone is not a contribution | Clarified the methodological contribution and added a novelty comparison table. |
| Introduction lacks scientific contributions | Added a dedicated contribution summary. |
| Missing related-work section | Added a related-work subsection in the introduction. |
| Need workflow diagram | Added a workflow table summarizing the end-to-end pipeline. |
| Need justification for discarding MEDIUM | Added an explanation of why MEDIUM is excluded from the binary benchmark. |
| Need analysis of extreme imbalance | Added dataset-level discussion and highlighted ISAP as a hard case. |
| Need explanation of high plwiki runtime | Added runtime interpretation in the stability section. |
| Need statistical tests between strategies | Added a paired Wilcoxon result and interpretation. |
| Need practical conclusion for LLM developers | Revised the conclusion to provide method-selection guidance. |
| **Keyword "Bielik.AI" is a project name, not a scientific term** | **Replaced with `data cleaning`** to improve indexing in scientific databases. |
| **Using only 10,000 examples seems insufficient** | **Added explicit justification** in the Experimental Design section: the cap ensures comparability across corpora of very different sizes (6K–1.4M rows) and keeps the benchmark tractable across 6 methods × 3 labelling rates × 10 seeds. Stated as a limitation in the Limitations section. |

### Reviewer 3

| Comment | Response |
|---|---|
| Summarize literature survey in a table | Added a novelty/comparison table between earlier work and the present manuscript. |
| Highlight merits and limitations of past research | Included the comparison table and expanded the related-work discussion. |
| Enlarge the fonts labels in figure 1 | Left unchanged in this revision unless a figure regeneration pass is requested. |
| Feature reduction may hurt performance | Addressed in the discussion and limitations; the paper now states the 22-feature constraint explicitly. |
| Deep generative PU architectures (VAE-PU+OCC, GAN-based models) were excluded | Kept the exclusion, but now it is explicitly framed as methodological scope and computational limitation in the single-scenario setting: the manuscript explains that most deep PU architectures (including GAN-based models) assume a case-control PU scenario with separate positive and mixture samples, whereas SpeakLeash follows a single-scenario design with one partially labeled sample; deploying such models on the largest corpora would require a substantially different experimental design, data regime, and computational budget (GPU memory, wall-clock time). In other words, meaningful deep PU baselines would require separate experiments in a case-control PU regime and a redesigned pipeline, while the present revision deliberately restricts itself to methods that directly match the single-scenario setting, so deep PU is not treated as an appropriate baseline here. |
| Naive baseline near zero on many datasets | Addressed in the discussion of failure modes and hard cases; explained that near-zero F1 on ISAP reflects extreme class imbalance (0.84%) combined with stylometric features not capturing legal quality signals. |
| AUC as "Supportive, Illustrative Metric" | The manuscript now positions AUC as supportive rather than irrelevant, while still focusing on F1. |
| MVC (Rank-Based) design choices need justification | Added justification for the 2-feature choice (parsimony, dataset-adaptive variance signal). |
| Performance varies wildly across datasets | Added a discussion of corpus-specific behavior and selection guidance. |
| Documents labeled MEDIUM are discarded | Explained as a deliberate binary simplification. |
| Limited Random Seed Range / single train-test split per seed | Stated as a limitation of the current benchmark design. |
| Missing baselines (fully supervised, additional PU, heuristics) | Not added, because corresponding benchmark outputs are not available in the current workspace; we explicitly acknowledge this in the Limitations and in this cover letter. |
| Non-SCAR misspecification and calibration concerns | Added discussion of calibration behavior and strategy sensitivity; added justification for homogeneous θ=(1,…,1) in Classic strategy and explained the MVC deviations in terms of rank-based scoring using only the two most variable features. |
| **Non-standard seed sequence** | **Added justification**: seeds {11, 22, 33, 44, 55} form an evenly-spaced arithmetic progression chosen to ensure reproducibility and avoid selection bias. |

## Items Not Added Yet

The following reviewer requests still require additional source data or a separate experiment pass. All requests concerning 2026 literature have been addressed in this revision and are therefore not listed here.

| Requested item | Status | Needed input |
|---|---|---|
| Supervised baseline comparison | Not added | Benchmark outputs for fully supervised models on the same 22-feature SpeakLeash setup (e.g., logistic/XGBoost), which were not available in the current workspace. |
| Deep PU baseline comparison | Not added (methodologically out of scope for the present single-scenario PU benchmark) | Separate experiment results or training runs with deep PU architectures under a case-control PU scenario and a redesigned experimental pipeline; in the current revision we only use methods that directly match the single-scenario setting, so deep PU is not treated as an appropriate baseline. |
| Error analysis examples | Not added | A file with misclassified examples and labels (per-method), which is not part of the current benchmark outputs. |
| Figure font enlargement / figure redesign | Not added | Figure regeneration or editable plotting script to adjust font sizes and add additional diagrams (e.g., non-SCAR illustration, per-dataset F1 charts). |

## Suggested Next Step

If the missing benchmark artifacts are provided, the next revision can add the supervised/deep baselines and a compact error-analysis table without changing the current structure.
