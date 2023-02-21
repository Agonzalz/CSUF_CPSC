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
;   File name: manager.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l manager.lis -o manager.o manager.asm
;   Link: g++ -m64 -no-pie -o arrays.out manager.o input_array.o magnitude.o append.o display_array.o main.o -std=c17
;   Purpose: This is the central module that will direct calls to different functions including display_array, magnitude, 
;            input_array, and append. Using those functions, the arrays created will be appennded and have their magnitude 
;            calcuated. It will then be returned to the caller of this function (in main.c).
;========================================================================================================



extern printf
extern scanf
extern input_array
extern display_array
extern magnitude
extern append

global manager 


segment .data
prompt_A db "This program will manage your arrays of 64 bit floats" , 10, 
         db "For array A enter a sequence of 64-bit floats separated by white space.", 10,
         db "After the last input press enter followed by Control+D:" ,10, 0 
        
display_A db 10, "These numbers were received and placed into array A: " ,10, 0 

magnitude_displayA db "The magnitude of array A is %.5lf", 10, 10, 0 

prompt_B  db "For array B enter a sequence of 64-bit floats separated by white space.", 10,
          db "After the last input press enter followed by Control+D:", 10, 0 

display_B db 10, "These numbers were received and placed into array B: " ,10 , 0 
magnitude_displayB db "The magnitude of array B is %.5lf", 10, 10, 0 

append_message db "Arrays A and B have been appended and given the name A", 0xE2, 0x8A, 0x95, " B.", 10,
               db "A", 0xE2, 0x8A, 0x95, " B contains" , 10, 0 

append_magnitude db 10, "The magnitude of A", 0xE2, 0x8A, 0x95, " B is %.5lf", 10, 10, 0 


segment .bss                        ;reserved for uninitialized data

myarray_A resq 50                ;reserve empty array of size 20 before run time
myarray_B resq 50
appended_array resq 100

segment .text 

manager:

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

push qword 0        ;remain on the boundary

;print prompt for user to input float
push qword 0 
mov rax, 0 
mov rdi, prompt_A
call printf 
pop rax

;Populate the array by calling input_array module
push qword 0
mov rax, 0 
mov rdi, myarray_A    ;array as first parameter
mov rsi, 8     ;length of array as second parameter
call input_array
mov r15, rax        ;r15 holds the size of the array
pop rax

;prompt: "These numbers were received and placed into array A:"
push qword 0 
mov rax, 0 
mov rdi, display_A
call printf
pop rax

;call display_array module to print out array
push qword 0 
mov rax, 0 
mov rdi, myarray_A
mov rsi, r15
call display_array
pop rax

;calculate the magnitude
push qword 0 
mov rax, 0
mov rdi, myarray_A
mov rsi, 8
call magnitude
movsd xmm15, xmm0           ;store ther return of magnitude function into xmm15
pop rax

;Print:"The Magnitude of array A is "
push qword 0 
mov rax, 1
mov rdi, magnitude_displayA
movsd xmm0, xmm15
call printf
pop rax

;prompt for array B
push qword 0 
mov rax, 0 
mov rdi, prompt_B
call printf
pop rax

;Populate the array by calling input_array module
push qword 0
mov rax, 0 
mov rdi, myarray_B      ;array as first parameter
mov rsi, 8              ;length of array as second parameter
call input_array
mov r14, rax            ;r15 holds the size of the array
pop rax

;prompt: "These numbers were received and placed into array B:"
push qword 0 
mov rax, 0 
mov rdi, display_B
call printf
pop rax

;call display_array module to print out array
push qword 0 
mov rax, 0 
mov rdi, myarray_B
mov rsi, r14
call display_array
pop rax

;calculate the magnitude of array_B
push qword 0 
mov rax, 0
mov rdi, myarray_B
mov rsi, 8
call magnitude
movsd xmm14, xmm0           ;store the return of magnitude into novolatile register
pop rax

;Print:"The Magnitude of array B is "
push qword 0 
mov rax, 1
mov rdi, magnitude_displayB
movsd xmm0, xmm14
call printf
pop rax

;display append message
push qword 0
mov rax, 0 
mov rdi, append_message
call printf
pop rax

;append arrays func append(array1, array, array3, size1, size2)
push qword 0
mov rdi, myarray_A 
mov rsi, myarray_B
mov rdx, appended_array
mov rcx, r15
mov r8, r14
call append
mov r13, rax 
pop rax


;print out appended array 
push qword 0 
mov rax, 0 
mov rdi, appended_array
mov rsi, r13
call display_array
pop rax

;calculate the magnitude of appended_array
push qword 0 
mov rax, 0
mov rdi, appended_array
mov rsi, r13
call magnitude
movsd xmm13, xmm0           
pop rax

;Print:"The Magnitude of A⊕ B is <magnitude>"
push qword 0 
mov rax, 1
mov rdi, append_magnitude
movsd xmm0, xmm13
call printf
pop rax

pop rax

movsd xmm0, xmm13



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
