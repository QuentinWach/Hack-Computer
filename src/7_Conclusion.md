# Notes & Conclusion

**The ideal computer can handle arbitrarily diverse and complicated tasks in parallel.**
In reality though, there are always trade-offs to be made which is why we develop different architectures most commonly the CPU and the Graphics Processing Unit (GPU). **CPU**s are great at handling various diverse complicated tasks one by one. **GPU**s are great at handling the many of the same simple tasks in parallel. But there is much more to modern designs than what I have talked about up until and I want to create a little overview.

### Modern CPUs
To summarize [this video](https://www.youtube.com/watch?v=_I8CLQazom0&list=PLTd6ceoshprfg23JMtwGysCm4tlc0I1ou), below, you can see a schematic overview of a typical CPU with multiple processing cores consisting of a control unit, ALU, and register coupled to various levels of cache memory (SRAM), and including a graphics controller which is typically connected to a GPU and a memory controller which in turn is connected to DRAM memory via a memory bus.

|![](typical_CPU_layout.jpg)|
| :-: |
|Schematic overview of a typical modern CPU.|

The different caches operate at varying speeds to distribute data among the cores efficiently. To further optimize the data exchange between the cores and the memory, the L1 cache is split into an instruction cache (ICache) and data cache (DCache). The ICache only writes and hence tells the core which operations to execute while the DCache only writes and reads data to and from the core.

If we compare this with the Hack computer architecture, its minimalism becomes clear. Modern CPUs have much more advanced capabilities. To summarize:

+ **Branching**: Modern CPUs have advanced branching capabilities, which allow them to make decisions and execute different code paths based on various conditions. This is a crucial feature that allows CPUs to handle complex, diverse tasks.
+ **Multiple Cores**: Modern CPUs typically have multiple processing cores, allowing them to execute multiple tasks or threads concurrently, improving overall performance. This became crucial in recent decades as Moore's Law started failing. And it goes much further than the original von-Neumann architecture.
+ **Hierarchical and More Optimized Cache**: As mentioned, modern CPUs have a hierarchical cache system (L1, L2, L3) with _specialized instruction and data caches_ (the so-called **Harvard architecture**, again, different from the von-Neumann architecture), which helps to efficiently manage and distribute data between the cores and main memory.
+ **Graphics Controller**: Many modern CPUs integrate a graphics controller, which offloads some graphics processing tasks from the main CPU cores, improving overall system performance.
+ **Larger Instruction Set and More Complex ALU/Control Unit**: Modern CPUs have a much larger and more complex instruction set, as well as more advanced Arithmetic Logic Units (ALUs) and Control Units, allowing them to handle a wider range of operations and tasks.

### Modern GPUs
Modern graphics are extremely data intensive (hence the PCI Express for greater bandwidth) and demand for parallel compute (hence vast amounts of cores a.k.a. "shader cores"). While there are many cores they all have comparatively simple instructions though. It follows the "Single Instruction, Multiple Data" (SIMD) paradigm. This is possible because there is a much more clear and repetitive pipeline for GPUs. After all, they were originally and are still primarily meant for graphics acceleration. Below, you can see an illustration of the graphics rendering pipeline (as summarized by [this video](https://www.youtube.com/watch?v=bZdxcHEM-uc)).

|![](graphics_processing_pipeline.jpg)|
| :-: |
|Schematic overview of a typical GPU's graphics rendering pipeline.|

Note also, that GPUs have no need for registers.

GPUs are quite general these days but they are still primarily optimized to handle graphics. So while they can also run parallel physics or neural networks, a dedicated physics processing unit or dedicated AI accelerators are still outperforming GPUs by a lot. The reason we do not see much of this yet is the ecosystem NVIDIA has built around their graphics cards and monopolizes. Indeed, NVIDIA introduced a dedicated core to solve the computationally heavy task of ray-tracing a few years ago. It will take time to build the software, workflows, hardware, and various integrations etc. for AI accelerators to take over. It will take even longer for this to happen for physics processors given that there is no clearly communicated demand for it on the market right now. 

### Parallelism: SISD to MIMD
SIMD describes computers with multiple processing elements that perform the same operation on multiple data points simultaneously rather than "Single Instruction, Single Data" (SISD) as in the Hack computer we've built. Below is an illustration of the general idea layed out originally in [Flynn's Taxonomy](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data):

|![](SIMD.jpg)|
| :-: |
|Flynn's Taxonomy of (parallel) processing with single or multiple data or instructions.|

GPUs are SIMD. And where the original computer and CPU was clearly SISD, modern CPUs, especially those used for supercomputers, are now typically MIMD, so that various different applications with different data can run in parallel. Yet, the complexity of such an architecture only allows for a relatively low number of cores compared to SIMD. Hence, ultra-parellilsm is only really feasable with SIMD.

<!--
### Modern TPUs


### Modern DPUs 
-->

<!-- GPU Verilog architecture. See:
+ https://github.com/adam-maj/tiny-gpu
>

<!--
### SIMD vs. SIMT
+ https://www.reddit.com/r/computerarchitecture/comments/r0v4h2/explain_the_difference_between_simd_and_simt_like/

+ https://en.wikipedia.org/wiki/Single_instruction,_multiple_threads

+ https://www.youtube.com/watch?v=4Pi424VJgcE&list=PLxNPSjHT5qvscDTMaIAY9boOOXAJAS7y4
-->

<!--
WORK THROUGH THIS ENTIRE SERIES!
GET THE BOOK!

https://www.youtube.com/watch?v=4Pi424VJgcE&list=PLxNPSjHT5qvscDTMaIAY9boOOXAJAS7y4

-->

<!--
### Energy Considerations

-->

<!-- WORK THROUGH THESE LECTURES!
1. https://www.youtube.com/watch?v=9nuAjYRbITQ
2. https://www.youtube.com/watch?v=foCkCSZXOt8
3. https://www.youtube.com/watch?v=BHMETwOXvWw

>

<!--
## Graphics Acceleration
NVIDIA likes to make people believe that their GPUs are General Processing Units rather Graphics Processing Units but it is no understatement to say that there goes in a lot to accelerate graphics which is far from optimal for accelerating anything else. 

The primary advantage of GPUs is the parallelism not the specialized processing elements.

At its heart, GPUs consist of a Graphics and Compute Array (GCA) a.k.a. the 3D engine which includes specialized Pixel and Vertex shaders aka CUDA cores, Texture Mapping Units (TMUs), Render Output Units (ROPs), L2 cache, Geometry processors, and more...

## Embarassingly Parallel Problems

## Cryptography

## Physics
A previous commercial physics processing unit only meant to accelerate game physics similar to how graphics processing units originally meant to accelerate and hence improve game graphics. But game physics is a typically a relatively minor contributor to the game experience which is why this capability was quickly integrated within graphics processing units as well making PPUs obsolete.

For reviving PPUs in the future, a more viable approach may be to develop PPUs for high-performance computing for scientific applications rather than gaming.

## Artificial Intelligence

-->

<!--## Future Ideas-->
<!--
Since there are so many other people who have already done quite similar projects, I do not plan to continue much further here. Still, general topics for future work may include:
### Software
+ Virtual Machine
+ High-Level Language
+ Compiler
+ Operating System
+ Running Doom?
+ Hardware emulator.
+ Compiler to code and run games on it in C or Python?
### Hardware
+ .gds Layout
+ TinyTapeout
+ FPGA tests
+ High resolution graphics to emulate a really cool retro game
  + Flappy Bird!
  + Fluid Simulation?
+ Assemble the computer on breadboards or PCB (provide files). 
-->

<!-- TPU See: 
https://github.com/eevaain/tiny-tpu/tree/main
>