@echo This is a program to initial environment.
@echo Run this script ONLY when you start blog in a new computer.
pause

# check git and node.js
@echo Check git and node.js
node -v 
git --version

# install hexo
@echo check git and node.js
npm install -g hexo-cli

# add SSH Key
@echo Add SSH Key
git config --global user.name "Fentaniao"
git config --global user.email "fentaniao@gmail.com"
ssh-keygen -t rsa

@echo Wait for copying SSH Key
pause