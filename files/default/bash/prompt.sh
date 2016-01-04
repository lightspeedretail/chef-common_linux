
#
# Globals
#

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

PROMPT_DELIM=${PROMPT_DELIM:-:}
PROMPT_PWDMAXLEN=${PROMPT_PWDMAXLEN:-25}
PROMPT_WITH_GIT=${PROMPT_WITH_GIT:-false}
PROMPT_WITH_TRUNCATE=${PROMPT_WITH_TRUNCATE:-true}
PROMPT_COLOR_HOST=${PROMPT_COLOR_HOST:-$bldpur}
PROMPT_COLOR_PWD=${PROMPT_COLOR_PWD:-$txtrst}
PROMPT_COLOR_OTHER=${PROMPT_COLOR_OTHER:-$txtgrn}
PROMPT_COLOR_STRUCT=${PROMPT_COLOR_STRUCT:-$txtrst}

#
# Prompt
#

prompt_truncate_pwd ()
{
    # how many characters of the $PWD should be kept
    local pwdmaxlen=${PROMPT_PWDMAXLEN:-25}

    # indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}

    if [ $pwdmaxlen -lt ${#dir} ]
    then pwdmaxlen=${#dir}
    fi

    local NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
    echo "$NEW_PWD"
}

prompt_set_content ()
{
    local GIT_PS1_SHOWDIRTYSTATE=true
    local shlvl=''

    if $PROMPT_WITH_GIT; then
        local branch="$(__git_ps1 ${PROMPT_COLOR_OTHER}%s$txtrst)"
    else
        local branch=""
    fi

    if [ -n "$branch" ]
    then branch=":$branch"
    fi

    if [ "${SHLVL:-1}" -gt 1 ]
    then shlvl=":${PROMPT_COLOR_OTHER}$SHLVL${txtrst}"
    fi

    PS1="${txtrst} : ${PROMPT_COLOR_HOST}\h${txtrst}${shlvl}"
    PS1+=":${PROMPT_COLOR_PWD}${PWD}${txtrst}${branch} : "
    PS2="${txtrst} : "
    PS3="${txtrst} > "
}

prompt_set () {
    local PROMPT_DELIM=${PROMPT_DELIM:-:}
    local PROMPT_PWDMAXLEN=${PROMPT_PWDMAXLEN:-25}
    local PROMPT_WITH_GIT=${PROMPT_WITH_GIT:-false}
    local PROMPT_WITH_TRUNCATE=${PROMPT_WITH_TRUNCATE:-false}
    local PROMPT_COLOR_HOST=${PROMPT_COLOR_HOST:-$txtylw}
    local PROMPT_COLOR_PWD=${PROMPT_COLOR_PWD:-$txtgrn}
    local PROMPT_COLOR_OTHER=${PROMPT_COLOR_OTHER:-$txtylw}
    local PROMPT_COLOR_STRUCT=${PROMPT_COLOR_STRUCT:-$txtrst}

    if [[ $UID == 0 ]]; then
        PROMPT_COLOR_PWD="$txtred"
    fi

    if $PROMPT_WITH_TRUNCATE; then
        local PWD=$(prompt_truncate_pwd)
    else
        local PWD=${PWD}
    fi

    prompt_set_content

    # set window title
    if [ -n "${DISPLAY:-}" ]
    then echo -ne "\033]0;`whoami`: $PWD\007"
    fi

    export PS1
}
export PROMPT_COMMAND=prompt_set

# vim: set ft=sh ts=4 sw=4 tw=80 et: 
