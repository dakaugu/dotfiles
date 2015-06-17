alias ls="ls --color=auto"
alias gfr="git fetch upstream; git rebase upstream/master"
alias my_shell="./run.sh manage.py shell --organization=1 --settings=settings.drishi"
alias my_neutral_dbshell="./run.sh manage.py dbshell --cluster=neutral --settings=settings.drishi"
alias restart_services="sudo service iwsgi restart; sudo service nginx restart"
alias fanmgmt="cd /home/drishi/projects/HearsayLabs/fanmgmt"
force_color_prompt=yes

alias psrc="cd /home/drishi/projects/prbot/src/pr_bot"
alias dsrc="cd /home/drishi/projects/hearsay-deploy-utils/src/deploy_utils"
alias bsrc="cd /home/drishi/projects/boxbot/src/boxbot"
alias prbot_box="ssh-role prbot"
alias prbot_dbshell="ssh-role prbot; mysql -u prbot -p -h pnw-dev-prbot.cq8zuscratld.us-west-2.rds.amazonaws.com"
alias run_chef="sudo chef-client"
alias prtestdb="mysql -h pnw-dev-mysql-c1.cq8zuscratld.us-west-2.rds.amazonaws.com -u prbot -p"

fixssh() {
    for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
        if (tmux show-environment | grep "^${key}" > /dev/null); then
            value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
            export ${key}="${value}"
        fi
    done
}
