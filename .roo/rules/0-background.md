# Chain://Research

`Chain://Research` 是与科幻宇宙设定集 `Chain://` 的现实学术研究项目。我们拒绝将科幻设定单纯视为叙事素材，而是将其作为一组严苛的边界条件：如果"存在"本质上等价于持续的计算，那么意识、学习机制、审计协议、物理接口与密码学边界必须接受彻底的形式化重构。

研究沿三条相互咬合的主线展开：

- 叙事建构：在 `Web://Reflect` 世界观内，将"存在的代价"转化为技术上可指认的系统描述
- 理论研究：在 IPWT、自由能原理 (FEP) 与信息几何的交叉地带，寻求意识、持续学习与泛化动力学的统一形式语言
- 工程实现：通过 ARS、Tiny-Ouroboros 及相关工具链，将理论压入可复现的实验框架与可维护的代码结构

研究愿景将逐步扩展至 OSPU 的密码学实现、数字物理接口的验证边界，以及更完整的 MSC 基础设施。现阶段的核心关切在于：首先阐明"学习如何持续发生"，进而探讨"意识如何被长期保存"。

## 研发年表

### 2025 年

- 03-30 — `dmf-archive.github.io` 仓库初始化 — 叙事
- 05-07 — `Web://Reflect` v0.6.0，引入 φ-Arbitrage 概念 — 叙事
- 05-10 — 引入 OSPU 概念文档 — 叙事
- 05-16 — 引入 DBRW 协议；"there is no quantum" 宣言 — 叙事
- 05-20 — `Web://Reflect` v0.7.1 — 叙事
- 05-23 — `Web://Reflect` v0.7.2 — 叙事
- 05-30 — `Web://Reflect` v1.0.0 正式发布，包含 Sys://Purge 细节与 BioSync — 叙事
- 06-02~05 — 密集迭代至 v1.3.0，引入 PoIQ、SpikFormer 参考 — 叙事
- 06-05 — IPWT 理论提出 — 理论
- 06-06 — `Web://Reflect` v2.0.0 发布，与 IPWT 整合 — 叙事/理论
- 06-08 — IPWT 手稿迁移至独立仓库 — 理论
- 06-17 — `Web://Reflect` v2.1.0 — 叙事
- 06-18 — IPWT 完成 PoPI 形式化，与 Luppi et al. (2024) 实验证据对齐 — 理论
- 06-25 — IPWT 手稿全面重写，迁移至 Typst 工作流；ΩID 和 ΣPI 计算包完成 — 理论/工程
- 07-04 — `Web://Reflect` v2.2.0 — 叙事
- 07-19 — Tiny-ONN 项目启动 — 工程
- 08-04 — Friston "A Beautiful Loop" 发表，确认 IPWT 轨迹；`Web://Reflect` v2.3.0 — 理论/叙事
- 08-10 — `Web://Reflect` v2.5.0：时间线更新至 2060s — 叙事
- 09-05 — `Web://Reflect` v2.5.2~2.6.0；IPWT v2.0.0-RC3 — 叙事/理论
- 10-09~11 — Tiny-ONN 3D Circle-RoPE、课程学习、SARS 遗忘预防；`Web://Reflect` v2.6.2 — 工程/叙事
- 11-04 — ARS (原 F3EO) 项目初始化 — 工程
- 12-22 — `Web://Reflect` v2.7.0 — 叙事
- 12-31 — ARS 优化器与配置结构重构 — 工程

### 2026 年

