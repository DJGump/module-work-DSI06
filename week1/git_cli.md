# `git` CLI

<p align='center'>
  <img src='https://upload.wikimedia.org/wikipedia/commons/3/39/Arroz-con-Pollo.jpg' width=40%>
</p>

## Steps by action

* [Getting repos on your local machine](#getting-repos-on-your-local-machine)
* [You made changes locally that you want to 'upload' to one of your own repos](#you-made-changes-locally-that-you-want-to-upload-to-one-of-your-own-repos)
* [You made changes remotely that you want to 'download' to one of your own repos](#you-made-changes-remotely-that-you-want-to-download-to-one-of-your-own-repos)
* [You want to create a repo](#you-want-to-create-a-repo)
* [You want to change branches locally](#you-want-to-change-branches-locally)
* [You want to add changes through a pull request](#you-want-to-add-changes-through-a-pull-request)

All of these are written assuming your your command line's working directory is correct.  Use `cd` and `pwd` to ensure you're in the right place. 

### Getting repos on your local machine

#### You want to 'download' one of your own repos for the first time

* Go to the GitHub repo, click the green button that says 'Code' & copy the text that pops up by clicking the clipboard icon
* Go to command line and use:
  `git clone <paste your text here>`

#### You want to 'download' someone else's repo

* Option 1 - this will grab a version of their repo frozen in time; do this if you don't need to get every update from their repo
  * Go to their GitHub repo and click 'fork' in the top right hand corner
  * You now have a copy of their repo as your own and you can [`clone` it as if it's yours](#you-want-to-download-one-of-your-own-repos-for-the-first-time)
* Option 2 - this will grab their repo and all future changes, but won't let you add changes of your own (for most intents and purposes)
  * [`clone` it as if it's yours](#you-want-to-download-one-of-your-own-repos-for-the-first-time)

### You made changes locally that you want to 'upload' to one of your own repos

Bad mnemonic of how to get changes up there: ACP = Arroz Con Pollo = `add` `commit` `push`

* Run `git status` to see what has been added/deleted/changed
  * This is the same as what appears in the sidebar of github desktop
* From the output of `git status`, identify what changes you want to 'push' to GitHub
* Use `git add <filename>` to select which items you want to push
  * i.e to select `analysis.ipynb` your command would be `git add analysis.ipynb`
  * If you want to add everything you can use `git add .`
* To group what you've `add`-ed together with a nice tag-line use `git commit -m '<description>'`  **Don't forget the -m '<desc>'**
  * Make sure to add a useful description, think of this as an email subject describing the changes you made.
* To actually 'upload' to GitHub, use `git push`
* Verify on GitHub that your changes were pushed successfully

### You made changes remotely that you want to 'download' to one of your own repos

* `git pull`

### You want to create a repo

Many tutorials will tell you to use `git init`; I personally, never use this command.

* Go to GitHub and click the plus sign in the top right corner and select "New repository"
* Make up a name for the repo, try and make it descriptive or branded
* Decide whether the repo will be public/private
* Select the option to create a README
* If working with Python, select Python in the 'add .gitignore' dropdown
* Click create repository
* [`clone` the repo](#you-want-to-download-one-of-your-own-repos-for-the-first-time)

### You want to change branches locally

* `git checkout <branch-name>`

### You want to add changes through a pull request

This is how you can contribute to someone else's repo.

* Option 1: you want to contribute to someone else's repo
  * Fork and clone their repo (see [here](#you-want-to-download-someone-elses-repo))
  * Make changes and commit them to your repo (see [here](#you-made-changes-locally-that-you-want-to-upload-to-one-of-your-own-repos))
  * Open the repos page in GitHub and click the 'Pull requests' button
  * Click the green button labeled 'New pull request'
  * Select the appropriate branches in the drop down menus and click 'Create pull request'
  * Wait for your pull request to be accepted, rejected, or changes requested.
* Option 2: you want to use a PR in your own repo
  * Navigate to your repo on github
  * Click the dropdown that says master on the left hand side
  * Type in a name for the new branch and hit enter key
  * Locally, perform a `git pull`
  * Change branches to your new branch (see [here](#you-want-to-change-branches-locally))
  * Make changes and commit them to your repo (see [here](#you-made-changes-locally-that-you-want-to-upload-to-one-of-your-own-repos))
  * Open the repos page in GitHub and click the 'Pull requests' button
  * Click the green button labeled 'New pull request'
  * Select the appropriate branches in the drop down menus and click 'Create pull request'
  * Review the code in the pull request
  * If you're happy with the changes, click merge
  * Click delete branch 
  * Make sure to change branches back to `master` locally (see [here](#you-want-to-change-branches-locally))

