
global manager 
extern input_array
extern display_array
extern printf
length equ 20

segment .data
information db "This program will manage your arrays of 64 bit floats For array A enter a sequence of 64-bit floats separated by white space. After the last input press enter followed by Control+D:" ,10 ,0 
display_prompt db "These number were received and placed into array A: " ,10 , 0 


segment .bss                        ;reserved for uninitialized data
myarray resq length                 ;reserve empty array of size length before run time

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

push qword, 0        ;remain on the boundary

;print prompt for user to input float
push qword, 0 
mov rax, 0 
mov rdi, information
call printf 
pop rax

;Populate the array by calling input_array module
push qword, 0
mov rax, 0 
mov rdi, myarray    ;array as first parameter
mov rsi ,length     ;length of array as second parameter
call input_array
mov r15, rax        ;r15 holds the size of the array
pop rax

;prompt: "These number were received and placed into array A:"
push qword, 0 
mov rax, 0 
mov rdi, display_prompt
call printf
pop rax

;call display_array module to print out array

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
