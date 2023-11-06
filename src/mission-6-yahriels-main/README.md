[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-c66648af7eb3fe8bc4f294546bfd86ef473780cde1dea487d3c4ff354943c9ae.svg)](https://classroom.github.com/online_ide?assignment_repo_id=8738254&assignment_repo_type=AssignmentRepo)
# Mission 6
# C programming
# Functions and Files

## Statement of Academic Integrity

In compliance with the ISU Academic Misconduct Policy expectations, I will not give or receive unauthorized aid in the completion of this lab.  This includes violating the "empty hands" policy for discussing/working on the lab, uploading material to online share sources (e.g. Chegg. Com and others), and using unauthorized sources to inform my work. I understand that if I am aware of cheating on this assignment, I have an obligation to inform the Professor. I also understand that the Professor will take action consistent with the ISU Academic Misconduct Policy if s/he detects acts of academic dishonesty as well as with expectations stated in the course syllabus.

- [x] By checking this box, I agree to the above statement.


| Assignment Dates | |
| --- | --- |
|**Assigned on**: | Sept 19th 2022 |
|**Due on**: | Oct. 3rd @ 23:59 |
|**Accepted on**: | |


## Grading Rubric

|Deliverable | Maximum Points |
|---|---|
| Exercise 1 | 5 |
| Exercise 2 | 10 |
| Exercise 3 | 10 |
| Exercise 4 | 15 |
| Exercise 5 | 15 |
| Report | 50 |
| Total Score | 105 |


# Git Reminder

**Always create a branch as a first step!** Creating a branch is one of the most essential best practices for working in a repository.  It lets you easily collaborate with larger groups, organize your work, and work in isolation.

**devel-netid**: It is standard practice to do active development on a branch called "devel-netid" (where netid is YOUR netid), as follows:

You can do this using a GUI client or in the Visual Studio Code terminal or on a Linux machine. If using the git CLI, then it is:

    git branch devel-netid
    git checkout devel-netid
    git push origin devel-netid

This creates a new branch from your current working branch, switches to that branch, and then pushes the new branch to the remote repository (GitHub).

To save your changes, always make sure you are on your development branch. If you are using the CLI then:

    git checkout develop

    <work on your assignment>

    git add <new or changed files> OR git add -A to add all changed files
    git commit -m "A descriptive note of what you changed"
    git push origin devel-netid

When you are done, open a PR requesting your develop branch be merged to master.
The time and date of your pull request from develop into master will determine your submission time. See the lab manual for details.

# About this Lab
For this lab we will jump into programming with C. You can use Visual Studio Code, or now that you have used the HPC, you can use that or the Engineering Linux Servers. You have five exercises to complete. We have created a test script to test each one. You can also run a test on all seven if you feel you are done and want to run all of them. These are all controlled using a Makefile. We haven't talked about Makefiles yet, but we will. For now, read through the following on how to use it.

## Compiling your programs
**Note** The following is a generic guide. Each mission may ask you to use different names than just ```ex1```. The information is here for your reference.

If all you want to do is compile your program, then you have some options. First, you can always directly run gcc to compile your program. This is done by typing in gcc, followed by the source code, then ```-o``` and the name of the executable file. Recall that if you do not specify a name, gcc will name it ```a.out```. Here is an example:

**Note** We want you to use ```.out``` for all of your executable programs

```
gcc ex1.c -o ex1.out
```
If you wish to compile a different file, then just substitute the file name and output name. For now, this simple use of GCC will serve our needs. Later however, we will explore more advanced options used with GCC.

Right now, typing that in is not a big deal. But, as we will learn, this tends to get longer and you may need to compile several programs. This is where Makefiles can be used. We will discuss Makefiles later, but for now, we have created a Makefile for you. This Makefile is also used by the autograder. You can also use this as well to compile your program. For example, to compile ex1, we would type in the following:
```
make ex1
```
This will compile the ```ex1.c``` source code and generate an executable called ```ex1.out```. For ex2, 3 and 4, just replace the 1 with the exercise you are working with. We can also use this Makefile to call our test scripts as well. To do a test on ex1, do the following:

```
make test_ex1
```
This will actually do two things. First, it will compile ex1 and generate our executable. Second, it will then run our test script using that executable. To keep things clean, our test script also removes the executable once it is done.

# Wrapping up
When you have completed every task with a check-box below, make sure all your work is committed to git and pushed to GitHub. Don't forget to do a pull request and do not close or merge your pull request. Finally, make sure that both the Autograder and the command that compiles your LaTeX document passed. If not, double check your work.
**Note** Remember, you can test your work! Use the Makefile to run tests on your code. You can even use the Makefile to compile your code. If your code passes here, it should pass on GitHub.

## Task List:
- [x] Read the mission write-up
- [x] Clone this repo 
- [x] Complete all 5 exercises
- [x] Push your changes to the devel-netid branch
- [x] Complete your mission writeup
- [x] Open a new Pull Request (and leave it open for the grader to find)
- [x] Check that both the AutoGrader and the LaTeX builder completed with no errors (unless you like losing points)
