日常在圖形化界面下操作，記住的快捷鍵並不能很好的與終端（shell、命令行，怎麼叫都行）配合使用，需要額外記憶。

在終端下，你常常只有一行可以輸入命令的空間，所以要記住的快捷鍵主要是用來處理光標在輸入命令的位置和調整內容的。


| 快捷鍵 | 單詞速記 | 用途 |
|-------|-------|-------|
| Ctrl+Shift+C |  | 複製,進入複製模式，按 空格 開始選擇，選擇完畢後再按一次 Ctrl+Shift+C 退出 |
| Ctrl+Shift+V |  | 粘貼 |
| Ctrl + A、Home | A 是首字母 | 光標跳到行首 |
| Ctrl + E、End | End | 光標跳到行尾 |
| Ctrl + B、← | backward | 光標向左（向後）移動，輸入方向是前 |
| Ctrl + F、→ | forward | 光標向右（向前）移動，輸入方向是前 |
| Ctrl + ← 、Alt + B、先後按 Esc 和 B | backward | 光標向左（向後）移動，一次移動一個單詞 |
| Ctrl + → 、Alt + F、先後按 Esc 和 F | forward | 光標向右（向前）移動，一次移動一個單詞 |
| Ctrl + R | reverse | 出現命令歷史記錄搜索提示，輸入字符後會自動匹配命令 |
| Ctrl + P | previous | 向上翻以前的輸入命令，相當於向上方向鍵 |
| Ctrl + N | next | 向下翻以前的輸入命令，相當於向下方向鍵 |
| Ctrl + W | word | 從光標位置向後刪除一個字 |
| Ctrl + Y | yank | 粘貼最後一個刪除的字 |
| Ctrl + D | delete | 刪除當前光標位置的一個字符 |
| Ctrl + U | unix-line-discard | 從光標當前位置刪除所有字符至行首 |
| Ctrl + K | kill-line | 從光標當前位置刪除所有字符至行尾 |
| Ctrl + C、Ctrl + D、Ctrl + Z | cancel、 down、Z 是最後一個字母表示結束 | 結束任務 |
| !! |  | 執行上一個命令 |
| !top |  | 執行上一個跟 top 有關的命令 |
| !top:p |  | 列出上一個跟 top 有關的命令 |
| !$ |  | 執行上一個命令的最後一段 |
| !* |  | 顯示上一個命令的最後一段 |



參考：
https://www.tecmint.com/linux-command-line-bash-shortcut-keys/
https://stackoverflow.com/questions/4415598/what-does-u-stand-for-in-ctrlu
https://unix.stackexchange.com/questions/154228/what-is-the-keyboard-shortcut-opposite-to-ctrlk

=======================================================================
https://rez1coder.medium.com/how-to-vim-like-a-pro-a-how-to-guide-for-maximum-productivity-c01773ee346a

It’s time to ditch the mouse and say hello to Vim.

This powerful text editor may have a tough reputation, but with a little practice, you’ll be slicing through keystrokes like a pro in no time.

So, grab your keyboard and let’s get started!

Note: This article assumes you have some knowledge of Vim. If you’re a newbie, check out Ben Awad’s Vim Tutorial before diving in.

Vim’s Help
Type :help quit or :h quit to open documentation containing quit inside Vim
i.e. :h keyword - open documentation with keyword

Tip: Press tab to autocomplete anything in command mode.

Exiting
:q - quit (close) file
:qa - quit all files
:w - write (save)
:wq or :x - write and quit file
Open file within vim
:e filename - edit file
:tabnew filename - edit file in a new tab
Tip: Press gt - go to next tab and gT - go to previous tab

Open file(s) via terminal
vim filename - open a specific file filename
vim -p filename1 filename2 filename3 - open multiple files in different tabs
Basic Vim Motions
hjkl - left, up, down, right Also known as Arrow Keys - to move the cursor by one space in every direction:

Arrow Keys
Editing
i - insert text
a - insert text after cursor
I - insert text at beginning of line
A - append text at the end of line
o - insert line below current line
O - insert a line above current line
Recover Changes
u - undo changes
ctrl + r - redo changes
Moving around
{count}motion i.e 5j means jump 5 lines down, 9k means jump 9 lines up
w - move by word
e - move by end of word
b - move backwards by word
gg - beginning of file
G - end of file
“ If you believe in yourself and have dedication and pride — and never quit, you’ll be a winner. The price of victory is high but so are the rewards. “

Operators
Lets you operate in a range of text (defined by motion). These are performed in normal mode.

d - delete
y - yank (copy)
c - change (delete and insert)
v - visual select
Delete / Change
dd - delete line
yy - yank current line
cc - change line (similar to C and S)
x - ex-out text
r - replace a character
R - enter replace mode
s - change a letter
S - change complete line
Selecting
v - go into character-wise visual mode
V - go into line-wise visual mode
C-v - go into block-wise visual mode
Copy and Paste
y - yank text
yy - yank current line
:%y+ - copy whole file
p pastes something after the cursor
P pastes something before the cursor
Moving horizontally with high precision
f - find text
F - find text backwards
t<char> - move till the next appearance of character <char> in current line
T<char> - move till the previous appearance of character <char> in current line backwards
File Search
/keyword - search forward for occurence of pattern
?keyword - search backward for occurence of pattern
n - go to next matching search pattern
N - go to previous matching search pattern
* - go to next occurrence of pattern under cursor (repeat search)
# - go to previous occurrence of pattern (repeat search)
Indent or Unindent
> - shift right
< - shift left
= - fix indentation
>> - Increase indentation in current line
<< - Decrease indentation in current line
Advanced
. - repeat last change
