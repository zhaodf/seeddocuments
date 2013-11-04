make html
== 概述 ==

:这里列举了Seed引擎提供的，位于[[说明:全局空间|全局空间(_G)]]下的变量及函数定义定义。

:''本文档暂时只列出了与lua 5.2标准库存在差异的内容。''

== 变量 ==

=== _SEED_VER, _SEED_VER_FULL, _SEED_VER_FULL_WITH_BUILD ===

;:说明

::用文本方式提供Seed引擎的版本号

;:类型

::string

;:值

::{| class="wikitable"
|-
! 名称 !!width="60%"| 格式 !! 值 
|-
| '''_SEED_VER''' || 主版本号.次版本号 || "0.2"
|-
| '''_SEED_VER_FULL''' || 主版本号.次版本号.补丁版本号 || "0.2.0"
|-
| '''_SEED_VER_FULL_WITH_BUILD''' || 主版本号.次版本号.补丁版本号 build: build版本号 || "0.2.4 build: 123"
|}

=== _SEED_VER_MAJOR, _SEED_VER_MINOR, _SEED_VER_PATCH ===

;:说明

::用数字方式提供Seed引擎的版本号

;:类型

::number

;:值

::{| class="wikitable"
|-
!width="100px"| 名称 !!width="100%"| 值 
|-
| '''_SEED_VER_MAJOR''' || 0
|-
| '''_SEED_VER_MINOR''' || 2
|-
| '''_SEED_VER_PATCH''' || 0
|}

=== _OS_NAME ===

;:说明

::当前运行的设备名称

;:类型

::字符串

::{| class = "wikitable"
|-
!width="100px"| 操作系统 !!width="100%"| 值
|-
| iOS || iOS
|-
| Windows || win32

|-
| Flash || Flash
|-
| Android || Android
|}

== 函数 ==

=== print(...) ===

;:说明

::将所有参数打印到日志。

;:平台支持

::{| class="wikitable"
|-
!width="100px"| 平台 !!width="100%"| 说明
|-
| win32 || 该函数不但会向控制台（如果启用）输出信息，也会输出调试信息（使用IDE启动通常可以在调试窗口看到print的输出信息）
|-
| iOS || 该函数会向标准输出输出信息，使用XCode启动时，可以在Active Console查看输出
|-
| Android || 该函数会向logcat日志输出信息
|}

<!--TODO: 提供一个关闭所有日志输出的范例方法-->

=== dofile (uri, ...) ===

;:说明：

::打开uri所标识的资源或数据文件，并且将其内容当做lua代码执行。

;:参数：

::{| class="wikitable"
|-
! 名称 !! 说明
|-
| '''uri''' || 所要打开的lua文件的[[说明:URI|URI]]。
|-
| '''...''' || 所有额外的参数都会传递给该lua文件。该文件中的代码可以用"..." 符号来获取这些参数。
|}

;:返回值：

::会返回打开的lua文件自身的所有返回值。

;:与lua标准库的差异：

::* 受限于Seed引擎的资源结构，第一个参数不再是filepath，而必须是一个[[说明:URI|URI]]字符串。直接提供一个文件路径会产生一个lua错误。
::* 可以使用额外参数。

;:注意事项：

::请不要用此函数打开一个[[说明:远程资源|远程资源]]，会导致游戏失去响应。

=== loadfile (uri) ===

;:说明：

::打开uri所标识的资源或数据文件，当做一个函数返回。

;:参数：

::{| class="wikitable"
|-
! 名称 !! 说明
|-
| '''uri''' || 所要打开的lua文件的[[说明:URI|URI]]。
|}

;:返回值：

::会返回打开的lua文件自身的所有返回值。

;:与lua标准库的差异：

::* 受限于Seed引擎的资源结构，第一个参数不再是filepath，而必须是一个[[说明:URI|URI]]字符串。直接提供一个文件路径会产生一个lua错误。

;:注意事项：

::请不要用此函数打开一个[[说明:远程资源|远程资源]]，会导致游戏失去响应。

