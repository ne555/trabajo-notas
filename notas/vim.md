# Remoto
scp://wbedrij@131.255.4.200:2235//var/www/cas/suitecrm_dev/custom/modules/Emails/emailsToCases.php

# Salir del diff
:windo diffoff

# Cambiar a MAYUSCULAS o minuscolas con :s
s#\(bla\)#\U\1\e don't touch this#
s#\(bla\)#\L\1\e don't touch this#

# Mergetool
Concepts for resolving Git conflicts
For using mergetool in git, we need to understand the following terminology to understand what is being merged:

* LOCAL - the head for the file(s) from the current branch on the machine that you are using.
* REMOTE - the head for files(s) from a remote location that you are trying to merge into your LOCAL branch.
* BASE - the common ancestor(s) of LOCAL and REMOTE.
* MERGED - the tag / HEAD object after the merge - this is saved as a new commit.

# Quickfix
```vimrc
:cfile archivo
```
Formato del archivo:
ruta/completa/relativa/o/absoluta/archivo.ext:42: linea
(``grep -Rn`` genera correctamente)

# Cerrar buffers inactivos
```vimrc
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
```

```vimrc
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
```

```vimrc
command! -nargs=* Only call CloseHiddenBuffers()
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun
```

# Plugins
Both VIm 8.0 and Neovim have their own built-in package manager.

In VIm 8.0, create the following directories:

~/.vim/pack/*/start (where * may be any name e.g. ~/.vim/pack/jimmy/start): Clone your required plugin into the start directory just as you would if you were installing it for Pathogen. You need nothing more and no commands in your .vimrc file.
~/.vim/pack/*/opt (e.g. ~/.vim/pack/jimmy/opt) for plugins that only need to be loaded as required. For colours, add a directory to the opt directory and then your colours e.g. ~/.vim/pack/jimmy/opt/mycolors/colors/dracula.vim.
In Neovim, the directory structure follows the freedesktop's XDG Base Directory Specification. Your configuration file is in ~/.config/nvim/init.vim, but your plugins go into:

~/.local/share/nvim/site/pack/*/start
See :h packages (VIm 8.0 and Neovim) for more information.
