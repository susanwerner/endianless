ZERO    DB  0  ; all bits zero
ONES    DB  FF ; all bits one



T1 DB  00 ; temporary variable
T2     DB  00 ; temporary variable

Atemp       DB C3 ; 35 in hex
Btemp       DB 9C ; 49 in hex
rtemp     DB 00 ; result goes here.

xor:
NAND ZERO
NAND ONES


NAND ZERO ; FF
NAND ONES ; 00 
ADD Atemp ; A
NAND Btemp ; A nand B
ST T1 ; A nand B 
NAND Atemp ; (A nand B) nand A 
ST T2 ; (A nand B) nand A 
NAND ZERO ; FF 
NAND ONES ; 00 
ADD T1 ;  A nand B
NAND Btemp ; (this is t3) (A nand B) nand B
NAND T2 ; 
ST rtemp

; t1 = A nand B
; t2 = A nand t1
; t3 = B nand t1
; R = t2 nand t3


