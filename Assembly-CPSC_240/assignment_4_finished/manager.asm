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
;  File name: manager.asm
;  Language: X86 with Intel syntax.
;  Max page width: 132 columns
;  Assemble: nasm -f elf64 -l manager.lis -o manager.o manager.asm

extern scanf
extern printf
extern getradicand


global square_root

segment .data

    ns_const dq 1000000000.0
    cs_const dq 1000000.0

	welcome_msg db "Welcome to Square Root Benchmarks by Samuel Vo ", 0
    contact_msg db "For customer service contact me at samvo@csu.fullerton.edu", 10, 0
    CPU_model db "Your CPU is %s", 10, 0


    enter_max_clock db "Enter the max clock speed for your CPU here in MHz (ex. 2.8 GHz = 2800 MHz): ", 0
    max_clock_msg db "Your max clock speed is %d MHz", 10, 0


    space db " ", 0
    newLine db " ", 10, 0
    period db " .", 0

    sqrt_msg db "The square root of %.10lf is %.11lf. ", 10, 0

    iteration_msg db "Next enter the number of times iteration should be performed: ", 0 
    int_form db "%d", 0


    tics_msg db "The time on the clock is %llu tics.", 10, 0

    sqrt_progress db "The bench mark of the sqrtsd instruction is in progress. ", 10, 0
    tics_msg_after db "The time on the clock is %llu tics and the benchmark is completed. ", 10, 0

    elapsed_time_msg db "The elapsed time was %llu tics", 10, 0

    one_comput_msg db "The time for one square root computation is %.5lf tics which equals %.5lf ns.", 10, 0

segment .bss
    cpuName resb 100

segment .text
square_root:
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

push qword 0   ;Remain on the boundary

;A welcome message is shown to the user 
push qword 0
mov rax, 0
mov rdi, welcome_msg ;"Welcome to Square Root Benchmarks by Samuel Vo"
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;A message about the contact info of the author is shown
push qword 0
mov rax, 0
mov rdi, contact_msg ;"contact_msg db "For customer service contact me at samvo@csu.fullerton.edu"
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;=========Get the CPU NAME =========================

mov r15, 0x80000002                     ;This value is passed to get information about the processor
mov rax, r15                            ;get processor brand and information
cpuid                                   ;cpu identification

mov[cpuName], rax                   ;gets the first 4 characters
mov[cpuName + 4], rbx
mov[cpuName + 8], rcx
mov[cpuName + 12], rdx

mov r15, 0x80000003
mov rax, r15
cpuid

mov[cpuName + 16], rax          ;This value is passed to get information about the processor         
mov[cpuName + 20], rbx          ;get processor brand and information              
mov[cpuName + 24], rcx          ;cpu identification
mov[cpuName + 28], rdx

mov r15, 0x80000004
mov rax, r15
cpuid

mov[cpuName + 32], rax          ;get last 4 characters
mov[cpuName + 36], rbx
mov[cpuName + 40], rcx
mov[cpuName + 44], rdx

;The cpu name is shown here to the user
push qword 0
mov rax, 0
mov rdi, CPU_model  ;"Your CPU is %s"
mov rsi, cpuName
call printf 
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;==== Get max clock speed ====
;The prompt to ask for user to input the max clock speed
push qword 0
mov rax, 0
mov rdi, enter_max_clock        ;"Your max clock speed is %d MHz"
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;The user inputs the max clock speed 
push qword 0
mov rax, 0
mov rdi, int_form       ;"%d"
mov rsi, rsp
call scanf
mov r15, [rsp]
pop rax

;Shows the max clock speed 
push qword 0
mov rax, 0
mov rdi, max_clock_msg      ;"Your max clock speed is %d MHz"
mov rsi, r15
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;======= get radicand ============
;The module for getting the radicand is called
push qword 0 
mov rax, 2
call getradicand        
movsd xmm12, xmm13      ;User input of the radicand is stored here
sqrtsd xmm11, xmm13      ;The result is stored after the square root here in xmm11
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;The square root result is shown here
push qword 0
mov rax, 2
mov rdi, sqrt_msg   ;"The square root of %.10lf is %.11lf. 
movsd xmm0, xmm12       
movsd xmm1, xmm11       
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;===== input iteration ========
;Message to prompt for the user to input iteration
push qword 0
mov rax, 0
mov rdi, iteration_msg      ;"Next enter the number of times iteration should be performed: "
call printf
pop rax


