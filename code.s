.global _boot
.text

_boot:                    /* x0  = 0    0x000 */
    /* Test ADDI */
    addi x1 , x0,   1000  /* x1  = 1000 0x3E8 */
    addi x2 , x1,   2000  /* x2  = 3000 0xBB8 */
    addi x3 , x2,  -1000  /* x3  = 2000 0x7D0 */
    addi x4 , x3,  -2000  /* x4  = 0    0x000 */
    addi x5 , x4,   1000  /* x5  = 1000 0x3E8 */

    la x6, variable
    lw x8, 0(x6)
	la x6, count
    la x7, display
    lw x7, 0(x7)
    lb x8, 0(x6)
    addi x9, x9, 0
_counter:
	sb x9, 0(x7)
    addi x9, x9, 1
    addi x8, x8, -1
    bne x8, x0, _counter
 	la x6, screen
    lw x6, 0(x6)
    la x9, hello
    lb x8, 0(x9)
_writer:
    sb x8, 0(x6)
    addi x9, x9, 1
    lb x8, 0(x9)
    bne x8, x0, _writer
    nop
    nop
    nop
.data
variable:
 .word 0xdeadbeef
screen:
 .word 0x80000000
display:
 .word 0x80000001
count:
 .byte 0x26
 .align 2
hello:
 .asciz "Wake up, Neo..."