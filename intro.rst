iOS App Development using Titanium with CoffeeScript & Backbone
================================================================

~~~~

寫在廢話之前
------------

請大家先...

    $ git clone https://github.com/pct/TiApp
    $ cd TiApp && bundle

今天的簡報檔在:

    https://raw.github.com/pct/TiApp/master/intro.rst

(然後邊等下載邊聽一串無聊的介紹 Orz...)

~~~~

pct 簡介
--------

本名：林錦賜 / Daniel Lin
網路化名：pct
Github: pct
噗浪帳號：pct
臉書帳號：freebsd.py
Google+ 帳號：太長了背不起來
Email: linpct@gmail.com

~~~~

pct 效力的公司
--------------

四點設計有限公司

地址：忠孝東路二段 100 號 5 樓之 4

(捷運 忠孝新生 捷運站 2 號出口往 MOS、
 國泰世華的方向走，在 7-11 隔壁樓上)

公司 Email: pct@4point-inc.com
公司網址：http://4point-inc.com

~~~~

這種場合打什麼廣告？
--------------------

不好意思，剛剛那些都是我老闆要求我放上去的！不關我的事！

~~~~

切入正題
--------

撰寫 Titanium app, 一般都用 Titanium Studio 開發，
但我秉持一直繞遠路的爛個性，所以我用了：

* vim
* python
* ruby
* coffeescript
* node.js
* shell script

~~~~


切入正題(有嗎？)
----------------

還自己買零件回來組了黑麥！(Hackintosh)

~~~~

切入正題(感謝大家還沒起身回家玩 D3)
------------------------------------

而且黑麥還不能玩 D3

