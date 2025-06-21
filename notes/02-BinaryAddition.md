# Addition
0 + 0 = 0
0 + 1 = 1
1 + 0 = 1
1 + 1 = 10

  0 1 1 0 -> 6
+ 0 1 0 0 -> 4
= 1 0 1 0 -> 10
  ^ the 1 is carry from `1+1`

# Signed binaries
Binaries are group by 4 bits:
1001 0010 | 8 bits = 1 byte

To make a number negative, flip the top most bit of the binary to 1:
1000 0010 = -2 decimal
^      ^^ number 2
| this represents the sign

In base 10, if we add a value to its negative, the result is 0:
A + (-A) = 0

In binary, however, that's not the case:
  1000 0010 -> -2
+ 0000 0010 -> +2
= 1000 0100 -> -4

We want to apply the decimal scenario to binary, so both cases follow the same rules. This is done by applying the `Two's complement`:
  0000 0010 -> +2
  1111 1101 -> By fliping every bit, we get the `One's complement`
+         1 -> Now we add the `One's complement` to 1
= 1111 1110 -> This is the `Two's complement`
  ^ top most bit is 1, so negative number

Now if we add the two's complement to 2 again:
      1111 1110
+     0000 0010
=   1 0000 0000 -> 0
    ^ this bit is carried all the way to the top from the 2nd to bottom bits addition, but we ignore it.
