## use rmtrash instead rm command
alias rm='rmtrash'

## include git completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

## prompt settings
if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
fi
ps1_body() {
  echo '\[\e[1;36m\]\u:\W\[\e[00m\]'
}
ps1_tail() {
  echo '\$ '
}
ps1_branch() {
  [[ $GIT_PS1_SHOWDIRTYSTATE ]] && echo '\[\e[1;34m\]$(__git_ps1 " [%s]")\[\e[00m\]'
}
ps1_vim() {
  [[ $VIM ]] && echo '\[\e[1;32m\](vim)\[\e[00m\] '
}
PS1="$(ps1_vim)$(ps1_body)$(ps1_branch)$(ps1_tail)"
