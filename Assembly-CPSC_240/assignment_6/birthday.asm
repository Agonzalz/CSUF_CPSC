;****************************************************************************************************************************
;Program name: "Sleep Time".  Makes outputs some things with a delay.
;Copyright (C) 2023 Micah Baumann.                                                                                          *
;                                                                                                                           *
;This file is part of the software program "Sleep Time".                                                                   *
;Random Products is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                    *
;Random Products is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Micah Baumann
;  Author email: mbaumann@csu.fullerton.edu
;
;Program information
;  Program name: Sleep Time
;  Programming languages: One module in C++ and one module in X86
;  Date program began: 2023 May 5
;  Date of last update: 2023 May 5
;
;  Files in this program: main.cpp, birthday.asm
;  Status: Finished.
;
;This file
;   File name: manager.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l birthday.lis -o birthday.o birthday.asm

;===== Begin code area ================================================================================================

extern printf
extern scanf
extern usleep

global birthday

segment .data
welcome db "We will send a birthday greeting to Chris.", 10, 10, 0
prompt1 db "How many birthday cards do you wish to send?  ", 0
time1 db 10, "Thank you.  The time on the clock is now %llu tics.", 10, 10, 0
time2 db "The time on the clock is now  %llu tics", 10, 10, 0
greeting db "Happy Birthday, Chris", 10, 10, 0
elapsed db "The elapsed time was  %llu tics.", 10, 10, 0
end db "The elapsed time will be returned to the caller.", 10, 10, 0
delay db 10, "What is the delay time (ms) between sending greetings?  ", 0
freq db 10, "What is the max frequency of the cpu in this computer as a whole integer?  ", 0

; Input Forms
int_form db "%i", 0
float_form db "%lf", 0

segment .bss

segment .text

birthday:

;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf

push qword 0

; Block that displays welcome
push qword 0
mov rax, 0
mov rdi, welcome
call printf
pop rax

; Block that displays the first prompt
push qword 0
mov rax, 0
mov rdi, prompt1
call printf
pop rax

; Block that inputs the number of cards into r15
push qword 0
mov rax, 0
mov rdi, int_form
mov rsi, rsp
call scanf
mov r15, [rsp]
pop rax

; Block that displays the second prompt
push qword 0
mov rax, 0
mov rdi, delay
call printf
pop rax

; Block that inputs the delay into r12
push qword 0
mov rax, 0
mov rdi, int_form
mov rsi, rsp
call scanf
mov r12, [rsp]
pop rax

; Block that displays the third prompt
push qword 0
mov rax, 0
mov rdi, freq
call printf
pop rax

; Block that inputs the frequency into r11
push qword 0
mov rax, 0
mov rdi, int_form
mov rsi, rsp
call scanf
mov r11, [rsp]
pop rax

; Convert the delay into microseconds
mov rax, 1000
imul r12, rax

; Get the time in tics and put it in r14
cpuid
rdtsc
shl rdx, 32
add rdx, rax
mov r14, rdx

; Display the time in tics
push r14
push r14
push qword 0
mov rax, 0
mov rdi, time1
mov rsi, r14
call printf
pop rax
pop r14
pop r14

; Loop that outputs the greeting
mov r13, 0 ; counter
startLoop:
cmp r13, r15
je endLoop

; Block that displays the greeting
push qword 0
mov rax, 0
mov rdi, greeting
call printf
pop rax

; Sleep block
push qword 0
mov rax, 0
mov rdi, r12
call usleep
pop rax

inc r13
jmp startLoop
endLoop:

; Get the time in tics and put it in r13
cpuid
rdtsc
shl rdx, 32
add rdx, rax
mov r13, rdx

; Display the time in tics
push r13
push r13
push qword 0
mov rax, 0
mov rdi, time2
mov rsi, r13
call printf
pop rax
pop r13
pop r13

sub r13, r14

push r13
push r13
push qword 0
mov rax, 0
mov rdi, elapsed
mov rsi, r13
call printf
pop rax
pop r13
pop r13

; Block that displays the end message
push qword 0
mov rax, 0
mov rdi, end
call printf
pop rax

pop rax ;pop rax for the push at the beginning

; Return benchmark
mov rax, r13

;===== Restore original values to integer registers ===================================================================
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret