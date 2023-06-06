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