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
;   File name: append.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l append.lis -o append.o append.asm
;   Link: g++ -m64 -no-pie -o arrays.out manager.o input_array.o magnitude.o append.o display_array.o main.o -std=c17
;   Purpose: This module appends and places the contents into a third array. It then returns the size of the array to the
;            caller of the function.
;========================================================================================================



extern printf
extern scanf

global append

segment .data

segment .bss

segment .text

append:

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

;func append(arr1, arr2, arr3, s1, s2)
;returns toal number of elements
mov r15, rdi  ;r15 now holds arr1
mov r14, rsi
mov r13, rdx
mov r12, rcx 
mov r11, r8

push qword 0 

;loop to append array_A into appended array
mov r10, 0              ;index of array 1 
startloop1:
    cmp r10, r12        ;checks if index array has reached the end
    je endloop1
    movsd xmm13, [r15 + 8*r10]      ;convert bits from array into float and place it into xmm15
    movsd [r13 + 8*r10], xmm13      ;place value in xmm15 into dereferenced address of appended array at current index 
    inc r10
    jmp startloop1
endloop1:

;loop to append array_B into appended array
mov r9, 0             
startloop2:
    cmp r9, r11                   ;checks if index is at the end of the array 
    je endloop2
    movsd xmm12, [r14 + 8*r9]      ;convert bits from array into float and place it into xmm15
    movsd [r13 + 8*r10], xmm12     ;place value in xmm15 into dereferenced address of appended array at current index 
    inc r9
    inc r10
    jmp startloop2
endloop2:
pop rax

mov rax, r10

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