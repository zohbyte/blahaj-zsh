# Transgender-colored theme based gnzh based on bira

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Transgender colors
local BLAHAJ_BLUE='%F{75}'
local BLAHAJ_PINK='%F{205}'
local BLAHAJ_WHITE='%F{15}'
local BLAHAJ_RESET='%f'

# Check UID
if [[ $UID -ne 0 ]]; then
  PR_USER="${BLAHAJ_BLUE}%n${BLAHAJ_RESET}"
  PR_USER_OP="${BLAHAJ_BLUE}%#${BLAHAJ_RESET}"
  PR_PROMPT="${BLAHAJ_PINK}└─$ ${BLAHAJ_RESET}"
else
  PR_USER="${BLAHAJ_PINK}%n${BLAHAJ_RESET}"
  PR_USER_OP="${BLAHAJ_PINK}%#${BLAHAJ_RESET}"
  PR_PROMPT="${BLAHAJ_BLUE}└─# ${BLAHAJ_RESET}"
fi

# Check if we are on SSH
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST="${BLAHAJ_PINK}%M${BLAHAJ_RESET}" # SSH
else
  PR_HOST="${BLAHAJ_BLUE}%m${BLAHAJ_RESET}" # local
fi

local return_code="%(?..${BLAHAJ_PINK}%? ↵${BLAHAJ_RESET})"

local user_host="${PR_USER}${BLAHAJ_WHITE}@${PR_HOST}${BLAHAJ_RESET}"
local current_dir="${BLAHAJ_WHITE}%~${BLAHAJ_RESET}"
local git_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)' 

PROMPT="┌──(${user_host}) 🏳️‍⚧️ [${current_dir}]${git_branch}${venv_prompt}
${PR_PROMPT}"
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="${BLAHAJ_WHITE}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› ${BLAHAJ_RESET}"
ZSH_THEME_RUBY_PROMPT_PREFIX="${BLAHAJ_PINK}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›${BLAHAJ_RESET}"
ZSH_THEME_VIRTUALENV_PREFIX="${BLAHAJ_PINK}("
ZSH_THEME_VIRTUALENV_SUFFIX=")${BLAHAJ_RESET} "

}
