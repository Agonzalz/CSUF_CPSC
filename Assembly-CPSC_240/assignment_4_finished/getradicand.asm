;****************************************************************************************************************************
;Program name:"Square Root Benchmark Program". This program takes the square root of the radicand value and does a benchmark test *
;during the process to look for the one time of a square root computation in tics, and the nanoseconds conversion. It will ask *
;for user to input the max clock speed of their device, and it displays information like CPU name of the device.            *                       
;Copyright (C) 2023 Samuel Vo.                                                                                              *
;                                                                                                                           *
;This file is part of the software program "Square Root Benchmark Program".                                                  *
;Square Root Benchmark Program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public *
;License version 3 as published by the Free Software Foundation.                                                            *
;Square Root Benchmark Program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the *
;implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more      *
;details. A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                   *
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Samuel Vo
;  Author email: samvo@csu.fullerton.edu
;  Section: 240-07
;
;Program information
;  Program name: Square Root Benchmark Program
;  Programming languages: One modules in C and two modules in X86
;  Date program began: 2023-Apr-10
;  Date of last update: 2023-Apr-15
;  Date comments upgraded: 2023-Mar-12
;  Files in this program: main.c, manager.asm, r.sh, getradicand.asm
;  Status: Finished. Alot of testing different for max clock speeds to make sure it runs and gives a reasonable output. 
;  References consulted: Professor Holliday's lecture, Johnson Tong (SI Session)
;  Future upgrade possible: none
;
;Purpose
;  The purpose of this module is to manage the other modules in the program, and call them to get information or print out
;  important information about the program. In this case we use it for making calculations for the square root of a radicand 
;  after getting the radicand from the getradicand module through user input. Then the program gets the tics before and after 
;  running the square root function. The information is used to run a benchmark test on the square root function. 
;  
;
;This file
;  File name: getradicand.asm
;  Language: X86 with Intel syntax.
;  Max page width: 132 columns
;  Assemble: nasm -f elf64 -l getradicand.lis -o getradicand.o getradicand.asm

extern scanf
extern printf

global getradicand

segment .data

get_radicand_msg db "Please enter a floating radicand for square root bench marking: ", 0
float_form db "%lf", 0

segment .bss


segment .text
getradicand:
;========================= Backup GPRs ==================

push rbp                        
mov rbp, rsp
push rdi                                           ;Backup rdi
push rsi                                           ;Backup rsi
push rdx                                           ;Backup rdx
push rcx                                           ;Backup rcx
push r8                                            ;Backup r8
push r9                                            ;Backup r9
push r10                                           ;Backup r10
push r11                                           ;Backup r11
push r12                                           ;Backup r12
push r13                                           ;Backup r13
push r14                                           ;Backup r14
push r15                                           ;Backup r15
push rbx                                           ;Backup rbx
pushf                                              ;Backup rflags

;========= start the program =============

push qword 0    ;remain on the boundary

;Prompt to ask user to enter a radicand for the square root benchmark test
push qword 0
mov rax, 0
mov rdi, get_radicand_msg       ; "Please enter a floating radicand for square root bench marking: "
call printf
pop rax

;User inputs the radicand as a floating point value
push qword 0
mov rax, 0
mov rdi, float_form         ;"%lf"
mov rsi, rsp
call scanf
movsd xmm13, [rsp]          ;store the user input into xmm13
pop rax

pop rax     ;reverse the push qword at the beginning of the program
;===== Restore original values to integer registers ===============================
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

;========1=========2=========3=========4=========5=========6=========7=========8==
