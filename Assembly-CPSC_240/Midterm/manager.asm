;Program: hamonic sum
;Author: Antonio Gonzalez
;Email: antoniog@csu.fullerton.edu
;Course and Section: CPSC240-3
;Date: Mar 22, 2023

extern scanf
extern printf
extern stdin
extern fgets
extern input_array
extern hsum
extern display_array
extern strlen



global manager

input_length equ 256 ;Max bytes of full name, and title

length equ 50

segment .data

enterprompt db "Please Enter your name: ", 0
message1 db "This program will computer the harmonic sum of the numbers in your array ", 10, 0
message2 db "Enter a sequence of float numbers separated by white space.", 10, 0 
message3 db "After the last input press enter followed by Control+D:", 10, 0 
display_prompt db "These number were received and placed into the array: ", 10, 0 

sum_msg db "The harmonic sum of the %.5lf in this array is %.5lf", 10, 0

exit_msg db "We hope you liked this program ", 0
exit_msg2 db 10, "This program will return to the main function", 0

segment .bss
    myarray_A resq length              ;reserve empty array of size 20 before run time
	fullName resb input_length


segment .text

manager:
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

push qword 0   ;Check on the boundary

;Message that displays to prompt user to input name
push qword 0       
mov rax, 0
mov rdi, enterprompt  ;"Please Enter your name: ", 0
call printf
pop rax

;User inputs their name
push qword 0
mov rax, 0 
mov rdi, fullName           ;move fullName into argument register rdi
mov rsi, input_length       ;provide fgets with second argument, the size of the bytes reserved
mov rdx, [stdin]            ;move the contents at address stdin into 3rd register 
call fgets
pop rax

push qword 0
mov rax, 0
mov rdi, fullName               ;Move fullName into the first argument register
call strlen                     ;Call external function strlen, which returns the length of the string leading up to '\0'
sub rax, 1                      ;The length is stored in rax. Here we subtract 1 from rax to obtain the location of '\n'
mov byte [fullName + rax], 0    ; Replace the byte where '\n' exits with '\0'
pop rax

push qword 0       
mov rax, 0
mov rdi, message1
call printf
pop rax

push qword 0       
mov rax, 0
mov rdi, message2
call printf
pop rax

push qword 0       
mov rax, 0
mov rdi, message3
call printf
pop rax

push qword 0
mov rax, 0 
mov rdi, myarray_A    ;array as first parameter
mov rsi, length     ;length of array as second parameter
call input_array
mov r14, rax        ;r14 holds the size of the array
pop rax

push qword 0 
mov rax, 0 
mov rdi, display_prompt
call printf
pop rax

;call display_array module to print out array
push qword 0 
mov rax, 0 
mov rdi, myarray_A
mov rsi, r14
call display_array
pop rax

push qword 0
mov rax, 0
mov rdi, exit_msg
call printf
pop rax

;User's full name is shown
push qword 0
mov rax, 0 
mov rdi, fullName  
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, exit_msg2
call printf
pop rax


;=========================END OF EXECUTIVE MODULE=================================

pop rax         ;Reverse the first push qword at the beginning


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
