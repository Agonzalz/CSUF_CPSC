;****************************************************************************************************************************
;Program name: "Sine Function Benchmark Program". This program demonstrates how a benchmark test is used for sine function *
;only accept floating point values, and a number of terms for the Taylor series. Then it calculates the sine of the user input. *
;It also calculates the sin function from the math library in C/C++. After all calculations are done the result and elapsed time *
;in tics are displayed to the user.                                                                                           *
;Copyright (C) 2023 Samuel Vo.                                                                                              *
;                                                                                                                           *
;This file is part of the software program "Sine Function Benchmark Program".                                                *
;"Sine Function Benchmark Program" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public *
;License version 3 as published by the Free Software Foundation.                                                            *
;Sine Function Benchmark Program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the  *
;implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more      *
;details. A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                   *
;***************************************************************************************************************************;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
; Author name: Samuel Vo
; Author email: samvo@csu.fullerton.edu
; Section: 240-7
;
;Program information
;  Program name: Sine Function Benchmark Program
;  Programming languages: One module in C, one module in X86 and one module in C++
;  Date program began: 2023-Apr-26
;  Date of last update: 2023-Apr-29
;  Date comments upgraded: 2023-Apr-28
;  Files in this program: manager.asm, isfloat.cpp, driver.c, r.sh
;  Status: Finished. Alot of testing for invalid inputs, and different angle inputs to make sure the program worked properly
;  and had consistent results. 
;  References consulted: Professor Holliday's lecture, Johnson Tong (SI Session)
;  Future upgrade possible: none
;
;Purpose
;  The purpose of this module is to manage the other modules in the program, and call them to get information or print out
;  important information about the program. In this case we use it for making calculations for the sine function. 
;  The program finds the elapsed time in tics after running the sine functions. The information is then displayed for the user to see. 
;  
;
;This file
;  File name: manager.asm
;  Language: X86 with Intel syntax.
;  Max page width: 132 columns
;  Assemble: nasm -f elf64 -l manager.lis -o manager.o manager.asm

extern scanf
extern printf
extern fgets
extern stdin
extern strlen
extern isfloat 
extern atof
extern sin

input_length equ 256

global sine

segment .data
    deg_rad dq 180.0

	welcome_msg db "This program Sine Function Benchmark is maintained by Samuel Vo ", 10, 0
    name_input db "Please enter your name: ", 0
    angle_input db "It is nice to meet you %s. Please enter an angle number in degrees: ", 0
    terms_input db "Thank you. Please enter the number of terms in a Taylor series to be computed: ", 0
    compute_msg db "Thank you. The Taylor series will be used to compute the sine of your angle. ", 10, 0
    complete_msg db "The computation completed in %llu tics and the computed value is %.9lf", 10, 0
    sin_math_msg db "Next the sine of %.9lf will be computed by the function ",34,"sin",34," in the library <math.h>. ", 10, 0
    sin_tics_msg db "The computation completed in %llu tics and gave the value %.9lf ", 10, 0

    invalid_msg db "Invalid. Please try again: ", 0

    string_form db "%s", 0
    float_form db "%lf", 0
    int_form db "%d", 0


    space db " ", 10, 0
    newLine db " ", 10, 0
    period db " .", 0

segment .bss
    name resb input_length

segment .text
sine:
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

;Message that welcomes user input
push qword 0       
mov rax, 0
mov rdi, welcome_msg  ;"This program Sine Function Benchmark is maintained by Samuel Vo "
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine      ;" "
call printf
pop rax

;Message that displays to prompt user to input name
push qword 0       
mov rax, 0
mov rdi, name_input  ;"Please Enter your name: ", 0
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine          ;" "
call printf
pop rax

;User inputs their name
push qword 0
mov rax, 0 
mov rdi, name           ;move name into argument register rdi
mov rsi, input_length       ;provide fgets with second argument, the size of the bytes reserved
mov rdx, [stdin]            ;move the contents at address stdin into 3rd register 
call fgets
pop rax

push qword 0
mov rax, 0
mov rdi, name               ;Move fullName into the first argument register
call strlen                     ;Call external function strlen, which returns the length of the string leading up to '\0'
sub rax, 1                      ;The length is stored in rax. Here we subtract 1 from rax to obtain the location of '\n'
mov byte [name + rax], 0    ; Replace the byte where '\n' exits with '\0'
pop rax

;==== input numbers & check for valid inputs =========
;Greeting message to the user to input the angle
push qword 0
mov rax, 0
mov rdi, angle_input       ;"It is nice to meet you %s. Please enter an angle number in degrees: "
mov rsi, name
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine            ;" "
call printf
pop rax

return:

;User inputs the angle in and takes it as a string
push qword 0
mov rax, 0
mov rdi, string_form        ;"%s"
mov rsi, rsp
call scanf

;Validate the user's input as a string input 
mov rax, 0
mov rdi, rsp
call isfloat

;Validate string value 
; Act on result from isfloat
cmp rax, 0 
je invalidInput

;The value is converted from string to float
mov rax, 0
mov rdi, rsp
call atof
movsd xmm15, xmm0       ;result is backed up into xmm register
pop rax

jmp continue

invalidInput:
;A invalid message displays if the user did not input a valid float value
mov rax, 0
mov rdi, invalid_msg        ;"The last input was invalid and not entered into the array. "
call printf
pop rax                     ;reverse the push qword in the loop if it runs into invalidInput
jmp return   

continue:

;Pi is used to convert the angle input into radians
mov rax, 0x400921FB54442D18
push rax
movsd xmm14, [rsp]
pop rax

movsd xmm13, [deg_rad]      ;The floating point value 180.0 is copied to xmm13

