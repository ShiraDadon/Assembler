;invalid_input - fail on first pass (diretive & grammar)

;line bigger then 80
STR: .string "Areallyreallyreallyreallyreallyreallyreallyreallyreallyreallylongline."

;Commas issue - missing comma
mov r1 r2
cmp #45 r6

;Commas issue - consecutive commas
.data 1,, -1, 4, 0, 5
mov r1,, r2
.string ,, "Comma"
STR: ,, .string "Comma"

;Label without code
LABEL:

;Invalid charaters after code
add r2,r7 invalid
add #89, r4,
rts r2
stop here
clr r1, r2

;Data - invalid input
.data -7463453763
.data data
.data 1 -1, 4, 0, 5

;String - invalid input
.string "no quotes at the end
.string no quotes at the front"
.string "one" "two"

;Redefinition of symbol
.extern SYMBOL1
SYMBOL1: cmp r1, r1

;Redefinition and declered as entry but not defined
.extern SYMBOL2
.entry SYMBOL2