;User inputs the iteration as an int number
push qword 0
mov rax, 0
mov rdi, int_form   ;"%d"
mov rsi, rsp
call scanf
mov r14, [rsp]  ;iteration gets stored into r14
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;==== get tics before =========
;Here is where the tics is measured and counted before the benchmark test is run
xor rax, rax    ;zero out the rax register
cpuid               ;cpu identification
rdtsc                   
shl rdx, 32
add rax, rdx
mov r13, rax        ;stores the tics before in r13

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;The tics before message is shown with a value 
push qword 0
mov rax, 0
mov rdi, tics_msg       ;"The time on the clock is %llu tics."
mov rsi, r13
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;message about the progress of the sqrt
push qword 0
mov rax, 0
mov rdi, sqrt_progress  ;"The bench mark of the sqrtsd instruction is in progress. "
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;==== sqrt benchmark loop =====
;The loop to run the benchmark test based on user input
mov r11, 0      ;loop counter

beginLoop:
cmp r11, r14        ;condition to end when it reaches the iteration amount
je endLoop

;run sqrt(radicand)
sqrtsd xmm11, xmm13

inc r11             ;increment the loop
jmp beginLoop       ;return to the beginning
endLoop:

;===== tics after benchmark ====

;measure the tics after the benchmark test is ran
xor rax, rax        ;zero out the rax register
cpuid               ;cpu identification 
rdtsc               
shl rdx, 32
add rax, rdx
mov r12, rax        ;store the tics after into the r12 register

;Message to show the tics measured after running the program 
push qword 0
mov rax, 0
mov rdi, tics_msg_after ;"The time on the clock is %llu tics and the benchmark is completed. "
mov rsi, r12
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

;===== elapsed time ====
sub r12, r13        ;subtract the tics (after - before) to get elapsed time

;Message about the elapsed time in tics is shown
push qword 0
mov rax, 0
mov rdi, elapsed_time_msg   ;"The elapsed time was %llu tics"
mov rsi, r12
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax


;==== calculate one square root computation =====

;(elapsed tics) / (iterations) = (time for one square root computation)

cvtsi2sd xmm15, r12 ;elapsed time
cvtsi2sd xmm14, r14 ;iterations

divsd xmm15, xmm14      ;divide the elapsed tics with iterations and store into xmm15
movsd xmm10, xmm15      ;store it in another register for printing it out later

;convert max clock speed from MHz to GHz (max clock speed * 10^-3)
cvtsi2sd xmm13, r15

;copy 1000000 into the SSE register
movsd xmm12, [cs_const]

;multiply max clock speed in MHz * (10^6)
mulsd xmm12, xmm13

;copy 1 Billion into the xmm register
movsd xmm11, [ns_const]

;[(time for one square computation) / (max clock speed in GHz * 10^9)] * (1 * 10^9 nanoseconds) = nanoseconds

;[(time for one square computation) / (max clock speed in GHz * 10^9)]
divsd xmm15, xmm12

;result * (1 * 10^9 nanoseconds) = nanoseconds
mulsd xmm11, xmm15

;=== print our result =====
;Message to show the output for time of one square computation and in nanoseconds 
push qword 0
mov rax, 2
mov rdi, one_comput_msg     ;"The time for one square root computation is %.5lf tics which equals %.5lf ns."
movsd xmm0, xmm10           ;time of one square computation stored in xmm0
movsd xmm1, xmm11           ;nanoseconds stored in xmm1
call printf
pop rax

;Show a new line
push qword 0
mov rax, 0
mov rdi, newLine       ;" "
call printf
pop rax

movsd xmm0, xmm11       ;return the time for one square computation in ns back to main module

pop rax                 ;reverse the first push at the beginning

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