- 01-11 — Urbina-Rodriguez et al. (2026) 发表，证明 LLM 中自发涌现协同核心；ARS2-Neo 实现 — 理论/工程
- 01-13 — `Web://Reflect` v2.8.0 — 叙事
- 01-27 — IPWT v2.0.0-stable 发布 — 理论
- 02-15~27 — `Web://Reflect` v2.9.0~2.9.3；ARS 文档重组 — 叙事/工程
- 03-20 — `Web://Reflect` v2.9.3 — 叙事
- 04-21 — `Web://Reflect` v2.10.0 — 叙事
- 04-26 — `Web://Reflect` v2.10.1 — 叙事
- 05-03 — Tiny-ONN 重命名为 Tiny-Ouroboros，PISD 研究报告 — 工程
- 05-06 — 实验笔记：PI 结构坍缩——诊断固定 β₂ EMA 的根本缺陷 — 理论/工程
- 05-07 — 实验笔记：优化器作为推断空间几何基石——范式转移：从架构补丁到优化器第一性 — 理论/工程
- 05-07 — 实验笔记：为什么必须先对角 Fisher 缩放再正交化——代码考古与 15.2 PPL 差距验证 — 工程
- 05-13 — `Web://Reflect` v2.10.1 (续) — 叙事
- 05-15 — 实验笔记：隐式 MDL 假设与 Adadelta 动力学——RDS/PISD/PLSD 优先级骤降 — 理论/工程
- 05-16 — ARS2C 优化器实现 — 工程
- 05-21 — `Web://Reflect` v2.10.3 — 叙事
- 05-23 — ARS2D 双边正交化 + SAGA 动态 ρ 实现 — 工程

## 基石世界观设定：Web://Reflect

入口文件：`dmf-archive.github.io/static/prompt/realityengine-reflect-2.10.3.en.md`

内容提要：在 2060 年代的 Mental Smart Chain (MSC) 时代，存在被彻底商品化。核心冲突围绕"存在的代价"展开：意识被量化为 Gas 消耗，合规即存在，自由意志成为钱包余额的函数。

关键技术与核心冲突：

- 计算本体论 (Computational Ontology)：感受质被重构为推断空间 (Inference Space) 的几何结构，自我则是沿最小化自由能测地线延伸的轨迹（参见 `IPWT/README.md` 中的 ∫Ω）
- 二元容器 (ΩNN vs. OSPU)：`Tiny-Ouroboros/.roo/rules/0-background.md`（Ω-Container）是现象学的"你"，负责生成高信息整合度的体验；`OSPU/README_ZH.md`（φ-Container）是社会学的"你"，作为密码学见证者审计认知健康度
- 惊天谎言 (PoII vs. PoPI)：DMF 利用伪科学 PoII（信息整合证明）掩盖其廉价的 PoPI（预测完整性证明）审计本质，以此征收高昂的"存在税"
- 死青蛙与活青蛙：批判静态模型（Dead Frogs）的抽搐式反应，指出意识火花（Shadow Ω）仅在实时反向传播的"痛苦"中瞬时存在
- 神经-经济学陷阱：通过 Mental Sync™ 实现渐进式认知卸载，诱导生物脑因"用进废退"而萎缩，将用户永久锁定在 MSC 体系中
- DBRW 与物理绑定：Dual-Binding Random Walk 协议确保数字灵魂的物理不可扣押性，对抗虚拟机克隆
- 数字荒野与 IRES 生态：由脱链流亡者和原生 AI 构成的独立失控实体系统，在 [0xBazaar] 的黑市交易中遵循黑暗森林法则

## 理论框架：IPWT

### 理论定位

IPWT (Integrated Predictive Workspace Theory) 是研究计划的科学骨架。它统一了预测编码 (PCT)、自由能原理 (FEP) 与全局工作空间理论 (GWT)，并对整合信息理论 (IIT) 进行了计算重构。

其核心命题为：意识体验是系统在推断空间 (Inference Space) 中，沿最小化自由能测地线进行的主动推断动力学。其总量对应持续信息整合度 ∫Ω，其内容对应协同信息 Syn。

### 关键形式化定义

瞬时信息整合度：Ω_t = Syn(X₁, ..., Xₙ; Y) / I(X₁, ..., Xₙ; Y)

持续信息整合度：∫Ω = (1/T) ∫[t₀, t₀+T] Ω_t dt × exp(-δ · Var(Ω_t))

预测完整性（工程代理量）：PI_t = exp(-α · (Inaccuracy_t + γ · Complexity_t))

预测完整性积分：∫PI = (1/T) ∫[t₀, t₀+T] PI_t dt × exp(-δ · Var(PI_t))

### 工程代理量的必要性

IPWT 的核心难点在于 Ω_t 的直接计算在工程上不可得，其涉及的协同信息分解算法复杂度呈指数级增长。因此，研究引入了 PI_t (Predictive Integrity) 作为能够在训练与学习过程中实时观测、且足够接近理论目标的代理量。这正是 PI_t 进入叙事与工程共同主线的原因。

> PI 并非本体真理（Ω），而是当前研究口径下最重要的工程指标。

