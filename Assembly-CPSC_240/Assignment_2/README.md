# Arrays

## Goals

Make an assembly program that teaches all of the following:
    =how to make an array
    =how to implement iteration
    =how to make professional looking programs
    =how to reject invalid inputs
    =add assembly programmer to your list of qualifications in your resume.


## Programming requirements

Make a hybrid program that produces the following output.  Additional details will be given later.

This style of programming is sometimes called hybrid programming because it uses functions taken directly from the libraries of C and C++.  Sometime there is no known function in the C++ library of functions that meets our needs then we create a brand new C++ function and use it when needed.
![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/9845266f-2d91-4579-86b8-ae80ee736048)

## Sample run #1 for the baseline version
![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/07e4517d-7760-4d92-998e-0038a9e630e2)

Color codes:
Blue background is produced by module Input_Array

Yellow background is produced by module Manager

Green background is produced by module Display_Array

Pink background is produced by module Main

Module append does not produce any visible output.

Module magnitude does not produce any visible output.

The assembly code output floats with 5 places on the right of the decimal point.

The driver outputs floats with 10 decimal places on the right of the decimal point. Including trailing zeros.

The numbers for magnitude are not mathematically.  They serve to show the relative position of the digits.

The unicode for circle plus is 0x2295.

Change Jaime’s name to be your own name.

The main driver must be compiled by the C language compiler.  If the C compiler is not used then the entire program is rejected.

Main is not part of the solution.  Do not put any code in Main except advertising.  [Download an updated copy of Assignment 1 and see the inserted text about restrictions on Main.]

The source code of each module must be in the language indicated in the calling diagram.  The professor truly likes the fact that you are creating lots of assembly code.  Your C and C++ modules are assumed to be perfect because everyone enrolled in this class is a known expert in those C languages.

The isfloat function is invalid if written in C or C++.   If isfloat is available in a public library of C or C++ then that public function may be used.  You must document where you obtained public function, and then the usage will be accepted.


## Sample run #2 for the challenge version

![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/0c6c8a1c-ef1a-4a72-88d4-baa70fd21522)


## What to submit.

The baseline program

When you complete the baseline version of this assignment you may send it in for credit.  It is worth 10 points.   Be sure to submit one file for each rectangle in the calling diagram on page 2.  Don’t zip the files – simply attach them.  Put “240-x Assignment 2 baseline” in the subject line.



The challenge program

If you finish the baseline and there are a few days remaining before the due date then you should definitely work on the challenge program.   The challenge program is an extension of the baseline program.   If you complete the challenge program, which includes the baseline, your score for Assignment 2 could reach 15 points.

That is 10 for the baseline program and 5 additional points for the challenge.

You may send me Assignment 2 more than one.   When I receive several submissions I always grade the newest one, and discard the older ones.

When you submit your program it will help the bookkeeping if  you put your section number in the subject line like this   CPSC 240-3.

In the body of the email include your name, the assignment number, and the program level.  As an example:    Jimmy Stewart,  Assign 2,  Baseline.

If your plan is to do both halves of this assignment  there is no need to send me the baseline alone.   Simply continue programming, finish both parts, and send me one program.  If you send me two halves of a program I still grade only the newest submission.

You really should work on the Challenge level program.  It is not extra credit, it is regular credit.
When you are done


When your program works correctly.   Then make it cosmetically correct.  Use a notice software license.   Remove any old comments remaining from the professor’s old program.  Remove the professor’s name and put your own name in the proper places.

Place descriptive comments before each block of an asm module.  The header comment cannot be so dumb as to repeat the code.  

This comment gains a zero:  “Input next number with scanf”.

This comment wins:  ‘Obtain from user the maximum salary for given pay grade”.

Send the program to me in an email message with 7 attachments or 8 attachments if you’re sending the challenge program.  In the subject line place the string “CPSC 240 Assignment 2 Baseline”  or .CPSC240 Assignment2 Challenge”.

The word is “attachment”.   A link is not an attachment.  

Don’t email me broken code: segfaults, missing modules, non-compiling modules, non-assembling modules, etc.   These are commonly called junk or mud programs.  If the professor or the grader consumes valuable time to test a junk program as if it were a serious piece of fine-tuned engineering, and it proves to be a junk program, then the assigned score will be the negative of the maximum point allotted for that assignment.

Email:   holliday@fullerton.edu


Due date and time: February 22, 2023 at 2:00am

Points:	Baseline = 15
		Challenge = 5
		Total = 20
