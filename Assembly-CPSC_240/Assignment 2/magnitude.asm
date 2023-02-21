;****************************************************************************************************************************
;Program name: "Array Magnitude".                                                                                           *
; This program will allow a user to input float numbers in two arrays of size 50, and display the contents and maggnitude of*
; both arrays. It will also append both arrays into one, display the contents and calculate the new magnitude.              *
; Copyright (C) 2023 Antonio Gonzalez.                                                                                      *
;                                                                                                                           *
;This file is part of the software program "Array Magnitude".                                                               *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Antonio Gonzalez
;  Author email: antoniog@csu.fullerton.edu
;
;Program information
;  Program name: Array Magnitude
;  Programming languages: x86, C, bash
;  Date program began: 2023 February 14
;  Date of last update: 2023 February 21
;  Date of reorganization of comments: 2023 February 21
;  Files in this program: manager.asm, main.c, display_array.cc, magnitude.asm, input_array.asm, append.asm, run.sh
;  Status: Finished
;
;This file
;   File name: magnitude.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l magnitude.lis -o magnitude.o magnitude.asm
;   Link: g++ -m64 -no-pie -o arrays.out manager.o input_array.o magnitude.o append.o display_array.o main.o -std=c17
;   Purpose: This module calculates the magnitude of an array and returns that magnitude to the callee as a float number.
;========================================================================================================

global magnitude

segment .data

segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

magnitude:

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

push qword 0       ;staying on the boundary

;move recieved registers into nonvolatile registers
mov r15, rdi       ;now r15 is the array
mov r14, rsi       ;r14 is the size of the array 

;Loop array for magnitude
mov rax, 2     ;we will use two xmm registers
mov rdx, 0 
cvtsi2sd xmm15, rdx     ;convert 0 in rdx into something readable to xmm15
cvtsi2sd xmm14, rdx
mov r13, 0              ;array index
startloop:
    cmp r13, r14        ;check if loop ocunter is size of array 
    je endloop
    movsd xmm15, [r15 + 8*r13]      ;xmm15 holds current array value 
    mulsd xmm15, xmm15              ;square xmm15
    addsd xmm14, xmm15              ;add to previous index
    inc r13
    jmp startloop
endloop:
pop rax                              ;counter to push at beginning
sqrtsd xmm15, xmm14                  ;square root the sum of the array loop
xorpd xmm14, xmm14
movsd xmm0, xmm15                    ;return magnitude to caller
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

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