=== loadscript(scriptname) ===

;:说明

::该函数功能与loadfile类似。不同的是，该函数使用与require函数相同的查找规则，可以从package.preload、package.path所指向的资源路径查找资源。

;:参数

::{| class="wikitable"
|-
!width="100px"| 名称 !!width="100%"| 说明
|-
| '''scriptname''' || 模块名。会作为package.preload的键值及package.path中?所替代内容。模块名可以包含"."，在资源支持[[说明:资源目录结构|目录结构]]的平台下，"."会被翻译成"/"或者"\"
|}

;:返回值

::将打开的lua脚本作为函数返回。

;:附注

::此函数并不会读取package.loaded中已加载的模块（已加载的模块通常是目标脚本的返回值而不是脚本本身），也不会执行脚本或加载模块。

;:与lua标准库的差异：

::* 此函数lua标准库中不包含，仅可在Seed引擎中使用。
<!--TODO: 建立超级链接-->
<!--TODO: 描述可能的异常原因-->

=== doscript(scriptname''[,...]'') ===

;:说明

::打开并执行一个lua文件，和loadscript类似，该函数使用与require函数相同的查找规则，可以从package.preload、package.path所指向的资源路径查找资源。

;:参数

::{| class="wikitable"
|-
! 名称 !! 说明
|-
| '''scriptname''' || 模块名。会作为package.preload的键值及package.path中?所替代内容。模块名可以包含"."，在资源支持[[说明:资源目录结构|目录结构]]的平台下，"."会被翻译成"/"或者"\"
|-
| '''...''' || 所有额外的参数都会传递给该lua文件。该文件中的代码可以用"..." 符号来获取这些参数
|}

;:返回值

::会返回打开的lua文件自身的所有返回值。

;:与lua标准库的差异：

::* 此函数lua标准库中不包含，仅可在Seed引擎中使用。

=== module(name''[,...]'') ===

;:说明

::用在一个lua脚本文件的最开头，注册名为name的模块，并使用该模块作为调用者的环境空间。随后写的没有local标记的函数、变量均会成为该模块的内容而非全局内容。

;:参数：

::{| class="wikitable"
|-
! 名称 !! 说明
|-
| '''name''' || 注册的模块名
|-
| '''...''' || 所有额外的参数会当做函数在module返回之前被调用，常见的有[[API参考:package#package.seeall.28module.29|package.seeall]]等
|}

;:附注

::成功调用module之后，直接用 变量名 = 值 或者 function 函数名 声明函数会直接成为模块的成员。使用local声明的变量或函数则不会。

::配合[[API参考:package#package.seeall.28module.29|package.seeall]]使用，可以直接读取全局的变量或函数，如果要设置全局的变量或函数，可以用全局表"_G", 如： _G.foo = "bar"

::此函数本质上会修改当前函数的_ENV，如果配合[[API参考:package#package.seeall.28module.29|package.seeall]]使用，_ENV的metatable的__index会被设置成全局表_G。

::也可以在函数中或者其它语句块中使用。此时只有函数内的代码的环境被影响。

;:样例

::a.lua

::<syntaxhighlight lang="lua" line>
module(..., package.seeall)
a = 1
local b = 2
function func1(...)
    print(...)
end
_G.c = 3
</syntaxhighlight>

::b.lua

::<syntaxhighlight lang="lua" line>
local a = require("a")  -- 这种写法比require("a")性能略高
print(a.a)				-- 1
print(a.b)				-- nil
a.func1(1, 2, 3)		-- 1, 2, 3
print(rawget(a, "c"))				-- nil
print(c)				-- 3
</syntaxhighlight>

;:与lua标准库的差异：

::* lua标准库在5.2版本中移除了此函数。为了便于代码兼容，Seed引擎重新实现了此函数及[[API参考:package#package.seeall.28module.29|package.seeall]]函数。

;:BUG

::目前module尚不能正常使用组合名（即包含"."的名字，如"a.b.c"）。
