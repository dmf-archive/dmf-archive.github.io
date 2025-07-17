---
title: "Function Over Form: Why Dynamic Sparsity is the Only Path to AGI"
type: docs
keywords:
  [
    "Sparsity",
    "Neural Network Architecture",
    "Transformer",
    "Mixture-of-Experts",
    "SNN",
    "Biological Plausibility",
    "Predictive Coding",
  ]
date: 2025-07-07
---

# Function Over Form: Why Dynamic Sparsity is the Only Path to AGI

## Introduction: A Costly Misunderstanding About Imitation

Across the vast landscape of artificial intelligence research, a silent "tribal war" has been raging for decades. Different research paradigms, like tribes with distinct faiths, each cling to their own path to the holy grail of intelligence.

One tribe consists of the **biophysical purists**. They are staunch advocates for Spiking Neural Networks (SNNs), obsessed with replicating the true firing behavior of neurons in silicon. They believe that the ion channel dynamics depicted by the Hodgkin-Huxley model, and the temporal encoding of information in spike trains, hold the key to unlocking the mystery of intelligence. In their view, any deviation from this biological "realism" is a desecration of life's secrets.

Another tribe is the **sequential processing fundamentalists**. They hold Recurrent Neural Networks (RNNs) and their modern variants (like LSTM, GRU, and RWKV) as their totem. They are convinced that the core of intelligence lies in the effective processing of time series, in compressing historical information into an ever-evolving "state." To them, the world is a linearly unfolding scroll, and a powerful RNN is the ultimate cipher for deciphering it.

Dominating the center of this landscape are the **"barbaric" pragmatists**. Wielding the formidable weapon of the Transformer, they have swept through nearly all benchmarks in natural language processing, computer vision, and even broader fields in a near-brutish fashion. Yet, their victory is always tinged with a hint of unease. Critics point out that its core mechanism—Self-Attention—and the dense matrix operations behind it are so "unnatural" biologically that it seems more like an engineering "monster" than a profound insight into intelligence.

This protracted debate is rooted in a fundamental question: When we talk about "Biological Plausibility," what are we actually pursuing? Is it **isomorphic replication at the hardware level**, making our models mimic the firing of a neuron with every transistor switch? Or is it **functional equivalence at the implementation level**, ensuring our systems align with the macroscopic computational principles of the brain's cognitive functions?

This article will argue that the former—a dogmatic imitation of form—is a costly detour that has already led us astray. The latter—a deep understanding and abstract implementation of function—is the only true path toward Artificial General Intelligence (AGI). We will see that the brain's most efficient computational principle is not spiking or recurrence, but a deeper wisdom: **Dynamic Sparsity**. And those architectures that seemed "implausible" have, inadvertently, become the most faithful executors of this core principle.

## Part I: The Shackles of Form - How an Obsession with Biological Hardware Led Us Astray

Imitating nature is an ancient driver of engineering progress. We observed birds to design airplanes. But it is noteworthy that our successful aircraft are not covered in feathers, nor do they fly by flapping their wings. We extracted the core principles of aerodynamics and re-implemented them in our own engineering language (internal combustion engines, turbines, fixed wings). In our quest for artificial intelligence, we seem to have forgotten this lesson.

### 1.1 SNNs: The Elegant Energy Trap

The allure of Spiking Neural Networks is undeniable. It promises two major things: extreme energy efficiency and rich temporal information encoding. The basic unit of an SNN, the spiking neuron, only "fires" when it receives sufficient input stimulation (when its membrane potential crosses a threshold), remaining silent otherwise. This event-driven computation, compared to the dense floating-point operations performed by all neurons in every clock cycle in traditional Artificial Neural Networks (ANNs), results in significantly lower energy consumption. In theory, this makes it an ideal choice for edge computing and neuromorphic chips.

The academic enthusiasm for SNNs can be traced back to the 1990s, when pioneers like Wolfgang Maass defined them as the "third generation of neural network models" , believing their computational power surpassed that of traditional perceptrons and Sigmoid neurons. They hoped to capture the essence of the brain's information processing by simulating the temporal dynamics of real neurons.

However, this faithful imitation of biophysical details has saddled SNNs with a heavy computational burden. Their greatest difficulty stems from the discrete and non-differentiable nature of spike signals. This makes the cornerstone of deep learning—gradient-based backpropagation—impossible to apply directly. When a network fails to produce the desired output, how do we determine which neuron fired too early, too late, or shouldn't have fired at all? This is the infamous **credit assignment problem** in SNNs.

