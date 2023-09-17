# Hypotenuse


## Overview

Build a program in assembly language that will compute the length of the hypotenuse of a right triangle given the lengths of the two sides.



## Baseline required program




### Modular architecture

![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/9c3b77ba-6730-4975-8a02-8a9c002ec5e4)



The arrow points to the module being called.

A module is a source file.   The module may contain many functions.   For this class will contain only one function.

r.sh is a bash file.   The name could be anything.   The name could be the single letter ‘r’ or it could be a long name “pythagorianassignment1”.    The extension “sh” is symbolic for “shell”.  Most programmers include the extension in order to better remember the language of the code inside that file.

The set of all three files is called “the program”.  The correct terminology is that a program is a collection (set) of source files.   A program is not a single file except in the trivial case were the set contains a single file.

This baseline program is worth 10 points.

(In future assignments the baseline program may be valued at a different number.)

## User dialog
![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/26d0b258-a007-449e-8eca-dfcbb8ce3a7b)




Color codes
Yellow:  Output from module driver
Green:  Output from module pythagoras
Black on white background:  Input from keyboard.


Standard of precision
The pythagoras module outputs 6 decimal digits on the right of the point.
The driver module outputs 12 decimal digits on the right of the point.


Update programmer’s info
Replace Adele’s name and address with your own name and email address

Be aware
The value shown above for the hypotenuse is mathematically incorrect.  The purpose of that number is to show you the position of the number relative to the other parts of the dialog.

## Prepare your source files for submission

Put an open source license into each submitted file.

Document the initial section of each file in the style shown in all the sample program posted at the class website.

Make sure the asm file exhibits a block structure in the text segment.



## Submission of programs

At the time of this writing all the CS faculty are waiting to know if the higher administration has decided to allocate funds to hire graders to review your submitted programs.  We all hope for a positive reply from the CSUF administration approving funds to graders.   All of you enrolled in this class need the feedback telling you how you programming skills are developing.  We simply have to wait for the response.


Let’s assume the administration has approved the request for student graders.

The base line version of this program is worth 10 points.  When your program is complete and you have tested it with many different inputs then send the set of three source files to the professor as three attachments to a single email message.


What happens if the request for student graders is rejected?   The course will continue.   There will be a total of 6 programming assignments this semester.  There will be no feedback.

In all cases you should do the programming assignments because the midterm will be a test on the programming assignments of the first half of the semester.  That midterm test is worth a hundred points.  You should do the programs in order to have a chance to earn the hundred points of the midterm.

##  Challenge Optional Program

The Challenge program is worth 14 points if you opt for it.

When you are reading this I assume that you have completed the baseline program.  The challenge program does not count unless the base line program is working perfectly.


We all know that the length of a side of a triangle cannot be a negative number.  However, the baseline program does not take into account this fact.  Upgrade the pythagoras.asm file to detect and reject negative inputs.

The user dialog looks like the following:

![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/07b01ab3-d8fd-4011-a748-8e2718a3b232)


Notice how negative inputs are rejected until the user enters a positive or zero number.

