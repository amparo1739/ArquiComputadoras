// Dirección:valor
STUR X1, [X0, #0] // MEM 0:0x1
STUR X2, [X0, #8] // MEM 1:0x2
STUR X3, [X16, #0] // MEM 2:0x3
ADD X3, X4, X5 // x3 = 9
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X3, [X0, #24] // MEM 3:0x9
SUB X3, X4, X5 // x3 = -1
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X3, [X0, #32] // MEM 4:0xFFFFFFFFFFFFFFFF
SUB X4, XZR, X10 // x4 = -10
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X4, [X0, #40] // MEM 5:0xFFFFFFFFFFFFFFF6
ADD X4, X3, X4 // x4 = -7
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X4, [X0, #48] // MEM 6:0xFFFFFFFFFFFFFFF5
SUB X5, X1, X3 // x5 = 2
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X5, [X0, #56] // MEM 7:0x2
AND X5, X10, XZR // x5 = 0
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X5, [X0, #64] // MEM 8:0x0
AND X5, X10, X3 // x5 = A
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X5, [X0, #72] // MEM 9:0xA
AND X20, X20, X20 // x20 = 20
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X20, [X0, #80] // MEM 10:0x14
ORR X6, X11, XZR // x6 = 11 = B
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X6, [X0, #88] // MEM 11:0xB
ORR X6, X11, X3 // x6 = F..F
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X6, [X0, #96] // MEM 12:0xFFFFFFFFFFFFFFFF
LDUR X12, [X0, #0] // x12 = 1
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
ADD X7, X12, XZR // x7 = 1
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X7, [X0, #104] // MEM 13:0x1
STUR X12, [X0, #112] // MEM 14:0x1
ADD XZR, X13, X14
//ADD XZR, XZR, XZR // NOP-------- no se si son necesarios estos
//ADD XZR, XZR, XZR // NOP--------
STUR XZR, [X0, #120] // MEM 15:0x0
CBZ X0, loop1       // Si salta
ADD XZR, XZR, XZR // NOP
ADD XZR, XZR, XZR // NOP
ADD XZR, XZR, XZR // NOP
STUR X21, [X0, #128] // MEM 16:0x0(si falla CBZ =21)
loop1: STUR X21, [X0, #136] // MEM 17:0x15
ADD X2, XZR, X1     // x2 = 1
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
loop2: SUB X2, X2, X1   // x2 = 0 // x2 = -1
ADD X24, XZR, X1        // x24 = 1              // 35
ADD XZR, XZR, XZR // NOP--------            
ADD XZR, XZR, XZR // NOP--------
STUR X24, [X0, #144] // MEM 18:0x1 y MEM 19=0x1     // 36
ADD X0, X0, X8  // x0 = 8 en teoria   // x0 = 16 (2do loop)
CBZ X2, loop2       //Salta y dsp No salta         // 38
ADD XZR, XZR, XZR // NOP
ADD XZR, XZR, XZR // NOP
ADD XZR, XZR, XZR // NOP
STUR X30, [X0, #144] // MEM 20:0x1E
ADD X30, X30, X30                           //40
SUB X21, XZR, X21                           //41
ADD XZR, XZR, XZR // NOP
ADD X30, X30, X20                           //42
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
LDUR X25, [X30, #-8]                        // 43
ADD X30, X30, X30                           // 44  
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
ADD X30, X30, X16                           // 45
ADD XZR, XZR, XZR // NOP--------
ADD XZR, XZR, XZR // NOP--------
STUR X25, [X30, #-8] // MEM 21:0xA (= MEM 9)
finloop: CBZ XZR, finloop