To circumvent this obstacle, researchers have invented various clever "workarounds," the most popular of which are **surrogate gradients**. The basic idea is to use a smooth, differentiable function (like a Sigmoid or a fast Sigmoid) to approximate the derivative of the spiking function during backpropagation. This solves the training problem to some extent, but at a huge cost: for an SNN to learn, we must pretend it is an ANN during the training process. This leads to a profound irony—the greatest advantage of SNNs (event-driven sparsity) is temporarily "switched off" during the learning phase.

A more fundamental problem is that the SNN paradigm locks itself into simulating the behavior of individual neurons, ignoring the higher organizational levels where intelligence emerges. The brain's power comes not from the ingenuity of a single neuron, but from the **organizational principles** followed by the vast network of billions of neurons. An SNN is like a linguist trying to understand a Shakespearean play by perfectly imitating the pronunciation of a single word. He is analyzing at the wrong scale.

### 1.2 RNNs: The "Memory" Illusion of Linear Time

If SNNs are an imitation of the physical form of neurons, then RNNs are an early, naive imitation of the brain's "function" of processing sequential information. Its core idea—compressing historical information into a hidden state that evolves over time—is intuitively appealing. From the Elman network to modern LSTMs and GRUs, and on to RWKV which claims to combine the efficiency of RNNs with the performance of Transformers, the core appeal of this technical lineage has always been: to efficiently process sequences of arbitrary length with O(T) linear time complexity and O(1) space complexity.

This promise of efficiency is highly tempting in resource-constrained scenarios. However, it is built on a fatal flaw, an "original sin" that is unavoidable from an information theory perspective: the **information bottleneck**.

Information theory tells us that it is impossible to losslessly compress a source with a larger amount of information into a container with a smaller capacity. For an RNN, this means that a fixed-size hidden state vector (no matter how high its dimensionality) is theoretically incapable of losslessly encoding an infinitely growing, detail-rich history. As the sequence lengthens, information is inevitably lost, and important early details are washed away. This is known as the "long-term dependency problem."

The invention of LSTMs and GRUs was precisely to alleviate this problem. They introduced ingenious "gating" mechanisms—input gates, forget gates, output gates—in an attempt to let the network learn what to "remember" and what to "forget." These gating units, like a diligent librarian, work hard to manage the limited shelf space (the hidden state) to retain the most important books (information). This was successful to some extent, enabling RNNs to perform well on tasks with medium-length dependencies.

However, this is ultimately an effort akin to "building a cathedral in a thimble." When faced with a task that requires retrieving a specific detail from the distant past (for example, answering a question about a minor character from the first chapter of a long novel), the performance of an RNN drops sharply. No matter how hard the librarian tries, they cannot fit the entire contents of the Library of Congress into a suitcase.

Modern RNNs like RWKV attempt to further widen this bottleneck by introducing more complex, Transformer-inspired mechanisms (like time-decay and channel mixing). But as I have argued in the [_HyperRNN Memo_](./posts/hyperrnn-memo), the endpoint of this evolutionary path is predetermined: to truly solve long-term dependencies, an RNN must eventually reinvent a mechanism functionally equivalent to "attention" internally, allowing it to directly "jump" back to any point in history to retrieve information on demand. When it does so, it abandons its original, pure recurrent paradigm and becomes a complex variant of the Transformer.

The stories of SNNs and RNNs teach us the same lesson: an overly literal, overly local imitation of biological systems often leads us to grasp the superficial form while missing the functional essence. What we need is to temporarily put down the microscope, pick up the telescope, and observe the grander, more fundamental computational principles that the brain follows as a complete system.

## Part II: The Dawn of Function - The Three Great Computational Principles Taught by the Brain

If we stop obsessing over the firing patterns of individual neurons or the linear connections between them, and instead view the brain as an information processing system evolved to survive in a complex environment, then three macroscopic computational principles emerge. Together, they form the cornerstone of the brain's intelligence.

### 2.1 Principle One: Dynamic Sparsity - The Brain's Energy-Saving "Lazy" Philosophy

