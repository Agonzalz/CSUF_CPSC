global input_array
extern scanf

onequad equ 8           ;8 bytes

segment .data
float_format db "&lf", 0

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

push qword, 0       ;staying on the boundary

;move recieved registers into nonvolatile registers
mov r15 , rdi       ;now r15 is the array
mov r14, rsi        ;r14 is the size of the array 

;users input until max array size is reached or ctrl + d is entered
mov r13, 0          ;index for array 
beginloop:
    ;exit loop when size of array is reached
    cmp r14, r13 
    je endloop
    
    ;input float number into array
    push qword, 0
    mov rax, 0 
    mov rdi, float_format
    mov rsi, rsp
    call scanf
    
    ;checks if user inputted ctrl+d
    cdqe
    cmp rax, -1
    je endloop

    ;copy input from rax into current array index
    mov [r15 + onequad*r13], rax
    inc r13         ;increment index
    jmp beginloop
endloop:
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