# Moving Around (Normal Mode)

- `e` _Move to the end of a word_
- `w` _Move forward to the beginning of a word_
- `3w` _Move forward three words_
- `W` _Move forward a WORD (any non-whitespace characters)_
- `b` _Move backward to the beginning of a word_
- `3b` _Move backward three words_
- `$` _Move to the end of the line_
- `0` _Move to the beginning of the line_
- `^` _Move to the first non-blank character of the line_
- `)` _Jump forward one sentence_
- `(` _Jump backward one sentence_
- `}` _Jump forward one paragraph_
- `{` _Jump backward one paragraph_
- `H` _Jump to the top of the screen_
- `M` _Jump to the middle of the screen_
- `L` _Jump to the bottom of the screen_
- `10<c-b>` _Move 10 pages up_
- `5<c-f>` _Move 5 pages down_
- `gg` _Jump to beginning of file_
- `G` _Jump to end of file_
- `50G` _Jump to line 50_
- `mx` _Set mark x at the current cursor position_
- `'x` _Jump to the beginning of the line of mark x_
- `` `x `` _Jump to the cursor position of mark x_
- `''` _Return to the line where the cursor was before the latest jump - two single quotes_
- ` `` ` _Return to the cursor position before the latest jump (undo the jump) - two back ticks_
- `'.` _Jump to the last-changed line_
- `%` _Jump to corresponding item, e.g. from an open brace to its matching closing brace_
- `*` _Search forward for the word under cursor, g* for non-exact word - normal mode_
- `#` _Search backward for the word under cursor, g# for non-exact word - normal mode_

# Registers

- `<c-r>a` _Paste the content of register a - insert and command mode_
- `:let @/='Text'`  _Write 'Text' to register / - command mode_
- `"kyy` _Copy the current line to register k - normal mode_
- `"Kyy` _Append the current line to register k - normal mode_

# Editing

- `:3,15move 40` _Move the content of lines 3 through 15 to bellow line 40 - command mode_
- `:3,15copy 40` _Copy the content of lines 3 through 15 to bellow line 40 - command mode_
- `/` or `:` then `<c-r><c-w>` _Copy word under cursor to command line - normal mode_
- `<c-n>` _Autocomplete - insert mode_
- `<c-a>` _Increment a number - normal mode_
- `<c-x>` _Decrement a number - normal mode_
- `cc` _Delete a line and put the cursor in the beginning in edit mode - normal mode_
- `C` _Delete all at right side of the cursor and change to edit mode - normal mode_
- `cw` or `ciw` _Replace a word - normal mode_
- `ci"` _Delete everything inside quotes and put in edit mode - normal mode_
- `:Lexplore scp://<host>//home/user/` _Open remote folder from inside vim - normal mode_
- `:edit scp://<host>//home/user/test.txt` _Open remote file from inside vim - normal mode_
- `:sort u` _Sort a file and remove duplicates_
- `:%g!/<pattern>/d` _Delete all lines that matches the pattern. Use ! if you want to delete lines that do not match the pattern._

# Macros

- `q<letter>` _Start macro recording, press q to stop recording. To execute the macro n times, type <number>@<letter>_

# netrw (:Lexplore)

- `I` _Show banner_
- `i` _Change listing style_
- `<F1>` _Help_
- `%` _New file_
- `-` _Go up one directory_
- `d` _Make a directory_
- `R` _Rename the designated file(s)/directory(ies)_
- `mb` _Bookmark current directory_
- `gb` _Go to previous bookmarked directory_
- `<del>` _Remove the file/directory_
- `<c-l>` _Refresh the directory list_ing
- `gh` _Quick hide/unhide of dot-files_
- `v` _Enter the file/directory in a new browser window_
- `qb` _List bookmarked directories and history_
- `qf` _Display information on file_
- `u` _Change to recently-visited directory_
- `U` _Change to subsequently-visited directory_

## Copying files to another directory

1. Put the cursor on the directory you want to copy the files to and press `mt`
2. Go to each file you want to copy and press `mf` to select them
3. Press `mc` and the selected files should be copied to the destination directory

# Terminal Mode

- `:terminal` _To start a terminal in the current window_
- `i` _To enter terminal mode_
- `<c-\><c-n>` _To exit terminal mode_

# Help Pages
- `c-]` _When the cursor is on a tag, redirects you to that session of the page_
- `c-T` _Go back to previous tag_

# Vimdiff Mode

- `[c` _Jump backwards to the previous change_
- `]c` _Jump forward to the next change_

## Diff between two buffers
1. Split the window and put one buffer in each
2. Execute the command `:diffthis` in each window

## Diff between a buffer and a file
1. With the buffer in the current window, open the file using `:diffsplit <path>`
2. Go back to the buffer window and execute `:diffthis`

# Misc
- `:map` or `:help index` _Show mapped keys - command mode_
- `K` _Run a program to lookup the word under the cursor - normal mode_
- `:mksession <path>/<session_name>` _Save your current session (open tabs, buffer, etc.) - command mode_
- `:source <path>/<session_name>` _To restore your session - command mode_