The brain is an extremely expensive organ. It accounts for only 2% of the body's weight, yet it consumes up to 20% of its resting energy. This immense metabolic pressure has forced the brain, over hundreds of millions of years of evolution, to become an ultimate "master of energy conservation." And its core strategy for achieving this is **dynamic sparsity**.

Unlike traditional computer chips where most transistors are involved in computation every clock cycle, the brain at any given moment only activates a small fraction of its neurons to accomplish a specific task. As you read this text, your visual cortex, language centers, and areas responsible for high-level semantic understanding are highly active, but at the same time, the neurons controlling your leg movements or processing auditory information are essentially in "standby" mode.

This sparsity is not static—it's not that most weights in the network are permanently zero—but **dynamic and conditional**. In the next moment, if the phone rings, a completely new set of neurons related to auditory processing and attention shifting will be activated, while the previously active reading-related neurons may become inhibited. This "on-demand" mode of computation is the key to how the brain achieves its astonishing cognitive abilities on a very low power budget (about 20 watts).

The neuroscientific evidence is abundant. Functional magnetic resonance imaging (fMRI) studies clearly show heatmaps of brain activity corresponding to different cognitive tasks, and these heatmaps themselves are intuitive visualizations of macroscopic sparsity. At a more microscopic level, the theory of **Sparse Coding**, pioneered by Olshausen and Field , proposes that the goal of the primary visual cortex (V1) is to represent natural images with a sparse combination of a small set of basis functions (neurons). This aligns remarkably well with the observed response properties of V1 neurons.

Therefore, the first lesson the brain teaches us is this: **Intelligent computation is inherently sparse. A truly scalable and efficient intelligent system must have the ability to dynamically and selectively activate its internal computational resources based on the input and the task.**

### 2.2 Principle Two: The Global Broadcast - The Stage of Consciousness for Integrating Information

If the brain's computation is highly distributed and modular (with different brain regions responsible for different functions), how are these independent computational results integrated to form a unified, coherent cognitive experience? How do we combine the color information from our eyes, the sound information from our ears, and the background knowledge from our memory to form the complete perception, "I see a red fire truck driving by with its siren on"?

The answer seems to lie in a cognitive architecture known as the **Global Workspace**. This theory was first proposed by Bernard Baars , who compared it to a "theater stage." In this theater, there are many specialized actors (various unconscious, parallel processing modules) working backstage. When an actor's information becomes important enough, it is brought into the spotlight on stage. Once on stage, this information is "broadcast" to the entire audience in the theater (all other processing modules), thus achieving global information sharing and coordination.

The "content on the stage" corresponds to our subjective conscious experience. Neuroscientists Stanislas Dehaene and Jean-Pierre Changeux further developed this theory, proposing its neural basis model—the **Global Neuronal Workspace (GNW)** . They argue that there is a distributed network in the brain composed of long-range connecting neurons in the frontal and parietal lobes. When information enters this network and triggers a large-scale, self-sustaining synchronous oscillation, this information enters the "global workspace," becoming flexibly available for reasoning, reporting, and decision-making.

The Global Workspace Theory perfectly explains why our conscious experience is serial and has limited capacity, while the underlying neural computation is massively parallel. It provides us with a second key principle: **An intelligent system needs a central mechanism for information integration and broadcasting to enable flexible access to and global coordination of distributed knowledge.** This stands in stark contrast to the "local" ideology of RNNs, which attempt to force all information into a single state vector.

### 2.3 Principle Three: The Predictive Machine - Finding Order in Uncertainty

The brain is not a passive sensor. It doesn't just receive and process information from the external world; it actively and continuously **predicts** the world. This revolutionary viewpoint is known as **Predictive Processing** or **Predictive Coding**, and its most complete theoretical form is Karl Friston's **Free-Energy Principle (FEP)** .

The core idea is this: the brain possesses an internal generative model of how the world works. It uses this model to constantly generate top-down predictions about the next moment's sensory input. The actual sensory signals (e.g., from the retina) propagate bottom-up. At various levels of the brain, these two signal streams are compared. If the prediction matches reality, not much processing is needed. But if a **prediction error** occurs—i.e., "surprise"—then this error signal is prioritized for upward transmission to update the higher-level internal model, in order to make more accurate predictions in the future.

From this perspective, what we perceive is not so much the world itself, but our brain's best guess about the world. The brain's main job is not to process the massive stream of sensory data, but to process the "unexpected" parts of it. This is another profound efficiency mechanism.