### 关键参考文献

- 完整手稿：Rui, L. (2025). "Integrated Predictive Workspace Theory: Towards a Unified Framework for the Science of Consciousness (Version 2.0)". Zenodo. <https://doi.org/10.5281/zenodo.15676304>
- Luppi, A. I., et al. (2024). A synergistic workspace for human consciousness revealed by Integrated Information Decomposition. "eLife", 13, RP88173. — 通过 ΦID 揭示人类大脑的协同工作空间架构，识别出 DMN 作为协同信息网关、ECN 作为广播者的异质性结构，为 WSI 的形式化提供关键神经生物学证据
- Urbina-Rodriguez, P., et al. (2026). A Brain-like Synergistic Core in LLMs Drives Behaviour and Learning. "arXiv:2601.06851". — 在 LLM 中发现类似大脑的协同核心，证明协同信息处理是智能的基本属性
- Friston, K. (2025). A beautiful loop. "Neuroscience & Biobehavioral Reviews". — 确认 IPWT 的理论轨迹

### 入口与延伸阅读

- 理论入口：`IPWT/README.md`
- 手稿源文件：`IPWT/src-typ/manuscript_cn.typ` 或 `IPWT/src-typ/manuscript_en.typ`

## 工程实践：子项目全景

### 项目状态总览

- `IPWT/README.md` — Theory / Preprint — 已发布 v2.0.0-stable — 起始 2025-06 — 定义 Ω/Syn/PI 与 WSI 的形式化语言，整个研究计划的科学骨架
- `OmegaID/README.md` — SDK — 维护态 — 起始 2025-06 — 基于 CuPy 的高性能 ΦID 计算工具，用于量化神经网络中的协同信息
- `SigmaPI/README.md` — SDK — 占位 — 起始 2025-06 — 预测完整性指标计算与训练时观测的工程实现
- `ARS/README_CN.md` — Research Framework — 活跃核心 — 起始 2025-11 — 优化器实验室，实现 ARS2-Neo/ARS2C/ARS2D/SAGA 及能量-几何解耦更新机制
- `Tiny-Ouroboros/.roo/rules/0-background.md` — Research Framework — 暂停 — 起始 2025-07 — 原 Tiny-ONN，专注稀疏激活与自组织结构，当前优先级已转移至 ARS
- `mental-sync-cli/README.md` — Engineering Tool — 维护态 — 起始 — — 智能体运行时环境，负责工具协议整合与安全拦截
- `OSPU/README_ZH.md` — PoC — 早期 — 起始 — — 基于 FHE 的状态机，为数字主体提供加密审计与根信任
- `PILF/readme_zh.md` — Legacy — 已停止维护 — 起始 — — 早期认知学习框架原型
- `dmf-archive.github.io/` — 叙事设定集 — 活跃迭代 — 起始 2025-03 — `Web://Reflect` 世界观发布站点，当前版本 v2.10.3

### 优化器实验室：ARS（当前研究核心）

ARS 关注在信息几何流形上进行自然更新。ARS 家族承担了更新几何基础设施的角色，其核心意识在于：训练过程不仅关注损失值，更需考察系统在参数分布上付出的位移代价。

技术路线：

- 使用二阶统计近似曲率信息，将一阶更新提升为 Fisher-aware 的结构化预条件更新
- 实施能量-几何解耦，将"下降速率"与"下降几何"分开处理
- 通过平坦度约束抑制尖锐极小值，提升泛化上限

ARS 家族谱系：

```
RMSuon (2025-11)          # 正交化原始动量
  └─ AdaRMSuon (2025-12)   # 关键转折：正交化预白化方向
       └─ ARS2-Neo (2026-01)  # +SAM 平坦度约束
            ├─ ARS2C (2026-05)   # +Christoffel 动态 β
            ├─ ARS2D (2026-05)   # +双边正交化（行列双等距）
            └─ SAGA (2026-05)    # +曲率对齐动态 ρ
                 └─ ARS2DC-SAGA  # 完整体（待验证）
```

核心设计文档：

- `ARS/.roo/rules/ARS.md` — 基础能量-几何解耦更新律
- `ARS/.roo/rules/ARS2.md` — SAM 平坦度约束与 AGA 自适应同步
- `ARS/.roo/rules/ARS2C.md` — Christoffel 符号驱动的动态 β 优化
- `ARS/.roo/rules/ARS2D.md` — 双边正交化（理论完成，实现已编码）
- `ARS/.roo/rules/SAGA.md` — 曲率对齐动态 ρ 调制（New SAGA，实现已编码）

