# Hardware architecture
> **Image 04-hardware-diagram.png**

Many I/O devices, but let's consider only one. Same for memory and CPU.

## Control Bus
Sincronizes all of the actions between all the devices attached to it.

## Address Bus
Hold the address of instructions and data that are being transfered between devices.

## Data Bus
Handles transfer data between devices

## CPU
Components:
- A high frequency clock;
- A control unit;
- The arithmetic logic unit (ALU);
- Storage locations known as registers;

### ALU
Complete logical operations like ADD, AND, OR, NOT, etc.

### Memory registers
A type of computer memory in the CPU. It's the fastest way to access data.

### CPU Clock
> **Image 04-clock.png**
Cycles between off and on (0 and 1), ticking at a constant rate.
Used to sinchronize operations between the CPU and Bus.
An operation is executed at every tick.
Measured in `oscillations per second` (1 GHz = 1 billion times per second). That means that a CPU that runs at 3 GHz executes 3 billion operations per second.

### Control unit
Decodes instructions, figure out what to do with 'em and directs operations of other units (memory, ALU, I/O).

#### The CPU completes a predefined set of steps to execute an instruction:
It's called a **fetch decode execute** procedure, and the steps are:
1. Fetch an instruction from the instruction queue;
2. Decode the instruction and check for operands (e.g., if the instruction is to add two numbers, the operands would be those two numbers);
3. If operands are involved, fetch the operands from memory/registers;
4. Execure the instruction and update status flags;
5. Store the result if required;


#### Reading from memory:
- Again, RAM access is slower than register access;
- Requires the following steps:
  1. Place the address of the value you want to read on the address bus;
  2. Changes the processor's RD pin (called assert). Basically tells the CPU we wanna read from memory;
  3. Wait one clock cycle for memory to respond;
  4. Copy the data from the data bus to the destination;
- Each step takes approximately one clock cycle;
- To compare, register access usually takes only one clock cycle in general, since bus interactions are not needed.

#### Caching
- To reduce read/write time for memory, caches are used;
- In x86, there are tipically two levels of cache:
  - Level-1 cache is stored on the CPU;
  - Level-2 cache is stored outside and accessed by high-speed data bus;
- Constructed using static RAM, which does not need to be refreshed constantly.