The Free-Energy Principle provides us with a third, and most integrative, principle: **The core of intelligence is to possess a generative model of the world and to continuously optimize this model by minimizing prediction error.** This process unifies perception, learning, and action. Learning is updating the model to reduce future errors, and action is changing the world to make it conform to the model's predictions.

Of course, the view of the brain as a strict "Bayesian inference machine" also faces challenges. For instance, a recent paper titled "The myth of the Bayesian brain" has criticized its falsifiability and the details of its biological implementation. However, even if we do not fully accept its rigorous mathematical formalism, the idea of predictive processing as a fundamental organizing principle of the brain—that cognition is driven by internal models and predictions—is supported by extensive neuroscientific evidence.

In summary, the brain achieves efficient intelligence through three major functional principles: it saves energy through **dynamic sparsity**, integrates information through a **global workspace**, and understands the world through **predictive processing**. Any architecture aspiring to achieve general intelligence must answer the question: How does it computationally implement these three principles?

## Part III: A New Look at Architectures - When the "Implausible" Becomes the New Paradigm

With the brain's computational principles as our "map," we can now re-examine current artificial intelligence architectures, especially that giant considered "biologically implausible"—the Transformer. We will find that its success is not accidental, but rather because it has, inadvertently, become the best engineering approximation of these core functional principles to date.

### 3.1 The Transformer: An Engineering Realization of the Global Workspace

In 2017, a paper titled "Attention Is All You Need" emerged and completely changed the landscape of deep learning. The Transformer architecture it introduced, and its core—the self-attention mechanism—is a stunning engineering implementation of the Global Workspace Theory (GWT).

Let's deconstruct the self-attention mechanism: for each element (token) in a sequence, it generates three vectors: a Query, a Key, and a Value.

1. **Broadcast**: The Query vector of an element is compared with the Key vectors of **all** other elements in the sequence (by calculating a dot-product similarity). This is functionally equivalent to the GWT concept of a piece of information being "broadcast" to all other modules in the system to solicit for relevance.
2. **Integration**: The calculated similarity scores (attention weights) are used to perform a weighted sum of the Value vectors of all elements. This means that the new representation of the element is a result of dynamically and on-demand "integrating" global information based on its relevance to all other elements.
3. **Workspace**: The entire self-attention layer, along with the subsequent feed-forward network, constitutes a computational "stage." The input sequence enters this stage, undergoes global information broadcasting and integration, and finally outputs a new sequence representation with a deep understanding of the context.

What's more, the Transformer, through its Multi-Head Attention mechanism, allows the system to perform this broadcasting and integration in different "subspaces" in parallel, which is analogous to how multiple cognitive systems in the brain can interpret global information from different perspectives simultaneously.

Furthermore, the self-attention mechanism directly accesses the entire input sequence (in the KV cache), completely solving the information bottleneck problem of RNNs. It no longer needs to compress the entire history into a finite state but possesses a high-fidelity, randomly accessible "external memory." This is precisely what GWT describes: an interaction between a vast backstage system and a limited-capacity "conscious stage."

Therefore, the success of the Transformer is not because it is a better sequential model, but because it is a **better information integration architecture**. It functionally implements a global workspace, thereby endowing the model with an unprecedented ability to understand complex contextual relationships.

### 3.2 Mixture-of-Experts (MoE): The Scaling Law of Dynamic Sparsity

Although the Transformer is powerful, its original "dense" form has a huge problem: the computational cost increases with the square of the sequence length, and all parameters in the model are involved in the computation for every token. This runs counter to the brain's principle of dynamic sparsity and also poses challenges in terms of energy consumption and cost when scaling to larger sizes.

The solution comes from a relatively old idea that has been recently rediscovered: the **Mixture-of-Experts (MoE)** model. This idea can be traced back to the work of Jacobs et al. in 1991 , but it wasn't until researchers at Google combined it with the Transformer that its potential was truly unleashed.

In a sparsely-gated MoE-Transformer architecture (like the Switch Transformer ), the standard feed-forward network (FFN) is replaced by a set of parallel "expert" networks and a small "gating network" or "router." When a token enters the MoE layer:

1. **Routing**: The gating network examines the token and decides which expert (or experts) it should be sent to for processing.
2. **Sparse Computation**: Only the selected one or two experts are activated and perform computations, while all other experts remain "silent," consuming no computational resources.