;pi/180
divsd xmm14, xmm13

;pi/180 * degrees = radians
mulsd xmm15, xmm14

;Message to let user know input number of terms for the Taylor series
push qword 0
mov rax, 0
mov rdi, terms_input        ;"Thank you. Please enter the number of terms in a Taylor series to be computed: "
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine            ;" "
call printf
pop rax

;Store the number of terms the user inputs for the Taylor series
push qword 0
mov rax, 0
mov rdi, int_form       ;"%d"
mov rsi, rsp
call scanf 
mov r15, [rsp]
pop rax

;Message that displays to the user when the benchmark test will begin
push qword 0
mov rax, 0
mov rdi, compute_msg     ;"Thank you. The Taylor series will be used to compute the sine of your angle. "
call printf 
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine            ;" "
call printf
pop rax

;======== get tics & calculations =====

;Here is where the tics is measured and counted before the benchmark test is run
xor rax, rax    ;zero out the rax register
cpuid               ;cpu identification
rdtsc                   
shl rdx, 32
add rax, rdx
mov r14, rax        ;stores the tics before in r14

;first term is x in sine, and it happens to also be user input
movsd xmm14, xmm15

;Using these numbers as a float in our equation (2.0, 3.0, -1.0)
mov rax, 2
cvtsi2sd xmm13, rax

mov rax, 3
cvtsi2sd xmm12, rax

mov rax, -1
cvtsi2sd xmm5, rax

;Clear xmm register for use to hold the total
xorpd xmm10, xmm10

;start k at 0, since we already have the first term of the sequence
mov r13, 0 ;loop counter
mov rax, r13
cvtsi2sd xmm11, rax

startLoop:
;Condition to check if the loop reaches the number of terms in a Taylor series
cmp r13, r15
je endLoop

;Add the current term of sequence
addsd xmm10, xmm14

; Then, compute the next term of the sequence (place into xmm14)
; 2n+3 - xmm13 * xmm11 + xmm12
; creating temporary register for calculations xmm9
;(2n + 3)
movsd xmm9, xmm13
mulsd xmm9, xmm11
addsd xmm9, xmm12

; 2n+2 - xmm13 * xmm11 + xmm13
; creating temporary register for calculations xmm8
;(2n + 2)
movsd xmm8, xmm13
mulsd xmm8, xmm11
addsd xmm8, xmm13


;(2n + 3)*(2n + 2)
mulsd xmm8, xmm9


;X^2
movsd xmm7, xmm15
mulsd xmm7, xmm7

;X^2
;--------
;(2n + 3)*(2n+2)
divsd xmm7, xmm8

;multiply -1
mulsd xmm7, xmm5

;multiply the recurrance relation against the current term and set the current term to result
mulsd xmm14, xmm7
inc r13
cvtsi2sd xmm11, r13
jmp startLoop

endLoop:

movsd xmm0, xmm10    ;The sine value is backed up to xmm0


;measure the tics after the benchmark test is ran
xor rax, rax        ;zero out the rax register
cpuid               ;cpu identification 
rdtsc               
shl rdx, 32
add rax, rdx
mov r12, rax        ;store the tics after into the r12 register

sub r12, r14        ;subtract the tics (after - before) to get elapsed time

;Message showing that the Benchmark test completed
push qword 0
mov rax, 1
mov rdi, complete_msg       ;"The computation completed in %llu tics and the computed value is %.9lf"
mov rsi, r12
movsd xmm0, xmm10
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine            ;" "
call printf
pop rax

;===== calculation for math.h sin and elapsed tics =====

movsd xmm13, [deg_rad]      ;constant float variable 180.0 is backed up to xmm13

;Pi is used to convert the angle input into radians
mov rax, 0x400921FB54442D18
push rax
movsd xmm14, [rsp]
pop rax

;180 * radians
mulsd xmm15, xmm13

;answer / pi 
divsd xmm15, xmm14

;Message showing the user's input and preparing it for computation 
push qword 0
mov rax, 1
mov rdi, sin_math_msg      ;"Next the sine of %.9lf will be computed by the function ",34,"sin",34," in the library <math.h>. "
movsd xmm0, xmm15
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine            ;" "
call printf
pop rax

;convert back to radians for calculations
;(pi/180)
divsd xmm14, xmm13

;(pi / 180) * degrees = radians 
mulsd xmm15, xmm14          ;The value in radians is backed up and stored in xmm15

;get tics before 
;Here is where the tics is measured and counted before the benchmark test is run
xor rax, rax    ;zero out the rax register
cpuid               ;cpu identification
rdtsc                   
shl rdx, 32
add rax, rdx
mov r14, rax        ;stores the tics before in r14


;Math.h library sine function "sin" is called for computation
push qword 0
mov rax, 2
movsd xmm0, xmm15
call sin
movsd xmm13, xmm0
pop rax

;measure the tics after the benchmark test is ran
xor rax, rax        ;zero out the rax register
cpuid               ;cpu identification 
rdtsc               
shl rdx, 32
add rax, rdx
mov r11, rax        ;store the tics after into the r11 register

sub r11, r14        ;subtract the tics (after - before) to get elapsed time

;The elapsed tics and sine value is displayed 
push qword 0
mov rax, 1
mov rdi, sin_tics_msg       ;"The computation completed in %llu tics and gave the value %.9lf "
mov rsi, r11
movsd xmm0, xmm13
call printf
pop rax

;A new line is shown
push qword 0
mov rax, 0
mov rdi, newLine            ;" "
call printf
pop rax

pop rax                 ;reverse the first push at the beginning

mov rax, r12            ;elapsed tics for the sine function created is returned to the driver module 


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