# cmpile.nvim
Compile C/C++ files directly from nvim

> Usage:
>   
>     :compile or <leader>mm

## ⚠️ Warning 
This may not be what you are looking for this plugin is very barebones.

## Requirements
Requires [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

## Installation 
  Using [lazy](https://github.com/folke/lazy.nvim) :
  ``` vim
      {
        'voldemort401/cmpile.nvim',
        opts = {
            keymap = "<leader>cm",           -- optional: override the default keymap
            Compiler = 'g++',                -- optional: change the default compiler
            Compiler_args = "-o main.out",   -- optional: give the compiler some arguments
        }
      }

  ```
