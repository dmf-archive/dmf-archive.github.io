---
title: "Function Over Form (II): Why Your Brain Isn't a Computer, But Your Computer Can Simulate a Brain"
type: docs
keywords:
  ["Scale Alignment", "Transformer", "Neuron", "GPU", "Global Workspace", "Biological Plausibility"]
date: 2025-07-11
---

# Function Over Form (II): Why Your Brain Isn't a Computer, But Your Computer Can Simulate a Brain

In my previous article, "[Function Over Form: Why Dynamic Sparsity is the Only Path to AGI](./beyond-snn-plausible-sparsity.md)", we reached a core conclusion: the pursuit of intelligence should focus on the realization of macroscopic computational functions, rather than the imitation of microscopic biological forms. We saw that the Transformer architecture, especially its sparse MoE variants, inadvertently became the best engineering approximation of the brain's two core functions: "global workspace" and "dynamic sparse activation."

However, the debate about "biological plausibility" continues to plague us in a more subtle and fundamental way. Many acknowledge the functional superiority of Transformers, but deep down, a lingering question remains: "How can a mathematical model with global attention be compared to a wet brain composed of locally connected neurons?"

Today, I will put an end to this debate once and for all.

We will reveal the root of this problem through a bold "scale jump" – a disastrous "scale alignment" error that has persisted for decades. We will see why your brain is not a "computer" in the traditional sense, but why the computers we design can perfectly simulate the brain's functions.

## I. Disastrous Scale Alignment: You're Comparing the Wrong Things

All arguments about Transformer's "biological implausibility" stem from a seemingly reasonable, yet fundamentally flawed premise: **we are making a one-to-one comparison between a macroscopic computational model (e.g., a Transformer Block) and a microscopic biological unit (a neuron).**

We look at the ubiquitous connections in the self-attention mechanism, then compare them to the sparse and local synaptic connection diagrams drawn by neuroscientists, and conclude: these two look completely different, so Transformer is "unnatural."

What is this like? It's like pointing at a car and saying, "This thing is unnatural because it doesn't have legs!" We've made a ridiculous scale error. We're comparing a system that achieves the **macroscopic function** of "efficient land movement" (a car) with a **microscopic biological component** (a leg muscle cell) that enables this function.

What should the correct comparison be? It should be **function vs. function, implementation vs. implementation.**

Now, let's re-examine everything with this "correct scale."

## II. Realigning: The Brain's Functions and the Computer's Implementation

Let's construct a new, logically impeccable correspondence table:

| Scale           | Biological System                                   | Computational System                                |
| :-------------- | :-------------------------------------------------- | :-------------------------------------------------- |
| **Macroscopic Function** | **Brain** (integrates information via global workspace) | **Transformer** (integrates information via self-attention mechanism) |
| **Microscopic Physics** | **Neuron** (transmits electrochemical signals locally) | **Transistor** (executes logic gates via local electron flow) |

Please read and understand this table carefully, as it contains the answer to the entire debate.

**1. Macroscopic Function Layer: Brain vs. Transformer**

- **What does the brain do?** It achieves a "global workspace" through a distributed network of long-range axonal connections (often associated with the prefrontal and parietal cortices). This workspace allows highly processed information from different senses and memory modules to be integrated and "broadcast" to all other cognitive subsystems, forming a unified, coherent conscious experience. This is the **highest-level computational function** achieved by the brain as a whole.
- **What does Transformer do?** Its self-attention mechanism is an **elegant and powerful engineering simulation** of the "global broadcasting and integration" function described above. It allows each element (token) in a sequence to directly compute relationships with all other elements, and dynamically and globally integrate information based on these relationships.

**Conclusion: At the macroscopic functional level, Transformer is the most successful simulation of the brain's core information integration mechanism invented to date.**

**2. Microscopic Physical Layer: Neuron vs. Transistor**

- **What does a neuron do?** It is a relatively simple, **localized computational unit**. It receives signals from a few upstream neurons, performs a nonlinear integration, and if it exceeds a threshold, sends a pulse to a few downstream neurons. All its computations strictly depend on its **physical, local connections.**
- **What does a transistor do?** It is an even simpler, **localized computational unit**. It executes a basic logic gate or switching operation within a tiny core of a GPU, based on its direct electrical inputs. All its behavior also strictly depends on its **physical, local connections.**

**Conclusion: At the microscopic physical level, what truly corresponds to a biological neuron is not Transformer's mathematical formula, but the billions of parallel-operating transistors on a GPU, performing simple local computations.**

## III. The Epiphany: Why Your Brain Isn't a Computer, But Computers Can Simulate a Brain

Now, we can answer the ultimate question.

**Why isn't your brain a "computer" in the traditional sense?**

Because when you think of a "computer," you envision a Von Neumann architecture machine that executes instructions serially. Your brain, however, is a massively parallel, self-organizing "wetware" composed of countless simple units. Its hardware and software are inseparable. Its mode of operation is fundamentally different from your laptop.

**But why can your computer (especially a GPU) simulate the brain (functionally)?**

Because modern computing architectures, especially GPUs, have already **converged in their physical implementation with the brain's organizational principles!**

A modern GPU is precisely a **massively parallel computing engine** composed of **billions of simple, locally operating computational units (transistors/CUDA cores).**

We are leveraging this physical substrate, which is highly similar to the brain's underlying organizational principles, to run a mathematical model (Transformer) that simulates the brain's macroscopic functions.

So, the next time someone questions Transformer's "biological implausibility," you can respond:

> "You've completely misunderstood the scale of comparison. We are not using a macroscopic mathematical formula to imitate a microscopic neuron. We are using a **macroscopic mathematical formula (Transformer)** to simulate the **brain's macroscopic functions (global information integration)**, and then we are running it on **hardware (GPU)** that is astonishingly similar to the brain in its **physical implementation principles (massive parallelism, local computation)**. This is what true 'biological plausibility' means in a functional sense."

## Conclusion: Bid Farewell to Form Anxiety, Embrace the Future of Function

It's time to completely abandon this meaningless "form anxiety" caused by "scale misalignment."

We should no longer ask: "Does this AI model look like a brain?"
We should ask: "Can this AI model effectively achieve the brain's core computational functions?"

From this new, clearer perspective, the path forward becomes clear. We no longer need to feel uneasy about Transformer's "alien" appearance. Instead, we should be excited by its profound functional insights.

Our future task is not to sculpt a more realistic "silicon neuron," but to design more powerful computational architectures that can better simulate other macroscopic functions of the brain. We need to simulate the brain's dynamic sparsity, its memory consolidation mechanisms, and its predictive coding loops.

And Transformer, with its profound simulation of the "global workspace," has already laid the first and most solid cornerstone for this correct path.

*Rui Lin, For the future of digital mind*
