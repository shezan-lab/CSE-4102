; int E = 30;
; int X = 100;
; int D = 10 - E + X;

; for (int i = 0; i < 10; i++) {
;     if (E > 50) {
;         print(E);
;     } 
;     else if (E > 20) {
;         print(D);
;     } 
;     else if (D > 0) {
;         print(D);
;     } 
;     else {
;         print(E);
;     }
;     E--;  // Decrement E
; }

.686
.model flat, c
include D:\masm32\include\msvcrt.inc
includelib D:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG

.data
    output_integer_msg_format byte "%d", 0Ah, 0
    E sdword 30             ; E initialized with 30
    X sdword 100            ; X initialized with 100
    D sdword ?              ; D to be calculated
    i sdword ?              ; Loop counter

.code
main proc
    ; Calculate D = 10 - E + X
    mov eax, 10
    sub eax, E
    add eax, X
    mov D, eax

    ; Initialize the loop counter i = 0
    mov i, 0

for_loop_start:
    ; Check the loop condition (i < 10)
    mov eax, i
    cmp eax, 10
    jge exit               ; Exit if i >= 10

    ; If-Else Ladder
    ; First if (E > 50)
    mov eax, E
    cmp eax, 50
    jg print_E             ; Jump to print E if E > 50

    ; Else if (E > 20)
    cmp eax, 20
    jg print_D             ; Jump to print D if E > 20

    ; Else if (D > 0)
    mov eax, D
    cmp eax, 0
    jg print_D             ; Jump to print D if D > 0

    ; Else case
    jmp print_E            ; Default case, print E

print_E:
    ; Print E
    mov eax, E
    INVOKE printf, ADDR output_integer_msg_format, eax
    jmp continue_loop

print_D:
    ; Print D
    mov eax, D
    INVOKE printf, ADDR output_integer_msg_format, eax
    jmp continue_loop

continue_loop:
    ; Decrement E (E--)
    mov eax, E
    dec eax
    mov E, eax

    ; Increment i (i++)
    mov eax, i
    inc eax
    mov i, eax

    ; Jump back to the start of the loop
    jmp for_loop_start

exit:
    ret

main endp
end
