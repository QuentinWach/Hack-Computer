# Notes & Conclusion

**The ideal computer can handle diverse and complicated tasks in parallel.**
In reality though there are always trade-offs to be made which leads to why we develop different architectures.

CPUs are great at handling various diverse complicated tasks one by one.

GPUs are great at handling the many of the same simple tasks in parallel.

Even this is an over-simplification though. GPUs are quite general these days but they are still primarily optimized to handle graphics. So while they can also run parallel physics or neural networks, a dedicated physics processing unit or dedicated AI accelerators are still outperforming GPUs by a lot. The reason we do not see much of this yet is the ecosystem NVIDIA has built around their graphics cards and monopolizes. It will take time to build the software, workflows, hardware, and various integrations etc. for AI accelerators to take over. It will take even longer for this to happen for physics processors given that there is no clearly communicated demand for it on the market right now.

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