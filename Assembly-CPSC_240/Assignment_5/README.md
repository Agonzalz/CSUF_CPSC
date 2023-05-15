Preview

The goal of this assignment is to practice two techniques: validation of incoming numbers and performance comparison of two versions of the sine function.

The positive aspect is that you only develop two source files: driver and manager.

The negative aspect is that two new subject are in the challenge version of the program.

In lecture we’ll cover validation of float number and the Taylor series for the sine function.










Please continue to the next page.
Baseline sample dialog

Welcome to Asterix Software Development Corporation

This program Sine Function Benchmark is maintained by Timmy Fernandez

Please enter your name:  Chris Creel

It is nice to meet you Chris Creel.  Please enter an angle number in degrees:  22.5

Thank you.  Please enter the number of terms in a Taylor series to be computed:  200

Thank you.  The Taylor series will be used to compute the sine of your angle.

The computation completed in 395 tics and the computed value is 0.382683432

Thank you for using this program.  Have a great day.

The driver program received this number  395.   A zero will be returned to the OS.  Bye.


The yellow portion is produced by the assembly source file we have called manager.asm In the past.

Replace Timmy’s name with your own name

Yes, there are only two source files in this program, namely: driver and manager.  The bash file is part of the program, but it is not called a source file.  Its other name is script file.  Therefore, this program has 3 files to be submitted.

The language of the driver is C++ or C.  You pick one.   To enhance your value in the job market you should pick C, but again that’s your choice.

Don’t forget to convert the number in degrees to a number in radians.  Then apply the Taylor series to the number in radians.
Sample challenge dialog

Welcome to Asterix Software Development Corporation

This program Sine Function Benchmark is maintained by Timmy Fernandez

Please enter your name:  Chris Creel

It is nice to meet you Chris Creel.  Please enter an angle number in degrees:  22.5

Thank you.  Please enter the number of terms in a Taylor series to be computed:  20

Thank you.  The Taylor series will be used to compute the sine of your angle.

The computation completed in 395 tics and the computed value is 0.382683432

Next the sine of 22.499999995 will be computed by the function “sin” in the library <math.h>.

The computation completed in 448 tics and gave the value 0.382683991

Thank you for using this program.  Have a great day.

The driver program received this number  395.   A zero will be returned to the OS.  Bye.

//End of sample dialog




We will discover which function executes faster: yours or the one in <math.h>.

We will also discover if the two functions produce the same value.

In lecture we can talk about some horrible rumors about function in the math library, and how they are able to execute so fast.

Concept discussion:  Suppose we want the sine value to be accurate to 8 decimal digits on the of the point.   How many terms should be included in the Taylor series.  Assume that the input value x lies between 0.0 and 2π.
Sample challenge dialog with input errors

Welcome to Asterix Software Development Corporation

This named Sine Function Benchmark is maintained by Timmy Fernandez

Please enter your name:  Chris Creel

It is nice to meet you Chris Creel.  Please enter an angle number in degrees:  22.W5
Invalid. Please try again:  22R.99
Invalid.  Please try again  22.57.81
Invalid.  Please try again  35.0

Thank you.  Please enter the number of terms in a Taylor series to be computed:  25

Thank you.  The Taylor series will be used to compute the sine of your angle.

The computation completed in 395 tics and the computed value is 0.382683432

Next the sine of 22.499999995 will be computed by the function “sin” in the math library.

The computation completed in 448 tics and gave the value 0.382683991

Thank you for using this program.  Have a great day.

The driver program received this number 0.382683433487.   A zero will be returned to the OS.  Bye.


//End of sample dialog




Conclusion

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

