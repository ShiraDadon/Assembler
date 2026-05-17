;invalid_input - fail on first pass (instriction) (diretive)

;Instruction - missing operand
sub r2
clr
inc
add r2

;Instruction - too many operands
sub r2,r7, r4
clr r2, r2
stop r2

;Instruction - false adressing method of source operand 
lea #1, r1
lea r1, r1
lea *r1, r1

;Instruction - false adressing method of destination operand 
mov #1, #1
add #1, #1
sub #1, #1
lea LeaLabel, #1
clr #1
not #1
inc #1
dec #1
jmp #1
jmp r1
bne #1
bne r1
red #1
jsr #1
jsr r1

;Instruction - invalid operand
cmp r9, r9

;Invalid command
invalid command