.386
.model flat,stdcall
.stack 4096
include Irvine32.inc

.data
title BYTE "=== x86 Assembly Big Integer Calculator ===",0
msg1  BYTE "Enter first 64-bit number (high part then low part):",0
msg2  BYTE "Enter second 64-bit number (high part then low part):",0
msgAdd BYTE "Addition result: ",0
msgSub BYTE "Subtraction result: ",0
num1  DWORD 2 DUP(0)
num2  DWORD 2 DUP(0)
res   DWORD 2 DUP(0)

.code
main PROC
    mov edx, OFFSET title
    call WriteString
    call CrLf
    call CrLf

    mov edx, OFFSET msg1
    call WriteString
    call CrLf
    call ReadInt
    mov num1[4], eax
    call ReadInt
    mov num1[0], eax

    mov edx, OFFSET msg2
    call WriteString
    call CrLf
    call ReadInt
    mov num2[4], eax
    call ReadInt
    mov num2[0], eax

    mov eax, num1[0]
    add eax, num2[0]
    mov res[0], eax
    mov eax, num1[4]
    adc eax, num2[4]
    mov res[4], eax

    mov edx, OFFSET msgAdd
    call WriteString
    call CrLf
    mov eax, res[4]
    call WriteInt
    call WriteString, OFFSET ", "
    mov eax, res[0]
    call WriteInt
    call CrLf
    call CrLf

    mov eax, num1[0]
    sub eax, num2[0]
    mov res[0], eax
    mov eax, num1[4]
    sbb eax, num2[4]
    mov res[4], eax

    mov edx, OFFSET msgSub
    call WriteString
    call CrLf
    mov eax, res[4]
    call WriteInt
    call WriteString, OFFSET ", "
    mov eax, res[0]
    call WriteInt
    call CrLf

    call ExitProcess,0
main ENDP
END main
