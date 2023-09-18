

extern scanf
extern printf
extern getradicand
extern getfrequency


global display

segment .data

    ns_const dq 1000000000.0
    cs_const dq 1000000.0

	welcome db "Welcome to Activation Records by Antonio Gonzalez ", 10, 
                db "Please  enter the number of quadwords to be displayed: " , 0
    
    delay_prompt db "Please enter the delay interval between each outputted number in whole seconds: " , 0

    stack_message db "The value of rsp is %p" ,  10, 0 

    header db "Address                                  Value", 10, 0
    value db "0x%016lx                      %016lx ", 10, 0

    exit_msg db "The driver received this number for safekeeping: %d" , 10 ,0

    freq_msg db "The frequency of the clock in this computer is %d tic/sec" ,10 , 0

    int_form db "%d"


segment .bss
    cpuName resb 100

segment .text
display:
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

;welcome message and prompt for quadword
push qword 0
mov rax, 0
mov rdi, welcome
call printf
pop rax

;scan user input for number of quadwords
push qword 0
mov rax, 0
mov rdi, int_form   
mov rsi, rsp
call scanf
mov r15, [rsp]
pop rax

;prompt for delay input 
push qword 0
mov rax, 0
mov rdi, delay_prompt
call printf 
pop rax

;scan user input for delay in seconds
;push qword 0
;mov rax, 0
;mov rdi, int_form   
;mov rsi, rsp
;call scanf
;mov r14, [rsp]
;pop rax


;print out address 
push qword 0 
mov rax, 0
mov rdi, stack_message
mov rsi, rsp
call printf
pop rax

;" Address           Value"
push qword 0
mov rax, 0
mov rdi, header
call printf
pop rax

mov r12, 0      ;index for  loop
start_Loop:

cmp r12, r15      ;Condition when it reaches the end of the array
je finish
lea r13, [rsp + r12*8]
push qword 0
mov rax, 0                     ;accessing 1 xmm register
mov rdi, value          
mov rsi, r13
mov rdx, qword [r13] 
call printf    
pop rax

inc r12      
jmp start_Loop     

finish:

push qword 0 
mov rax, 0 

;exit msg
push qword 0
mov rax, 0
mov rdi, exit_msg
mov rsi, r15
call printf
pop rax

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
