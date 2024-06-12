@echo off

REM Prompt the user to enter the repository URL
set /p repo_url="Enter the URL of the GitHub repository: "

REM Check if the .git directory exists to determine if the repository is already initialized
if exist .git (
    echo Repository already initialized.
) else (
    REM Initialize a new local Git repository if not already initialized
    git init
)

REM Check if the remote repository is already added
git remote -v | findstr /C:"origin %repo_url%"
if %errorlevel% equ 0 (
    echo Remote repository already added.
) else (
    REM Add the remote repository if not already added
    git remote add origin %repo_url%
)

REM Perform Git operations (e.g., add, commit, push)
echo Adding files...
git add .
git commit -m "Initial commit"

REM Check if there are changes to push
git status | findstr /C:"nothing to commit"
if %errorlevel% equ 0 (
    echo No changes to commit.
    goto end
)

REM Push changes to the master branch of the remote repository
git push -u origin master

REM Display a success message
echo Git operations completed successfully.

:end
REM Keep the command prompt window open after execution (optional)
pause
