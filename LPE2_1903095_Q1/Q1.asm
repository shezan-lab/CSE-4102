; C like code
; E = 30;
; X = 100;
; D = 10 - E + X;
; if (E>0 && D>0) { print(D); }
; else { print(E); }

.686
.model flat, c
include D:\masm32\include\msvcrt.inc
includelib D:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
    output_integer_msg_format byte "%d", 0Ah, 0
    E sdword ?
    X sdword ?
    D sdword ?

.code
main proc
    mov eax,30
    mov E,eax

    mov eax,100
    mov X,eax
    
    mov eax,10
    sub eax,E
    add eax,X
    mov D,eax

if_: 
    mov eax,E
    cmp eax,0
    jle else_

    mov eax,D 
    cmp eax,0
    jle else_
    
    INVOKE printf, ADDR output_integer_msg_format,D 
    
    jmp exit

else_:
    INVOKE printf, ADDR output_integer_msg_format,E

exit:
    ret

main endp
end