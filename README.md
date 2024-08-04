![](src/header_design.png)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub latest commit](https://badgen.net/github/last-commit/QuentinWach/HACK-CPU)](https://GitHub.com/QuentinWach/HACK-CPU/commits/main)

_"On the one hand, the Hack [general computer] architecture can be built in just a few hours of work, [...] at the same time, Hack is sufficiently general to illustrate the key operating principles and hardware elements underlying the design of any digital computer."_ [_Elements of Computing Systems_ (ECS)](https://www.nand2tetris.org/book). I recommend getting this book. But it can be helpful to hence also look into the related [NAND to Tetris course](https://www.nand2tetris.org/course). 

+ Learn and use **common tools in the industry** like [Verilog](https://en.wikipedia.org/wiki/Verilog) and [GtkWave](https://gtkwave.github.io/gtkwave/install/win.html) to create and test the Hack computer architecture.
+ Explains all the circuits of the architecture with the help of [Logisim](http://www.cburch.com/logisim/).
+ Learn to write some [Assembly](https://en.wikipedia.org/wiki/Assembly_language) and convert it to binary code using [Python](https://www.python.org) to make and play a little game.



<!--+ Learn how to use the provided emulator written in [C]() or [Python](). -->
<!-- + Create an actual `.gds` mask with the [OpenLane PDK](https://openlane2.readthesrc.io/en/latest/getting_started/newcomers/index.html) and see it in [KLayout](https://www.klayout.de/).
+ Visualize/render the 3D-chip using [IC3D](https://github.com/QuentinWach/IC3D).-->

<button style="width:200px; height:50px; font-size: 16px; background-color: crimson; color: white; font-style: bold; border-radius: 15px; box-shadow: 0px 0px 25px crimson; margin-left: auto; margin-right: auto; display: block;" href="https://www.quentinwach.com/Hack-Computer"> Get Started!</button>

---
I documented every step of the process in the chapters below.

1. [Overview](https://www.quentinwach.com/Hack-Computer/0_Overview.html). This is where you are right now.
2. [Get Started](https://www.quentinwach.com/Hack-Computer/1_Get_Started.html). Explains what we are going to do and guides you through the setup of all the tools. We'll end by writing a "Hello World!" of Verilog and simulating/testing it.
3. [Boolean Arithmetic](https://www.quentinwach.com/Hack-Computer/2_Boolean_Arithmetic.html). Here, we'll create our first arithmetic modules, starting with a Half-Adder and ending with a complete, working Arithmetic Logic Unit (ALU).
4. [Sequential Logic](https://www.quentinwach.com/Hack-Computer/3_Sequential_Logic.html). This chapter contains the code and notes for building registers for memory as well as a counter.
5. [Machine Language](https://www.quentinwach.com/Hack-Computer/4_Machine_Language.html). This is where we'll write our first little program making use of the components we defined up to this point.
6. [Computer Architecture](https://www.quentinwach.com/Hack-Computer/5_Computer_Architecture.html). We'll then finally put everything together, designing the whole hardware architecture of the computer containing, memory, instruction memory, and the CPU.
7. [Assembler](https://www.quentinwach.com/Hack-Computer/6_Assembler.html). Finally, we'll create an Assembler and write some Assembly for this computer concluding in an implementation of the game _Pong_.
8. [Conclusion](https://www.quentinwach.com/Hack-Computer/7_Conclusion.html). Some concluding thoughts, ideas for the future, tips, and useful references.


