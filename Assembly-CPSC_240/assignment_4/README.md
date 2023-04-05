Introduction

The term “benchmark” generally means the act of measuring the performance of something.  In computer science the term is used to describe the performance of software or hardware components.  Bench marking is not testing to uncover bugs.  We assume bugs have been removed during earlier testing.  Bench marking seeks to measure the use of time and space by a program or by a processor.


Abstract view

Create a program with modules in the three languages of this course that will benchmark the performance of the square root instruction in SSE and also the square root program in the standard C library


Detail

We want to know how much time is require for an instruction to execute.  We’ll use the sqrtsd instruction in the SSE component.  The plan is to execute to execute the sqrtsd instruction many times, say 10 million times.   Measure the time required for those 10 million computations, then divide the execution time by 10 million to obtain a kind of average execution time for one instance of the sqrtsd instruction.

Why not simply execute the instruction one time and measure the elapsed time?  The simple reason is that performance varies and is dependent on other factors.  One factor is the clock speed of the cpu will vary with time.  However, the average execution time computed over millions of executions is probably a reasonably accurate measure of the true execution time for the instruction.
Sample dialog baseline

Welcome to Square Root Benchmarks by Jeffrey Miller

For customer service contact me at millerx86@csu.fullerton.edu

Your CPU is AMD Ryzen 3640.

Your max clock speed is 2800 MHz

Please enter a floating radicand for square root bench marking:  12.2

The square root of 12.1999999995 is 3.78457514234.

Next enter the number of times iteration should be performed:  1500000

The time on the clock is 2451294 tics.

The bench mark of the sqrtsd instruction is in progress.

The time on the clock is 2451399 tics and the benchmark is completed.

The elapsed time was 238884 tics

The time for one square root computation is 27.36841 tics which equals 9.28441 ns.

The main function has received this number 9.28441 and will keep it for future reference.

The main function will return a zero to the operating system.


Color codes:

Yellow:  get_radicand

Green:  main

White:  manager

Most of the output come from manager.
Notes about the dialog and about other things

A tic is a unit of time used by computers.   A second is a unit of time used by humans.  “ns” means nanosecond.  The conversion from number of tics to number of nanoseconds requires knowledge of the machines clock speed.

Replace Jeffery Miller with your own name and email address.

The numbers shown in the dialog are not mathematically correct.   They are place holders to show the form of the output.

The computed execution time will vary with clock speed.  The same program run on different computers will produce different execution times for the square root instruction.

The name of the number of which you compute the square root is radicand.

Make this program reach the professional level so that you can put it into your portfolio.

The portfolio of a computer science major is the collection best products produced during a person’s university career.  The portfolio is typically shared with a job interviewer when such a person asks to see some of what you have done.  Obviously, only your best works go into your portfolio.

CPSC 491 is the place to make a large project for your portfolio.  But it is ok to include other smaller projects like this assignment in your portfolio.

A program that uses e-registers will not be graded.

Clock speed and clock frequency are the same thing.  The unit of measure of frequency is usually the number of tics per second.  One tic per second is called 1 Hertz.  A billion tics per second is called 1.0 GHz.  Sometimes clock frequency is converted to megahertz or MHz.

The getfrequency function mentioned in this document has been created many times by students enrolled in 240.  If you make a web search your will probably find multiple copies of that function.  If you ask politely Johnson may even remember where he last saw that function.

Is reusing someone’s software ok?  Yes, provided that person has placed a suitable software license on it.  In commercial programming all new project reuse software whenever available and licensed properly for reuse.

Calling diagram


![image](https://user-images.githubusercontent.com/60372524/229990653-87bd5776-6738-4ac1-a51b-96553accd1c2.png)




The main loop which repeatedly computes the square root of a fixed radicand is inside manager.  You want that loop to execute as fast as possible.  Don’t let the loop access memory, call a function, or transfer data between SSE and GPRs

Don’t use any e-registers unless you are living two decades ago and you are visiting the year 2023 via a time warp.  In the later case please go back to 2003 and enjoy your programming there.





What is an email attachment.

This is for those people who claim the only way to send file is via a cloud storage service.

When you attach files to your email it must look like this:

![image](https://user-images.githubusercontent.com/60372524/229990760-bbdc65e0-f97f-492d-ae52-7a52123ea8d0.png)



You can physically see the files are intrinsically part of the email itself.  That is good.  Your files will be separated from the email message and will be graded.

Anything else is a link to never never land, and will not be graded.



Conclusion

Due time:  April 16 before 4:00am.  After 4am get 3 hours of sleep and be ready for class on Monday.


It is unknown if I will be able to grade this assignment for points.  If I an foresee sufficient time to include grading this assignment then I will update this page and I will announce that in the lectures.  As of now I don’t know.

The point value of this program is 15 points for the program.  There is no challenge part.

Should you do assignment 4 if no points are involved?  Yes, you should make this program for the simple reason that the technology of the cpu clock will appear on the final tests: concepts and programs.
