sphinx与seed文档环境配置详细说明(Windows)
=========================================

安装git:
--------

  1. 安装msysgit

    [http://code.google.com/p/msysgit/downloads/list](http://code.google.com/p/msysgit/downloads/list)

    推荐Git-1.8.0-preview20121022.exe

  2. 安装TortoiseGit

    [http://code.google.com/p/tortoisegit/wiki/Download?tm=2](http://code.google.com/p/tortoisegit/wiki/Download?tm=2)

    根据操作系统选择32位或64位

安装sphinx-docs:
----------------

  1. 安装python（如果已安装可以跳过）

    [http://www.python.org/getit/](http://www.python.org/getit/)

    选择Python 2.7.3 Windows Installer

    注意根据操作系统选择32位或64位

    注意：不要选择Python 3.x 版本

  2. 安装easy-install

    32bit操作系统：

      [http://pypi.python.org/pypi/setuptools](http://pypi.python.org/pypi/setuptools)

        找到setuptools-0.6c11.win32-py2.7.exe 并安装

    64bit操作系统：

      下载此文件并执行：

        [http://peak.telecommunity.com/dist/ez_setup.py](http://peak.telecommunity.com/dist/ez_setup.py)

  3. 设置环境目录

    假设Python安装在C:\Python27，则添加以下路径：

      C:\Python27\;C:\Python27\Scripts

    安装在其他目录的话请自行替换相关路径。

    WinXP:

      右键点击我的电脑，选属性-高级-环境变量，在用户变量或者系统变量的"PATH"项下增加相关路径

    Win7/Win8

      右键点击计算机，选属性-高级系统设置-高级-环境变量，在用户变量或者系统变量的"PATH"项下增加相关路径

  4. 安装sphinx-docs

    开始菜单-运行，输入cmd回车，打开命令行

    输入easy_install Sphinx并回车，会进行sphinx-docs的安装。

    安装可能需要花费几分钟，如果网络不好，这个过程可能会反复失败，多尝试几次即可。

    输入sphinx-build判断sphinx是否安装成功

注册github并下载文档工程
------------------------

  * 在以下地址注册并登陆：

    [http://www.github.com](http://www.github.com)

  * 在本地硬盘上新建一个目录，使用git clone以下地址：

    https://github.com/tdzl2003/seeddocuments.git

  * 可以编辑修改并在本地commit。

  * Seed团队成员找dengyun申请加入项目即可进行push

  * 非Seed团队成员欢迎fork本项目进行修改并发起Pull Request

本地输出html并检查
------------------

  * 运行makehtml.bat即可产生html版本

  * 在build\html目录下可以找到完整的输出结果，其中index.html为首页。