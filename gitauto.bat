@echo off

REM Prompt the user to enter the repository URL
set /p repo_url="Enter the URL of the GitHub repository: "

REM Initialize a new local Git repository
git init

REM Add the remote repository
git remote add origin %repo_url%

REM Perform Git operations (e.g., add, commit, push)
echo Adding files...
git add .
git commit -m "Initial commit"
git push -u origin main

REM Display a success message
echo Git operations completed successfully.

REM Keep the command prompt window open after execution (optional)
pause
