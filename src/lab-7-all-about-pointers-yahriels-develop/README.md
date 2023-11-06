# Lab Assignment 7
# All About Pointers

## Statement of Academic Integrity

In compliance with the ISU Academic Misconduct Policy expectations, I will not give or receive unauthorized aid in the completion of this lab.  This includes violating the "empty hands" policy for discussing/working on the lab, uploading material to online share sources (e.g. Chegg. Com and others), and using unauthorized sources to inform my work. I understand that if I am aware of cheating on this assignment, I have an obligation to inform the Professor. I also understand that the Professor will take action consistent with the ISU Academic Misconduct Policy if s/he detects acts of academic dishonesty as well as with expectations stated in the course syllabus.

- [x] By checking this box, I agree to the above statement.

| Assignment Dates | |
| --- | --- |
|**Assigned on**: | Mar. 1st, 2022 |
|**Due on**: | Mar. 8th, 2022 @ 11:00 |
|**Accepted on**: | Mar. 09, 2022 @ 11:48:16 PM |


## Grading Rubric

|Deliverable | Points Awarded | Maximum Points |
|---|---|---|
| Midpoint | 35 | 40 |
| Simpson's 1/3 | 35 | 40 |
| Simpson's 3/8 | 35 | 40 |
| Gauss Quad | 35 | 40 |
| Total Score | 140 | 160 |
## Introduction

**Always create a branch as a first step!** Creating a branch is one of the most essential best practices for working in a repository. It lets you easily collaborate with larger groups, organize your work, and work in isolation.

**develop**: It is standard practice to do active development on a branch called "develop", as follows:

    git branch develop
    git checkout develop
    git push origin develop

This creates a new branch from your current working branch, switches to that branch, and then pushes the new branch to the remote repository (GitHub).

To save your changes, always make sure you are on your development branch:

    git checkout develop

    <work on your assignment>

    git add <new or changed files>
    git commit -m "A descriptive note of what you changed"
    git push origin develop

When you are done, open a PR requesting your develop branch be merged to master.
The time and date of your pull request from develop into master will determine your submission time. See the lab manual for details.


## Task List:
- [x] Read lab manual, chapter 7
- [x] Write 4 numerical integration implementations
- [x] Document complexity in your report
- [x] Push your code to the develop branch and open a pull request

When you have completed every task, make sure all your work is committed to git and pushed to GitHub.