(我是 pct#3422 美服)

~~~~

== 我是廢話分隔線，前面應該有拖了 10 分鐘(吧？) ==

~~~~

今天 demo 不打開 Xcode 與 Titanium Studio
------------------------------------------

* 我用 vim 寫 code
* 而且今天這個 demo 不會打開 Titanium Studio
* 而且，今天這個 demo 也不會打開 Xcode
* 今天這個 demo 只會用到 terminal, vim, Simulator

~~~~

但是你還是要裝 Xcode 跟 Titanium Studio
----------------------------------------

雖然 demo 用不到，但你還是要裝；就為了一些方便的功能：

1. 使用 Xcode 來 Submit & 發佈，還有換一些圖、改一些東西
   (簡而言之就是我沒研究 Xcode, 對不起~~)

2. 使用 Titanium Studio 來檢查下載 Titanium SDK
   (對，這是我唯一會的 Titanium Studio 功能)

~~~~

TiApp 簡介
----------

下載 TiApp 回來後，請先執行：

    $ ./init.py

這是為了換掉 tiapp.xml 以及 manifest 兩個檔案中的 GUID
換好後會像這串文字：d0e681e6-8a99-471f-847e-ef94f5c583b8

~~~~

執行 TiApp
----------

先檢查 config/config.rb 裡面的 Titanium SDK 版本
跟你系統裝的版本有無 match；如果有，就可以直接：

    $ rake

然後應該就會出現 Simulator
(如果有任何 error, 我們待會來一一解決)

~~~~

範例 App 簡介
-------------

* 總共兩個視窗，用到的 UI 項目：

  - Window
  - iphone 的 NavigationGroup
  - Label
  - Button
  - Alert

~~~~

直接看程式碼都是 CoffeeScript
-----------------------------

TiApp/app
  ├── app.coffee #只放需要 include 的 js 檔案
  └── ti_app
    ├── app.coffee # 初始
    ├── device_fix.coffee # 讓 titanium 知道你有用到哪些 titanium 工具
    ├── run.coffee # 程式執行
    └── window
        ├── main.coffee # main 視窗
        └── second.coffee # second 視窗

~~~~

修改 coffee 檔後怎麼辦？
------------------------

就是直接到 Tiapp 目錄，執行：

    $ rake

~~~~

所以？
-----

修改 && rake
修改 && rake
修改 && rake

...

~~~~

Backbone 用在哪？
-----------------

lib
└── template.coffee

主要是作為整體 window 的 Template：

    Backbone.setDomLibrary TiQuery

    class Template extends Backbone.View

不過我還沒充分發揮，可以參照鐵神幫我寫的

    Resources/vendor/template.jace.coffee

~~~~

那 TiQuery 又是什麼？
---------------------

https://github.com/wGEric/TiQuery

$.info, $.error, $.include,  取代 Titanium 落落長的 API

而且還可以用 $.Window 取代 Titanium.UI.createWindow 這樣的寫法
以及其他 Ti.UI.createOOXX 都可以這樣簡寫
還可以自行擴充

~~~~

那 TiQuery 還可以作什麼？
-------------------------

還有 
    $(window).click (e) ->

以及 $.registerEvent 'myEvent' 之後就可以
    $(window).myEvent (e) ->

~~~~

TiQuery 還有呢？
----------------

$.get url, (data) ->
$.post url, (data) ->
$.getJSON url, (data) ->
$.getXML url, (data) ->

~~~~
剛剛那些怎麼沒有 error handle？
-------------------------------

請自己研究

$.http
    url
    timeout
    onLoad: (data, http, event) ->
    onError: (http, event) ->

~~~~

細部講解 main.coffee
--------------------

這個 window 的 class 是用 Backbone 的 Template：

    class Tiapp.Window.Main extends Template

提供了 constructor, initialize, render, 以及其他可以自行擴充

Tiapp/app
  └── ti_app
    ├── lib
        └── template.coffee

~~~~

組 window 步驟
--------------

1. 先在 initialize 把要使用的 UI 元件先建好
2. 再去 bind 把 UI 元件的 Event 寫好，特別注意 
     @main_window.addEventListener 'close', (e) =>
        @destroy() 

3. 其他程式就可以進行 render
    例如：new Tiapp.Window.Second().render()
4. destroy？把 initialize 用到的元件一一設成 null 就好了

~~~~

如何使用 iPhone NavigationGroup？
---------------------------------

建一個 main window(外) 以及 content window(內)

    @nav_group = Ti.UI.iPhone.createNavigationGroup
        window: @content_window

    @main_window.add @nav_group

    @nav_group.open @second_window


~~~~

就這樣？
--------

因為我用了 2007 年的神人二手 Mac mini
以及 2008 年的，現在正在 demo 的 Macbook (不是 Pro)

所以一定要開發一些 tool 來加快速度，要不會想撞牆

~~~~

Sync 工具目標？
---------------

我在 vim 寫完按下 :w 後，轉身回來看到 Simulator 已經有新的程式

~~~~

實作
----

沒有頭緒 (doh)

~~~~

曙光
----

國內通過 Titanium Developer 認證的 美女開發者 Erin
有建了一個 ti.meow 的範例，可以讓你打開瀏覽器寫 code, 
按個 submit 就可以傳到你的手機/Simulator

http://erinylin.blogspot.com/2012/04/titanium-mobile-timeow.html

~~~~

可是我是用 vim 寫 code
----------------------

所以該怎麼實作？

用 Node.js 的 socket.io, 建 server 跟 client,
在 App 裡面 啟用 long polling 機制定時跟 server 要資料
然後只要把改過的資料由 client 送給 server, 這樣 App 就會更新了

PS: 因為 Titanium 是更新 js, 所以不用重 build Objective-C
    long polling 程式碼是從 ti.meow 取用並改寫

~~~~

Node.js
-------

server：
    $ cd sync
    $ ./install_node_modules.sh
    $ coffee server.coffee

App：TiApp/app/ti_app/run.coffee 把 Tiapp.AppSync.sync() 打開

改完送資料：

    $ cd TiApp
    $ ./run.rb

~~~~

就這樣？
--------

其實還有一個工具，就是你不打開 Xcode 不打開 iTunes 不打開 Titanium 
怎麼把程式傳到你的手機測試？

~~~~

請裝 fruitstrap
----------------

然後就：

    $ ./send.sh

就可以到手機查看了


~~~~


尾聲
-----

你騙人，你今天不是寫了個範例 App？

請：

    $ cd TiApp
    $ mv app app.old
    $ mv sample_app app
    $ rake

~~~~

謝謝大家
--------

pct @ WebDev Party #4

(pct#3422 美服)

FAQ，有問必答，前提是我有能力可以回答的話。

謝謝大家，年底某場聚會再見 :D
