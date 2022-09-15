# Instructions for Using your Assignments Repository

**DISCAIMER:  I am still new to using GitHub Classroom as a teaching tool, so I am learning along with you.  It is very hard to predict how these tools will work until we try stuff, so we might have to fine tune things as we progress.  For now, I think I have a plan, and it worked the last time I delivered CS2613**

* NOTE:  The main purpose of this repository template is to provide you with something to clone (so you don't have to initialize your local repository to push to the right location).  There isn't much else here...but this should be enough to clone.

* NOTE:  Wehenver you see <> in these notes, replace them with what's described inside them (eg.  the name of a programming language, a number (X), etc).

**A Word of Caution:  git and github take some time to get used to.  Use your assignments as a way to figure out how to do all the basics.  Don't get frustrated when things mess up...that is bound to happen when you are just starting to figure things out.  And if we need to, we can resort to submitting your assigments in D2L, so you never need to panic if you can't figure something out.  This is more about learning git then it is about using the repo as an assignment bin.  BUT - this is a good opportunity to explore, so please take advantage.**


## Getting Starged
I recomend you get starte with git using the terminal (Powershell or commandline in Windows, Bash in Linux etc).  You have to install git to use it: 
* Here is a useful link where you can learn about [installing and using git](https://git-scm.com/book/en/v2).
* This is another useful link for [installing git for window users](https://gitforwindows.org/).
* There are more instructions for installing and using git on our D2L site (at least there will be soon)

The first thing you want to do is clone this repository.  Then you can start adding your content locally.  To clone the repository, in the terminal, navigate to the folder you want to work in for your assignments (I call my folder Code).  Once inside that folder use the command `git clone <repository name>`  (GitHub provides an easy way for you to copy your repo name using the `Code` button at the top of your repository.  Your command should look something like:  `git clone https://github.com/myUNB-CSCourses/Assignments-yourUserName.git`).

Once you clone the repository, you will then see a subfolder called Assignments-yourUserName.  You can do whatever you want in that, and then use git in a terminal to _add_ what you do to what is being tracked, _commit_ what you do to the local repository, and then _push_ what you do back up to the remote repository.  I suggest you use a terminal to do this, but feel free to use another tool if you prefer.  See instructions and short video on our D2L site (when they become available) for learning how to use git.

## Organizing Your Content
Follow these two basic steps to organize your content:

1.  Create a folder called `<name of Programming Language>` for each assignment, and push your work to those folders as approriate.
    * Note that git won't let you commit or push an empty folder, so you can't create your folders until you have some content to put into them
    * Beyond these top level folders, you can add folders and files to your repository in any way you see fit (unless otherwise specified in an assignment's instructions),   but keep things organized
    * If there are instructions in an assignment about how to organize something, follow them - this will help your TA and I mark.
    * Feel free to include more than what is required for the assignment in each folder, but keep things organized.
    
2.  Create your Journal Wiki based on the template described in the instructions and start making journal entries.
    * Don't forget to add a comment when you submit (at least) the first wiki entry every week -  "Journal Entry Week <X>" 

## Extra Resources
Finally, here are some useful git resources to help you get started with git (most go well beyond what you need for this course):
* [Atlassian Git Resources](https://www.atlassian.com/git)
* [GIT FAQ](https://www.git-tower.com/learn/git/faq/) by Tower (I think this one is the easier to understand)
* [Pro GIt Book](https://git-scm.com/book/en/v2)
* Quick Resource - [10 Useful Git Commands](https://www.datree.io/resources/git-commands)
