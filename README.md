# CV

To see the pdf click [here](/cv.pdf)

<!--toc:start-->

- [CV](#cv)
  - [Run as a github action](#run-as-a-github-action)
  - [Prerequisites(to run locally)](#prerequisitesto-run-locally)
  - [Compilation](#compilation) -
  [Compile from terminal](#compile-from-terminal) -
  [Compile from nvim](#compile-from-nvim)
  <!--toc:end-->

## Run as a github action

A GitHub action was created to generate and commit the pdf.

## Prerequisites(to run locally)

1. Install a LaTeX Distribution

   - Ubuntu/Debian (Linux)

   ```shell
   sudo apt update
   sudo apt install texlive-full latexmk
   ```

   - macOS

   Install [MacTeX](https://tug.org/mactex/) which is too heavy or use the
   lightweight version [BasicTex](https://tug.org/mactex/morepackages.html).

   - Windows

   Install MiKTeX.

2. Save Your CV as a .tex File

   1. Create a New File:

      - Open your terminal and navigate to your desired directory.
      - Create a new file named cv.tex:

      ```shell
       touch cv.tex
      ```

   2. Paste Your LaTeX Code:

      - Open cv.tex in Neovim:

      ```shell
      nvim cv.tex
      ```

      - Paste your CV LaTeX code into this file.
      - Save the file by pressing :w in Neovim.

   3. Set Up Neovim with vim-plug and CoC

      a. Install vim-plug

      If you haven’t installed vim-plug yet:

      ```shell
      curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      ```

      b. Configure init.vim

      1. Open Neovim Configuration:

         ```shell
         nvim ~/.config/nvim/init.vim
         ```

      2. Set Up vim-plug in init.vim:

         ```vim
         call plug#begin('~/.local/share/nvim/plugged')

         Plug 'neoclide/coc.nvim', {'branch': 'release'}
         Plug 'lervag/vimtex'

         call plug#end()
         ```

      And then execute :PlugInstall in nvim.

   4. Configure vimtex Plugin

      Add the following configurations to your init.vim:

      ```vim
      " VimTeX configuration
      let g:tex_flavor = 'latex'
      let g:vimtex_view_method = 'zathura' " Use 'zathura', 'evince', 'okular'
      let g:vimtex_compiler_method = 'latexmk'
      " Disable compilation
      let g:vimtex_map_compile = 0

      " Map to compile
      nmap <leader>la <Plug>(vimtex-compile)
      ```

   5. Install coc-texlab: In Neovim, run:

      ```vim
      :CocInstall coc-texlab
      ```

## Compilation

Verify if you have latexmk

```shell
which latexmk
```

in case that is not present then install it

```shell
sudo tlmgr update --self --all
sudo tlmgr install latexmk enumitem needspace fontawesome5
```

### Compile from terminal

```shell
latexmk -C cv.tex
latexmk -pdf cv.tex
```

or use our make commands

```shell
make fresh
make view
```

### Compile from nvim

```text
<localleader>la will compile the tex file (according to our config)
<localleader>lc clear aux files
<localleader>lC full clear
<localleader>lv view the generated file
```

> [!NOTE]
> In my case localleader is \
