extern printf
extern scanf

global manager 

;length equ 256

segment .data
    welcome_msg db "Welcome to Square Root Benchmarks by Antonio Gonzalez", 10, 
                db "For customer service contact me at antoniog@csu.fullerton.edu", 10, 0
    
    cpu_display db "Your CPU is %s", 10, 0 

    speed_display db "Your max clock speed is %d MHz", 10, 0 

segment .bss                        ;reserved for uninitialized data

    cpu_name resb 256

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

;Display welcome message
push qword 0
mov rax, 0 
mov rdi, welcome_msg
call printf
pop rax

;============================= Get CPU Name =========================================================
mov r15, 0x80000002     ;value gets passed to cpuid for info about processor 
mov rax, r15 
cpuid                  ;identify CPU

;first 4 characters
mov [cpu_name], rax 
mov [cpu_name + 4], rbx 
mov [cpu_name + 8], rcx 
mov [cpu_name + 12], rdx 

;call again for next 4 characters 
mov r15, 0x80000003     
mov rax, r15 
cpuid

;next 4 characters
mov [cpu_name + 16], rax 
mov [cpu_name + 20], rbx 
mov [cpu_name + 24], rcx 
mov [cpu_name + 28], rdx 

;call again for next 4 characters 
mov r15, 0x80000004     
mov rax, r15 
cpuid

;last 4 characters
mov [cpu_name + 32], rax 
mov [cpu_name + 36], rbx 
mov [cpu_name + 40], rcx 
mov [cpu_name + 44], rdx 

push qword 0 
mov rax, 0 
mov rdi, cpu_display
mov rsi, cpu_name
call printf
pop rax
;=====================================================================================================

;get cpu clock speed 
mov rax,0x0000000000000016
cpuid
mov rdx, rbx      ;max frequency to rdx

;Display: "Your max clock speed is... "
push qword 0
mov rax, 0
mov rdi, speed_display
mov rsi, rdx
call printf
pop rax

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

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
