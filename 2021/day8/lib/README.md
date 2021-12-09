0 => 6 segments
1 => 2 segments *
2 => 5 segments
3 => 5 segments
4 => 4 segments *
5 => 5 segments
6 => 6 segments
7 => 3 segments *
8 => 7 segments *
9 => 6 segments


Using 1s and 7s, we can deduce which signal is connected to segment "a" : it's the one missing from the 1s.

Using 6s and 9s, we can deduce which signals are connnected to segments "c" and "e", however, we can't tell which is which. Combine that which 1s, we can differentiate them.

Combine with 7s, we can get segment "f"

With 4 and 8 and the 4 known signals, we can get to "g"

//Combine 4s with 2s to deduce segment "d"
//With 4, deduce segment "b"
//With 8, deduce the last segement.

 aaaa    aaaa    aaaa
b    c  b       b    c
b    c  b       b    c
b    c  b       b    c
         dddd    dddd
e    f  e    f       f
e    f  e    f       f
e    f  e    f       f
 gggg    gggg    gggg


1 2 3 4 5 6 7 8 9 0

 aaaa
b    c
b    c
b    c
 dddd
     f
     f
     f
 gggg