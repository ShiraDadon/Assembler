;valid_input

;entry & extern before code
.entry MovLabel
.extern CmpLabel
.entry AddLabel
.extern SubLabel
.entry STRING1
.entry STRING2
.entry DATA1
.entry DATA2

;macro 
macr macro
mov r1,r2
endmacr

;String and data before code
STRING1: .string "string1 with spaces"
DATA1: .data 1, -1, 4, 0, 5

;mov command
;call macro
macro
mov #2, MovLabel
 MovLabel:    mov *r4,r2

;cmp command
cmp #45,r6
cmp CmpLabel, *r4

;add command
add AddLabel, AddLabel
 AddLabel: add r2,r7
add #89, r4

;sub command
sub SubLabel, SubLabel
sub r2,r7
sub #89, r4

;entry & extern in middle of code
.entry LeaCommand
.extern ClrLabel
.entry NotLabel
.extern IncLabel

;lea command
lea LeaCommand, LeaCommand
 LeaCommand:    lea LeaCommand, r2

;clr command
clr r1
clr ClrLabel
clr *r1

;not command
NotLabel: not r1
not NotLabel
not *r1

;inc command
inc r1
inc IncLabel
inc *r1

;dec command
DecLabel: dec r1
dec DecLabel
dec *r1

;jmp command
jmp JmpLabel
jmp *r1

;bne command
bne BneLabel
BneLabel: bne *r1

;red command
red r1
red RedLabel
red *r1

;prn command
prn r1
prn PrnLabel
prn *r1
prn #1

;jsr command
jsr JsrLabel
jsr *r1

rts

stop

;extern & entry after code
.entry DecLabel
.extern JmpLabel
.entry BneLabel
.extern RedLabel
.extern PrnLabel
.extern JsrLabel

;String and data after code
DATA2: .data 1, 2, 3, 4, 5
STRING2: .string "string2 with consecutive commas ,,"
