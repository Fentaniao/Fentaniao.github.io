@echo This is a program to depoly hexo to your Github Page
@echo Process: Begin deploying...
call hexo cl 
call hexo g
call hexo d
@echo Process: Please check deployment.
pause