

;declare constants outside functions this fucntion
extern printf
extern scanf
global pythagoras:

segment .data
length1 db "Enter the length of the first side of the triangle: ",0
length2 db "Enter the length of the second side of the triangle: ",0
response db "Thank you. You entered two sides: %1.4lf and %1.4lf",10 ,0
hypotenuse db "The length of the hypotenuse is %1.4lf",10, 0
double_form db "%lf", 0 

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


;Prompt for side 1
push qword 0

push qword 0
mov rax, 0 
mov rdi, length1
call printf
pop rax

;Get side 1 and input to xmm12
push qword 0                    ;push 8 bytes of zeroes onto stack 
mov rax, 0
mov rdi, double_form
mov rsi, rsp                    ;function does not recognize rsp, only rsi as second argument
call scanf
movsd xmm12, [rsp]
pop rax

;Prompt for side 2
push qword 0
mov rax, 0 
mov rdi, length2
call printf
pop rax

;Second float to xmm13
push qword 0   
mov rax, 0
mov rdi, double_form            
mov rsi, rsp             
call scanf
movsd xmm13, [rsp]
pop rax

;Print 2 sides
push qword 0
mov rax, 2 
mov rdi, response 
movsd xmm0, xmm12
movsd xmm1, xmm13
call printf
pop rax

;square side 1 and 2
mov rax, 2
mulsd xmm12, xmm12
mulsd xmm13, xmm13

;add side 1 and 2 
mov rax, 1
addsd xmm12, xmm13

;compute hypotenuse
mov rax, 2 
sqrtsd xmm12, xmm12
movsd xmm13, xmm12

;print out hypotenuse
push qword 0 
mov rax, 1
mov rdi, hypotenuse
movsd xmm0, xmm13
call printf
pop rax

;return to driver 
mov rax, 1
movsd xmm0, xmm13

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
