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
;   File name: input_array.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm
;   Link: g++ -m64 -no-pie -o arrays.out manager.o input_array.o magnitude.o append.o display_array.o main.o -std=c17
;   Purpose: This module takes user input of floats and inserts them into an array. It then returns the size of the array. 
;========================================================================================================


extern scanf
extern clearerr
extern stdin

global input_array

;onequad equ 8           ;8 bytes

segment .data
float_format db "%lf", 0

segment .bss

segment .text

input_array:

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
mov r14, rsi        ;r14 is the size of the array 

;users input until max array size is reached or ctrl + d is entered
mov r13, 0          ;index for array 
beginloop:
    ;exit loop when size of array is reached
    cmp r13, r14
    je endloop
    
    ;input float number into array
    mov rax, 0 
    mov rdi, float_format
    push qword 0
    mov rsi, rsp
    call scanf
    
    ;checks if user inputted ctrl+d
    cdqe
    cmp rax, -1
    pop r12
    je endloop

    ;copy input from rax into current array index
    mov [r15 + r13*8], r12
    inc r13         ;increment index
    jmp beginloop
endloop:
;clears bits so that ctrl+d isn't automatically inputted when this module is called again
mov rax, 0
mov rdi, [stdin]
call clearerr
pop rax             ;counter from push at beginning
mov rax, r13        ;return number of floats in array back to manager




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