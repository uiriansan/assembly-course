# Base 16 (hexadecimal)
0-9 and A - F: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F
so:
0 = 0
9 = 9
A = 10
F = 15

## Why hexadecimals?
They are very good at representing binaries. Take the highest possible 4 bits binary:
1111
1  1  1  1
2³ 2² 2¹ 2^0
1111 = (1*2³)+(1*2²)+(1*2¹)+(1*2^0)
1111 = 8+4+2+1
1111 = 15
15 decimal = `F` hexadecimal

...so, we can represent this entire half-byte with just `F`. A full byte would be simply `FF`.

Consider the follow binary value:
  0100 1101
=    4   13 decimal
=    4    D hexadecimal
so, 0100 1101 = 4D

If we had a 64 bits value, that would be a massive string in binary, but in hexadecimal it can be represented by only 16 (64/4) characters.
