# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
# Inspired by theme: risto
PROMPT='%{$fg_bold[green]%}%n@%m:%{$fg_bold[blue]%}%~%{$reset_color%}%(!.#.$) '
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
