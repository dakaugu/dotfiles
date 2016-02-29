alias ls="ls --color=auto"

alias restart_services="sudo service uwsgi restart; sudo service nginx restart"
alias fanmgmt="cd /home/drishi/projects/HearsayLabs/fanmgmt"
alias usermgmt="cd /home/drishi/projects/HearsayLabs/fanmgmt/usermgmt"
alias js="cd /home/drishi/projects/HearsayLabs/fanmgmt/static/js/"
alias rebuild="cd /home/drishi/projects/HearsayLabs/scripts; ./build_virtual_env.sh"
force_color_prompt=yes

alias psrc="cd /home/drishi/projects/prbot/src/pr_bot"
alias dsrc="cd /home/drishi/projects/hearsay-deploy-utils/src/deploy_utils"
alias bsrc="cd /home/drishi/projects/boxbot/src/boxbot"
alias prbot_box="ssh-role prbot"
alias prbot_dbshell="ssh-role prbot; mysql --user=prbot --password=crowdcontext --host=pnw-dev-prbot.cq8zuscratld.us-west-2.rds.amazonaws.com prbot"
alias run_chef="sudo chef-client"
alias prtestdb="mysql -h pnw-dev-mysql-c1-aurora-cluster.cluster-cq8zuscratld.us-west-2.rds.amazonaws.com -u prbot -p"

# Git aliases
alias co="git checkout"
alias commit="git commit -m"
alias st="git status"
alias add="git add"
alias gfr="git fetch upstream; git rebase upstream/master"
alias br="git branch"
alias push="git push origin"
alias stash="git stash"
alias branch="co master; co -b "

# Directory nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Grep alias
alias grep="grep -rn --color=auto"

# Fanmgmt aliases
alias shell="./run.sh manage.py shell --organization=1 --settings=settings.drishi"
alias dbshell="./run.sh manage.py dbshell"
alias tests="./run.sh manage.py test"

fixssh() {
    for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
        if (tmux show-environment | grep "^${key}" > /dev/null); then
            value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
            export ${key}="${value}"
        fi
    done
}

ssh-reagent() {
for agent in $SSH_AUTH_SOCK $STATIC_SSH_AUTH_SOCK /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
            echo "Found working SSH Agent: ${SSH_AUTH_SOCK}"
            ssh-add -L
            return
        fi
    done
    echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

SOCK="/tmp/ssh-agent-$USER-screen"
fixssh2() {
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
}

SAVEHIST=100
HISTFILE=~/.zsh_history
