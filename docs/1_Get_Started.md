To get started, a few tools are necessary. I use
+ [Visual Studio Code](https://code.visualstudio.com/) and
+ [Verilog HDL](https://en.wikipedia.org/wiki/Verilog)
to program the designs.

We then use
+ [Icarus Verilog](https://github.com/steveicarus/iverilog?tab=readme-ov-file#table-of-contents) for simulation as it is easier to install than [Verilator](https://github.com/verilator/verilator) on Windows, and
+ [GTKWave](https://gtkwave.github.io/gtkwave/install/win.html) for waveform viewing.

Optionally, [Logisim](http://www.cburch.com/logisim/) can be a nice playground to test circuit ideas fast.

## Installing Logisim
Installing Logisim is as easy as downloading the `.exe` from http://www.cburch.com/logisim/ and following the install instructions. It is a compiled program with an intuitive GUI. You can then go ahead and immediately build your first digital circuits. In fact, Logisim is quite capable of simulating any computer you want to build. But while it is more intuitive and great for testing ideas, it is also quite time-consuming for larger projects to draw and connect every component yourself. That's just one of many reasons for why we have programmatic hardware description languages.

## Installing Icarus Verilog & GTK Wave
[Download Icarus here](https://bleyer.org/icarus/). THis installation program will include gtkwave as well. Make sure to use the most recent version and during installation check the installation path box so that you can open Icarus and verilog simply by typing
```
>gtkwave
```
which opens a nice little GUI which we'll discuss later or
```
>iverilog
```
which will just print out some text in your terminal. [This video](https://www.youtube.com/watch?v=FqIhFxf9kFM) might be of great help to you and it also shows you how to write, simulate, and visualize the signals of your Verilog modules. It really is that simple. The whole ecosystem simply has terrible, terrible documentation.

## The Basic Workflow
The workflow overall using these tools is pretty straightforward and we'll repeat it over and over.

**Step 1**: Create a Verilog file. We'll call this one `test.v`:

```verilog
module myModule();

initial
  begin
    $display("Hello World!");   // This will display a message
    $finish ; // This causes the simulation to end.  Without, it would go on..and on.
  end

endmodule
```

This module simply prints out the classic "Hello World!". Great! 

**Step 2**. We compile the `.v` file using Icarus:

```bash
>iverilog -o test.vvp test.v
```

The -o switch assigns a name to the output object file. Without this switch the output file would be called a.out. The hello.v indicates the source file to be compiled. There should be practically no output when you compile this source code, unless there are errors.

**Step 3**. You are ready to simulate this Hello World verilog program. To do so, invoke as such:
```bash
>vvp test.vvp 
Hello World!
```

Now, inside Visual Studio Code you can install the _Verilog HDL_ extension which adds a little green button at the top of the window which helps you compile your verilog code instead of you having to type the command out in the terminal every time.