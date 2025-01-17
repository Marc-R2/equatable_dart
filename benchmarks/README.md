# Equatable Benchmarks

Benchmarks used to measure the performance of equality comparisons using `package:equatable`.

## Quick Start

1. Install dependencies
   `dart pub get`
1. Run the benchmarks
   `dart run main.dart`

## Results

**JIT**

```
EmptyEquatable
          total runs:  1 738 191   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs

Empty
          total runs: 10 485 619   
          total time:     2.0000  s
         average run:          0 μs
         runs/second:   Infinity
               units:        100   
        units/second:   Infinity
       time per unit:     0.0000 μs
Empty: 10485619 runs, 8747428 more than 1738191 (503.24%)

PrimitiveEquatable
          total runs:    608 542   
          total time:     2.0000  s
         average run:          3 μs
         runs/second:    333 333   
               units:        100   
        units/second: 33 333 333   
       time per unit:     0.0300 μs

Primitive
          total runs:  3 716 744   
          total time:     2.0000  s
         average run:          0 μs
         runs/second:   Infinity
               units:        100   
        units/second:   Infinity
       time per unit:     0.0000 μs
Primitive: 3716744 runs, 3108202 more than 608542 (510.76%)

CollectionEquatable (static, small)
          total runs:    130 503   
          total time:     2.0000  s
         average run:         15 μs
         runs/second:     66 667   
               units:        100   
        units/second:  6 666 667   
       time per unit:     0.1500 μs

Collection (static, small)
          total runs:    253 860   
          total time:     2.0000  s
         average run:          7 μs
         runs/second:    142 857   
               units:        100   
        units/second: 14 285 714   
       time per unit:     0.0700 μs
Collection (static, small): 253860 runs, 123357 more than 130503 (94.52%)

CollectionEquatable (static, medium)
          total runs:     77 512   
          total time:     2.0000  s
         average run:         25 μs
         runs/second:     40 000   
               units:        100   
        units/second:  4 000 000   
       time per unit:     0.2500 μs

Collection (static, medium)
          total runs:    222 066   
          total time:     2.0000  s
         average run:          9 μs
         runs/second:    111 111   
               units:        100   
        units/second: 11 111 111   
       time per unit:     0.0900 μs
Collection (static, medium): 222066 runs, 144554 more than 77512 (186.49%)

CollectionEquatable (static, large)
          total runs:     16 291   
          total time:     2.0001  s
         average run:        122 μs
         runs/second:    8 196.7   
               units:        100   
        units/second:    819 672   
       time per unit:     1.2200 μs

Collection (static, large)
          total runs:    123 654   
          total time:     2.0000  s
         average run:         16 μs
         runs/second:     62 500   
               units:        100   
        units/second:  6 250 000   
       time per unit:     0.1600 μs
Collection (static, large): 123654 runs, 107363 more than 16291 (659.03%)

CollectionEquatable (dynamic, small)
          total runs:    327 657   
          total time:     2.0000  s
         average run:          6 μs
         runs/second:    166 667   
               units:        100   
        units/second: 16 666 667   
       time per unit:     0.0600 μs

Collection (dynamic, small)
          total runs:  1 774 829   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs
Collection (dynamic, small): 1774829 runs, 1447172 more than 327657 (441.67%)

CollectionEquatable (dynamic, medium)
          total runs:    325 110   
          total time:     2.0000  s
         average run:          6 μs
         runs/second:    166 667   
               units:        100   
        units/second: 16 666 667   
       time per unit:     0.0600 μs

Collection (dynamic, medium)
          total runs:  1 537 261   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs
Collection (dynamic, medium): 1537261 runs, 1212151 more than 325110 (372.84%)

CollectionEquatable (dynamic, large)
          total runs:    327 370   
          total time:     2.0000  s
         average run:          6 μs
         runs/second:    166 667   
               units:        100   
        units/second: 16 666 667   
       time per unit:     0.0600 μs

Collection (dynamic, large)
          total runs:  2 309 559   
          total time:     2.0000  s
         average run:          0 μs
         runs/second:   Infinity
               units:        100   
        units/second:   Infinity
       time per unit:     0.0000 μs
Collection (dynamic, large): 2309559 runs, 1982189 more than 327370 (605.48%)
```