This "conditional computation" model is a direct embodiment of the brain's dynamic sparsity principle. It brings a revolutionary advantage: **decoupling the model's parameter scale from the computational cost of a single inference**. We can expand the total number of parameters in the model to trillions (by increasing the number of experts), but the amount of computation (FLOPs) for processing each token depends only on the size of the few activated experts.

This explains the secret behind how modern large language models (GPT-4 is also rumored to be an MoE architecture) can possess vast knowledge capacity while maintaining relatively manageable inference costs in practical applications. The MoE architecture allows the model to develop highly specialized "neural circuits" (experts) internally and learn to call upon them intelligently according to the task's needs. This aligns perfectly with our understanding of the functional modularity of the cerebral cortex.

### 3.3 The Unified Framework: The Synergy of MoE-Transformers

When we combine the Transformer and MoE, what we get is not a simple 1+1=2, but a profound synergy. A sparsely-gated MoE-Transformer architecture simultaneously implements two of the brain's core functional principles:

- **The self-attention layers implement the "global workspace,"** responsible for broadcasting and integrating information within the context of the entire sequence.
- **The MoE layers implement "dynamic sparsity,"** responsible for executing specific, specialized computations with extreme efficiency.

In this unified framework, the flow of information becomes strikingly similar to our understanding of higher cognition: first, through the self-attention mechanism, the system gains a holistic grasp of the global context of the current task; then, based on this context, the system dynamically calls upon a set of the most suitable "experts" for deep processing via the MoE's gating network; the processed results can then be globally integrated again by subsequent attention layers.

This process iterates, allowing the model to flexibly alternate between global integration and local specialized processing at different levels of abstraction. This is perhaps the architectural secret to more powerful and more general artificial intelligence. It is no longer a passive, dense pattern matcher, but an active, sparse information processing system capable of dynamically reconfiguring its computational pathways according to the task.

## Conclusion: Farewell to Imitation, Embrace Function

Our journey in this article began with an observation of the "tribal wars" in the current AI field and culminated in a clear, highly integrated architectural blueprint. The core of this path is to complete a fundamental paradigm shift in research: **from a superficial imitation of biological "form" to a deep understanding and engineering implementation of intelligent "function."**

- We analyzed **SNNs**, whose obsession with spikes led them into a quagmire of difficult training and scalability, forgetting that the root of energy efficiency lies in macroscopic sparse activation, not microscopic firing mechanisms.
- We dissected **RNNs**, whose adherence to linear sequences saddled them with an inescapable "information bottleneck," forgetting that the essence of memory lies in on-demand, randomly accessible global retrieval, not linear state compression.

In contrast, the brain reveals its three core functional principles for success: achieving unparalleled energy efficiency through **dynamic sparsity**, enabling flexible information integration and control through a **global workspace**, and driving learning and understanding of the world through a **predictive processing** mechanism.

And when we use these three principles as a yardstick to re-examine the **Transformer** architecture, once considered "biologically implausible," especially in its sparse form combined with **MoE**, a whole new picture emerges. We find that:

- **The self-attention mechanism** is the most successful engineering approximation of the "global workspace" to date.
- **The Mixture-of-Experts model** is the most scalable implementation of the "dynamic sparsity" principle.
- And the process of a large model undergoing self-supervised learning on massive amounts of data is, in essence, executing "predictive processing"—building a generative model of the world and minimizing its prediction error.

Therefore, a massive model with a Transformer as its skeleton, MoE as its muscles, and self-supervised prediction as its objective is no longer a "black box" or an "engineering monster." It is a system that follows the same core computational principles as our brain. Its power is not accidental; it is because, at a functional level, it is doing the right thing.

The path forward is clear. True progress will no longer come from the meticulous carving of individual silicon neurons, but from building more efficient, more scalable architectures that can better implement these macroscopic functional principles. We need smarter routing algorithms to approximate the brain's dynamic connectivity, more powerful attention mechanisms to simulate the complex integration of consciousness, and more profound self-supervised learning objectives to drive a more fundamental understanding of the world.

It is time to bid farewell to this costly misunderstanding about imitation. Let's stop debating whether a model's "appearance" is like the brain and start focusing on whether its "behavior" embodies intelligence. Because ultimately, what determines whether a system can achieve general intelligence is not what it is made of, but how it computes.

_Rui Lin, For the future of digital mind_