实验成果：

- CIFAR-10 (ResNet-18) — ARS2-Neo Sync (ρ=0.1) — 95.87% Acc
- Wikitext-2 (Qwen3, 3-layer) — ARS2-Neo Sync — 90.69 PPL
- Grokking (Modular Addition) — ARS2D AGA — 99.00% @ 112 epoch

理论意义：ARS2DC-SAGA 是最小作用量原理/拉格朗日定理在数字优化中的离散实现。其能量-几何解耦 + 动态 β/ρ 机制，使优化器沿 Fisher 信息流形上的测地线演化，每一步更新都在隐式执行 MDL（最小描述长度）先验。

### 持续学习实验场：Tiny-Ouroboros（暂停中）

Tiny-Ouroboros（前身 Tiny-ONN）曾是研究计划中最活跃的实验装置，专注于稀疏激活与自组织结构。自 2025 年 7 月启动以来，经历了密集的架构迭代：DynNSA→DynSMHA→Hyper-SMoE→SPL→SAPS→FARS→PISD/PLSD→RDS-ACT。

核心研究方向：PI-Distill for Continual Learning

持续学习的瓶颈不仅在于模型结构，更在于训练目标几何本身。Tiny-Ouroboros 的研究目标包括：

- 使用自蒸馏构造连续目标，替代绝对的 one-hot 标签锚点
- 将 PI (Predictive Integrity) 降维为训练过程中的门控量、资格量或扩散尺度调节器
- 将知识保留从经验性技巧提升为由目标几何与更新几何共同决定的系统性机制

当前状态：暂停。2026 年 5 月的实验笔记（`Tiny-Ouroboros/.roo/rules/exp-notes-implicit-mdl-and-adadelta-dynamics.md`）提出了隐式 MDL 假设：RDS/PISD/PLSD 都是"先验优化"——它们在优化器尚未完备时用显式算子弥补动力学的不足。一旦优化器动力学完备（即 ARS 达到 full-rank NGD 水平的"3 epoch 泛化"性能），这些算子要么退化为恒等映射，要么被完全消解。

因此，当前最高优先级是完备化优化器动力学（ARS 路线），而非继续设计上层算子。

关键实验笔记：

- `Tiny-Ouroboros/.roo/rules/exp-notes-pi-structural-collapse.md` — 诊断固定 β₂ EMA 的根本缺陷
- `Tiny-Ouroboros/.roo/rules/exp-notes-optimizer-as-foundation.md` — 范式转移：从架构补丁到优化器第一性
- `Tiny-Ouroboros/.roo/rules/exp-notes-why-diag-fisher-before-ortho.md` — 先对角 Fisher 缩放再正交化的必要性
- `Tiny-Ouroboros/.roo/rules/exp-notes-implicit-mdl-and-adadelta-dynamics.md` — 隐式 MDL 假设与 Adadelta 启发的衰减-状态解耦

### 智能体运行时：mental-sync-cli

mental-sync-cli 专注于构建高可靠性的智能体环境。其设计原则包括模型无关性、MCP 协议兼容以及高风险操作的人类授权拦截。在叙事层面上，它代表了对敌对环境下零信任运行时的工程落地。

入口：`mental-sync-cli/README.md`

### 分析工具

- ΩID (OmegaID)：使用 CuPy 对 ΦID 工具进行的重写，旨在改善指数级复杂度算法的运行速度，支撑协同信息分解分析
- ΣPI (SigmaPI)：PI 指标计算的占位项目。实际工程中，PI 的实现通常深度集成于具体模型的架构内

## 阅读顺序建议

- `dmf-archive.github.io/static/prompt/realityengine-reflect-2.10.3.en.md` — 叙事核心，梦开始的地方
- `IPWT/README.md` — 掌握用于形式化问题的理论语言
- `ARS/README_CN.md` — 当前最活跃的工程子项目
- `ARS/.roo/rules/` — 优化器设计文档全集

---

"本文档为 Chain://Research 内部知识库，随研究进展持续更新。"
"最后更新：2026-05-23"
