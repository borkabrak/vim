" =======================================================================
" NOTE: Set mapleader BEFORE using it in mappings.
" You wouldn't think this needs to be said, but it's already bitten me.
" Twice.  :-D
" =======================================================================
let g:mapleader = ","

" Easier than flailing away at the <ESC> key all day..
" (later jon says you can also try Alt-E or ^[)
inoremap jj <ESC>
inoremap JJ <ESC>

" Use the command window instead of the normal command line (and start in
" insert mode)
" nnoremap : q:i

" Horizontally resize windows with Ctrl-Shift-h/l
nnoremap  >
nnoremap  <

" SESSION MANAGEMENT MAPPINGS:
" ------------------------------------------------------------------------------
" manually save a session
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>
" recall the manually saved session
noremap <F6> :source ~/.vim/manual_session.vim<cr>
" recall the automatic session saved on last shutdown of vim
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" By default,
"   Double apostrophe is 'go the cursor position's line'
"   Double backtick is 'go to the last cursor position's *character*'
" Switch these.
nnoremap ` '
nnoremap ' `

" Also switch ':' and ';' (command mode and next 'f')
" (This'll take a little getting used to.  Maybe don't remap the real colon until I do.)
nnoremap ; :
nnoremap : ;

" Switch colon and semi-colon for visual mode
vnoremap ; :
vnoremap : ;

" Easier to follow links (e.g., in help files) and go back
"   This just ended up confusing me.  Open them up for other mappings.
"nnoremap <CR> <C-]>
"nnoremap <BS> <C-T>

" <Enter> inserts a line, even in normal mode
" nnoremap <CR> i<CR><ESC>

" Backspacing over a character deletes it, even in normal mode
" nnoremap <BS> X

" Make it pretty! (I don't need no stinkin' 'ex mode'..)
map Q gq

" Make p in Visual mode replace the selected text with the "* register.
" (Which mirrors the system clipboard)
" vnoremap p <Esc>:let current_reg = @*<CR>gvs<C-R>=current_reg<CR><Esc>

" Walk through buffers
" nnoremap <Tab>   :bn<cr>
" nnoremap <S-Tab> :bp<cr>
nnoremap <C-j> :bn<cr>
nnoremap <C-k> :bp<cr>

" switch current directory to where the current file is.
nnoremap cd :chdir %:h<cr>:pwd<cr>

" Leave cursor where it was when yanking!
vnoremap y ygv<Esc>
vnoremap Y Ygv<Esc>

" Move between windows left/right
" (Especially useful with i.e. Nerdtree)
nnoremap  h
nnoremap  l


" ================
" Leader mappings
" ================

" Go to most recently visited buffer
nnoremap <Leader><Space> 

" Numbered buffers
nnoremap <Leader>1 :b1<cr>
nnoremap <Leader>2 :b2<cr>
nnoremap <Leader>3 :b3<cr>
nnoremap <Leader>4 :b4<cr>
nnoremap <Leader>5 :b5<cr>
nnoremap <Leader>6 :b6<cr>
nnoremap <Leader>7 :b7<cr>
nnoremap <Leader>8 :b8<cr>
nnoremap <Leader>9 :b9<cr>

" List buffers
nnoremap <Leader>l :ls<cr>

" write file
nnoremap <Leader>w :w<cr>

" drop buffer
nnoremap <Leader>d :bd<cr>

" quit easily
nnoremap <Leader>q :q<cr>

" reload vimrc files
" TODO: Resourcing vimrc like this doesn't actually check for a successful load
nnoremap <Leader>s :source $MYVIMRC<cr>:echo "vimrc reloaded (we hope)."<cr>

" Reload current file
nnoremap <Leader>e :e<cr>

" Insert a signature
nnoremap <Leader>@ oJon Carter<cr>borkabrak@gmail.com<Esc>

" Insert a human-readable timestamp
nnoremap <Leader>t :r!date +"\%F \%r"<cr>

" Insert just the date
nnoremap <Leader>D :r!date +"\%F"<cr>

" run the current file
nnoremap <Leader>r :!./%<cr>

" make current file executable
nnoremap <Leader>x :!chmod +x %<cr>

" Underline the current line with various symbols.
" (Very handy for, e.g. Markdown )
"   * underline length matches the line above
"   * the new line is left in the anonymous register (so 'p' will put it again)
nnoremap <leader>= yypv$r=yy
nnoremap <leader>- yypv$r-yy
nnoremap <leader># yypv$r#yy
nnoremap <leader>" yypv$r"yy
nnoremap <leader>* yypv$r*yy
nnoremap <leader>U yypv$r━yy

" 'Save as':
"   Write to a filename (prompted for) and switch to it.
nnoremap <leader>S :sav

" Paste from system clipboard
nnoremap <leader>i :set paste<cr>"*p:set nopaste<cr>

" Select what was just pasted
nnoremap gp `[v`]

" 'gf' normally opens the file under the cursor.  This makes is so it
" also creates it if it doesn't exist
nnoremap gf :e <cfile><cr>

" Edit .vimrc
nnoremap <leader>v :e $MYVIMRC<cr>

" Format highlighted text into nice columns
vnoremap  :!column -t<cr>

" Search for selected text (backwards and forwards)
vnoremap <silent>* y/0<cr>
vnoremap <silent># y?0<cr>

" Open the link under the cursor in an external browser (w3m - console
" based)
nnoremap <leader>W :!x-www-browser <cfile><cr>

" A couple of mapping to step through quickfix results easier:
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprev<cr>
" duplicate, yeah, but I keep trying it..
nnoremap <leader>p :cprev<cr>

" Toggle highlighting searches
nnoremap <leader>h :set hlsearch!<cr>

nnoremap <leader>rtw :call RemoveTrailingWhitespace()<cr>
nnoremap <leader>rtW :call RemoveTrailingWhitespaceConfirm()<cr>

" javascript help (NOTE: 'cl' conflicts with a mapping in nerdcommenter)
nnoremap <leader>cL oconsole.log("");<esc>hhi

" Format the current paragraph
nnoremap <leader>Qp mt{gq}'t

" Ctrl-C copies to system clipboard
vnoremap  "+y:let @*=@+<cr>:echo "Selection copied to system clipboard"<cr>
