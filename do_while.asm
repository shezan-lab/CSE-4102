; int E = 30;
; int X = 100;
; int D = 10 - E + X;

; do {
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
;     E--;  // Decrement E to simulate loop exit eventually
; } while (E > 0);

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

.code
main proc
    ; Calculate D = 10 - E + X
    mov eax, 10
    sub eax, E
    add eax, X
    mov D, eax

do_while_start:
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

    ; Check the loop condition (while E > 0)
    cmp eax, 0
    jg do_while_start      ; If E > 0, loop back to start

exit:
    ret

main endp
end