**AOT**

```
EmptyEquatable
          total runs:  1 540 029   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs

Empty
          total runs:  8 335 722   
          total time:     2.0000  s
         average run:          0 μs
         runs/second:   Infinity
               units:        100   
        units/second:   Infinity
       time per unit:     0.0000 μs
Empty: 8335722 runs, 6795693 more than 1540029 (441.27%)

PrimitiveEquatable
          total runs:  1 079 344   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs

Primitive
          total runs:  1 938 397   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs
Primitive: 1938397 runs, 859053 more than 1079344 (79.59%)

CollectionEquatable (static, small)
          total runs:    121 511   
          total time:     2.0000  s
         average run:         16 μs
         runs/second:     62 500   
               units:        100   
        units/second:  6 250 000   
       time per unit:     0.1600 μs

Collection (static, small)
          total runs:    216 392   
          total time:     2.0000  s
         average run:          9 μs
         runs/second:    111 111   
               units:        100   
        units/second: 11 111 111   
       time per unit:     0.0900 μs
Collection (static, small): 216392 runs, 94881 more than 121511 (78.08%)

CollectionEquatable (static, medium)
          total runs:    101 473   
          total time:     2.0000  s
         average run:         19 μs
         runs/second:     52 632   
               units:        100   
        units/second:  5 263 158   
       time per unit:     0.1900 μs

Collection (static, medium)
          total runs:    197 004   
          total time:     2.0000  s
         average run:         10 μs
         runs/second:    100 000   
               units:        100   
        units/second: 10 000 000   
       time per unit:     0.1000 μs
Collection (static, medium): 197004 runs, 95531 more than 101473 (94.14%)

CollectionEquatable (static, large)
          total runs:     32 535   
          total time:     2.0000  s
         average run:         61 μs
         runs/second:     16 393   
               units:        100   
        units/second:  1 639 344   
       time per unit:     0.6100 μs

Collection (static, large)
          total runs:    100 009   
          total time:     2.0000  s
         average run:         19 μs
         runs/second:     52 632   
               units:        100   
        units/second:  5 263 158   
       time per unit:     0.1900 μs
Collection (static, large): 100009 runs, 67474 more than 32535 (207.38%)

CollectionEquatable (dynamic, small)
          total runs:    669 800   
          total time:     2.0000  s
         average run:          2 μs
         runs/second:    500 000   
               units:        100   
        units/second: 50 000 000   
       time per unit:     0.0200 μs

Collection (dynamic, small)
          total runs:  1 644 738   
          total time:     2.0000  s
         average run:          1 μs
         runs/second:  1 000 000   
               units:        100   
        units/second: 100 000 000   
       time per unit:     0.0100 μs
Collection (dynamic, small): 1644738 runs, 974938 more than 669800 (145.55%)

CollectionEquatable (dynamic, medium)
          total runs:    672 346   
          total time:     2.0000  s
         average run:          2 μs
         runs/second:    500 000   
               units:        100   
        units/second: 50 000 000   
       time per unit:     0.0200 μs

Collection (dynamic, medium)
          total runs:    791 858   
          total time:     2.0000  s
         average run:          2 μs
         runs/second:    500 000   
               units:        100   
        units/second: 50 000 000   
       time per unit:     0.0200 μs
Collection (dynamic, medium): 791858 runs, 119512 more than 672346 (17.77%)

CollectionEquatable (dynamic, large)
          total runs:    668 214   
          total time:     2.0000  s
         average run:          2 μs
         runs/second:    500 000   
               units:        100   
        units/second: 50 000 000   
       time per unit:     0.0200 μs

Collection (dynamic, large)
          total runs:    357 455   
          total time:     2.0000  s
         average run:          5 μs
         runs/second:    200 000   
               units:        100   
        units/second: 20 000 000   
       time per unit:     0.0500 μs
Collection (dynamic, large): 357455 runs, -310759 more than 668214 (-46.51%)
```

_MacBook Air (M1)_

Dart SDK version: 3.6.0 (stable) (Thu Dec 5 07:46:24 2024 -0800) on "macos_arm64"
