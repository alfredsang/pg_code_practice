pg_code_practice
================

phonegap 代码实践


# 项目地址：
https://github.com/shiren1118/pg_code_practice.git

这个项目主要是想把phonegap的最新代码写一些例子和探索。最简单的方式就是依赖incubator-cordova-ios.git。而
测试最好的方法莫过于单元测试。本文会做详细阐述，以期让大家了解cordova测试过程。

## 子模块

[master][~/work/git/pg_code_practice] mate setup.sh

下面是setup.sh内容：

	git submodule add https://github.com/apache/incubator-cordova-ios.git lib/cordova
	git submodule add https://github.com/gabriel/gh-unit.git lib/ghunit

	git submodule init
	git submodule update
<!-- git submodule rm lib/billboard /git rm --cached lib/billboard -->

备注：setup.sh应该在第一次时候执行一次啊。执行前 请检查
[master][~/work/git/pg_code_practice] chmod u+x setup.sh 

	[master][~/work/git/pg_code_practice] ./setup.sh 
	Cloning into lib/cordova...
	remote: Counting objects: 14581, done.
	remote: Compressing objects: 100% (4258/4258), done.
	remote: Total 14581 (delta 9582), reused 14353 (delta 9365)
	Receiving objects: 100% (14581/14581), 16.29 MiB | 83 KiB/s, done.
	Resolving deltas: 100% (9582/9582), done.
	Cloning into lib/ghunit...
	remote: Counting objects: 7037, done.
	remote: Compressing objects: 100% (2437/2437), done.
	remote: Total 7037 (delta 4694), reused 6667 (delta 4358)
	Receiving objects: 100% (7037/7037), 39.60 MiB | 159 KiB/s, done.
	Resolving deltas: 100% (4694/4694), done.
	Submodule 'lib/cordova' (https://github.com/apache/incubator-cordova-ios.git) registered for path 'lib/cordova'
	Submodule 'lib/ghunit' (https://github.com/gabriel/gh-unit.git) registered for path 'lib/ghunit'
	[master][~/work/git/pg_code_practice] ls
	README.md lib       setup.sh
	[master][~/work/git/pg_code_practice] 


当然我不想每次都去提交依赖lib的源码，如果需要就从github上clone一份即可，执行上面的setup.sh即可

git提交忽略某些不想提交的功能，

	[master][~/work/git/pg_code_practice] ls -alt
	total 24
	-rw-r--r--@  1 minglq  staff  1031  7  3 01:09 README.md
	drwxr-xr-x  13 minglq  staff   442  7  3 01:08 .git
	drwxr-xr-x   7 minglq  staff   238  7  3 01:08 .
	-rw-r--r--   1 minglq  staff   195  7  3 01:08 .gitmodules
	drwxr-xr-x   4 minglq  staff   136  7  3 01:04 lib
	-rwxr--r--@  1 minglq  staff   207  7  3 01:00 setup.sh
	drwxr-xr-x  20 minglq  staff   680  7  3 00:54 ..
	[master][~/work/git/pg_code_practice] touch .gitignore
	[master][~/work/git/pg_code_practice] mate .gitignore
	[master][~/work/git/pg_code_practice] mate .gitignore
	[master][~/work/git/pg_code_practice] git status
	# On branch master
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	new file:   .gitmodules
	#	new file:   lib/cordova
	#	new file:   lib/ghunit
	#
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   README.md
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	setup.sh
	[master][~/work/git/pg_code_practice] git reset HEAD
	Unstaged changes after reset:
	M	README.md
	[master][~/work/git/pg_code_practice] git status
	# On branch master
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   README.md
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	.gitmodules
	#	setup.sh
	no changes added to commit (use "git add" and/or "git commit -a")
	[master][~/work/git/pg_code_practice] git add .
	[master][~/work/git/pg_code_practice] git status
	# On branch master
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	new file:   .gitmodules
	#	modified:   README.md
	#	new file:   setup.sh
	#
	[master][~/work/git/pg_code_practice] git add *
	[master][~/work/git/pg_code_practice] git status
	# On branch master
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	new file:   .gitmodules
	#	modified:   README.md
	#	new file:   setup.sh
	#




## ref

- Git Submodules: Adding, Using, Removing, Updating
http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating/


