# Dependencies

Those dependencies with "coc-*" must be installed using command `CocInstall`.
Should update `coc-settings.json` with the one in this dir.

1. ~coc-python~ replaced for coc-jedi
2. coc-jedi
3. coc-diagnostic
4. coc-json
5. [nvim-dap](https://github.com/mfussenegger/nvim-dap)
6. [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
    - Requires this setup: `:lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')`
8. nvim-treesitter
1. requiriments (For python install):
    - yapf
    - jedi
    - debugpy
    - pynvim
    - pylint

PS: All python lib can and could be installed on a global venv

## TODO:

1. Criar um script com a instalacao e setup automatico
