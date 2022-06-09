set statusline=
set statusline+=%{sacca#printSpace()}
set statusline+=%{sacca#gitInfo()}
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %y
set statusline+=%{sacca#printSpace()}
