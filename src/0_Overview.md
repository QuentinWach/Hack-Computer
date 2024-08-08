![](header_design.png)
<!--[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub latest commit](https://badgen.net/github/last-commit/QuentinWach/HACK-CPU)](https://GitHub.com/QuentinWach/HACK-CPU/commits/main)-->

_"On the one hand, the Hack [general computer] architecture can be built in just a few hours of work, [...] at the same time, Hack is sufficiently general to illustrate the key operating principles and hardware elements underlying the design of any digital computer."_ [_Elements of Computing Systems_ (ECS)](https://www.nand2tetris.org/book). I recommend getting this book. But it can be helpful to hence also look into the related [NAND to Tetris course](https://www.nand2tetris.org/course). 

If you want to learn how to design a Hack computer and do all of the above, I documented every step of the process in the chapters below. This is not a guide to solve the famous [NAND-to-Tetris course](https://www.nand2tetris.org/book) challenges. I barely skimmed the book and didn't look at the course much.

1. [Overview](./0_Overview.html). This is where you are right now.
2. [Get Started](./1_Get_Started.html). Explains what we are going to do and guides you through the setup of all the tools. We'll end by writing a "Hello World!" of Verilog and simulating/testing it.
3. [Boolean Arithmetic](./2_Boolean_Arithmetic.html). Here, we'll create our first arithmetic modules, starting with a Half-Adder and ending with a complete, working Arithmetic Logic Unit (ALU).
4. [Sequential Logic](./3_Sequential_Logic.html). This chapter contains the code and notes for building registers for memory as well as a counter.
5. [Machine Language](./4_Machine_Language.html). This is where we'll write our first little program making use of the components we defined up to this point.
6. [Computer Architecture](./5_Computer_Architecture.html). We'll then finally put everything together, designing the whole hardware architecture of the computer containing, memory, instruction memory, and the CPU.
7. [Assembler](./6_Assembler.html). Finally, we'll write some Assembly for this computer concluding in an implementation of the game _Pong_.

