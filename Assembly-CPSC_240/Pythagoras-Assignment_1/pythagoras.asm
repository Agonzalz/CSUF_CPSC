;***************************************************************************************************************************
;Program name: "Pythagoras".  This program calculates the the hypotenuse of a right triangle in x86                         *
;Copyright (C) 2023 Antonio Gonzalez                                                                                        *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************



;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

;Author information
;  Author name: Antonio Gonzalez
;  Author email: antoniog@fullerton.edu
;
;Program information
;  Program name: Pythagoras
;  Programming languages: One modules in C++ and one module in X86
;  Date program began: 2023 Jan 23
;  Date of last update: 2023 Feb 4
;  Comments reorganized: 2023 Feb 4
;  Files in the program: driver.cpp, pythagoras.asm, run.sh
;
;Purpose
;  Calculate the hypotenuse of a right trinagle in x86
;
;This file
;  File name: pythagoras.asm
;  Language: X86-64
;  Syntax: Intel
;  Max page width: 172 columns
;  Optimal print specification: Landscape, 7-point font, monospace, 172 columns, 8½x11 paper
;  Assemble: nasm -f elf64 -l pythagoras.lis -o pythagoras.o pythagoras.asm
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;
;
;===== Begin code area ====================================================================================================================================================


extern printf
extern scanf
global pythagoras:

segment .data
length1 db "Enter the length of the first side of the triangle: ",0
length2 db "Enter the length of the second side of the triangle: ",0
response db "Thank you. You entered two sides: %1.6lf and %1.6lf",10 ,0
hypotenuse db "The length of the hypotenuse is %1.6lf",10 ,10 ,0
double_form db "%lf", 0 
newline db 10

segment .bss
;Empty

segment .text
pythagoras:

;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags


push qword 0                    ;create space on stack

;Prompt for side 1
push qword 0
mov rax, 0 
mov rdi, length1
call printf                     ;printf takes argument from rdi
pop rax

;First input to xmm12
push qword 0                    ;push 8 bytes of zeroes onto stack 
mov rax, 0
mov rdi, double_form
mov rsi, rsp                    ;function does not recognize rsp, only rsi as second argument
call scanf                      ;looks at top of stack hence previous instruction 
movsd xmm12, [rsp]              ;[rsp] dereferences rsp
pop rax

;Prompt for side 2
push qword 0
mov rax, 0 
mov rdi, length2
call printf
pop rax

;Second input to xmm13
push qword 0   
mov rax, 0
mov rdi, double_form            
mov rsi, rsp             
call scanf
movsd xmm13, [rsp]              ;[rsp] dereferences rsp
pop rax

;Newline to separate input and output section 
push qword 0 
mov rax, 0 
mov rdi, newline
call printf
pop rax

;Print the two sides
push qword 0
mov rax, 2                      ;Handling 2 xmm registers this block, hence the 2
mov rdi, response 
movsd xmm0, xmm12               ;movsd for xmm register 
movsd xmm1, xmm13
call printf                     ;printf takes lower xmm registers as arguments
pop rax

;square side 1 and 2
mov rax, 2
mulsd xmm12, xmm12 
mulsd xmm13, xmm13

;add side 1 and 2 
mov rax, 1
addsd xmm12, xmm13

;compute hypotenuse
mov rax, 1
sqrtsd xmm12, xmm12

;print out hypotenuse
push qword 0 
mov rax, 1
mov rdi, hypotenuse
movsd xmm0, xmm12               ;move hypotenuse to xmm0 for printf as argument
call printf
pop rax

;return to driver 
mov rax, 1
movsd xmm0, xmm12               ;when ret is called, function returns xmm0 to driver

pop rax




;===== Restore original values to integer registers ===================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret
