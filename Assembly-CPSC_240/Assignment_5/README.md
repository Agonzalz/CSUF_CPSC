## Preview

The goal of this assignment is to practice two techniques: validation of incoming numbers and performance comparison of two versions of the sine function.

The positive aspect is that you only develop two source files: driver and manager.

The negative aspect is that two new subject are in the challenge version of the program.

In lecture we’ll cover validation of float number and the Taylor series for the sine function.



## Baseline sample dialog

![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/a826959f-d437-4e98-ae12-2f967b4051d4)

The yellow portion is produced by the assembly source file we have called manager.asm In the past.

Replace Timmy’s name with your own name

Yes, there are only two source files in this program, namely: driver and manager.  The bash file is part of the program, but it is not called a source file.  Its other name is script file.  Therefore, this program has 3 files to be submitted.

The language of the driver is C++ or C.  You pick one.   To enhance your value in the job market you should pick C, but again that’s your choice.

Don’t forget to convert the number in degrees to a number in radians.  Then apply the Taylor series to the number in radians.

## Sample challenge dialog

![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/d29224f7-3748-46d1-8315-187929b23c5c)

We will discover which function executes faster: yours or the one in <math.h>.

We will also discover if the two functions produce the same value.

In lecture we can talk about some horrible rumors about function in the math library, and how they are able to execute so fast.

Concept discussion:  Suppose we want the sine value to be accurate to 8 decimal digits on the of the point.   How many terms should be included in the Taylor series.  Assume that the input value x lies between 0.0 and 2π.

## Sample challenge dialog with input errors

![image](https://github.com/Agonzalz/CSUF_CPSC/assets/60372524/27d41e0b-e3d5-4501-a6eb-a55aa5a4030a)

## Conclusion

You may program the baseline and submit it for points.  At a later time you may program the challenge and submit it for additional points.

Also, you may skip the baseline and go directly to the challenge and submit once for all the points.

The baseline requires 3 files.  The challenge requires more.

When you’re done test the bash file at least one in a Linux terminal window.  Even if it looks good in a window’s file editor it is still wrong when I go to execute the program.  The usual culprit is the lines terminate with carriage return in windows.  Carriage return will produce lots of errors when I run your programmed

Send all the source files to me at the usual place:  holliday@fullerton.edu

Due May 1, 2023 on or before 6am.



Tentative dates:

May 1   Assignment5

May 10  Concept test

May 15  Programming test

Tentative dates.   When I get a confirmation of these then this ‘tentative’ message will be removed.

