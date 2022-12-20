alias fn='find . -name ' 
alias pygrep='find . -name "*.py" -print0 | xargs -0 grep'
alias csgrep='find . -name "*.cs" -print0 | xargs -0 grep'
alias cdtensor='cd /usr/local/lib/python2.7/dist-packages/tensorflow/'
alias cdgb='cd ~/code/GregBound'
alias cdpiper='cd ~/code/piper3'
alias cdmt='cd ~/code/minetest'
alias cdmc='cd ~/code/minetest/games/mineclone2'
alias cdai='cd ~/code/fast-ai-course'
alias cdtd='cd ~/code/td/Assets'
alias cdcg='cd ~/code/ChessGo_n_Ads/ChessGo/Assets'
alias cdcs='cd ~/code/ChessGo_n_Ads/ChessGo\ Server/Card\ Game\ Server'
alias cdrn='cd ~/code/native-starter-kit'
alias cd3d='cd ~/code/3dgifmaker'
alias cdplant='cd ~/code/plantchess'

alias cdworlds='cd ~/code/minetest/worlds/marsWorld-Latest'
alias cdmods='cd ~/code/piper-mods'
alias trig="vim ~/code/minetest/worlds/marsWorld-Latest/triggers.json"

alias gitgraph='git log --graph --all --decorate'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcl='git clone'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gda='git diff HEAD'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gln='git log --name-status'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gs='git status'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'

alias dps='docker ps'
alias di='docker images'
alias dk='docker kill'
alias ds='docker stop'
alias dl='docker log'
alias dcud='docker-compose up -d'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcl='docker-compose down'

alias sshssh='ssh root@52.53.179.223'

alias k='kubectl'
alias kstart='cd ~/code/k8s-bootstrap/; ./bootstrap-minikube.sh'
alias kclean='minikube delete; rm -rf ~/.minikube; kstart'
alias kg='kubectl get pods'
alias kgparse='export POD_NAME=$(kubectl get pods --namespace pn-push | grep parser | grep Running | awk '\''{ print $1 }'\'')'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl exec -it'

function imagenet {
    python /usr/local/lib/python2.7/dist-packages/tensorflow/models/image/imagenet/classify_image.py --image_file=$1
}

function rmLastNMod {
    ls -pt | grep -v / | head -$1 | xargs -d '\n' rm -i -f --
}

function rebaseAll {
	cd ~/code/piper-mods
	git stash
	git pull --rebase
	git stash pop

	cd ~/code/minetest
	git stash
	git pull --rebase
	git stash pop

	cd ~/code/minetest/worlds/marsWorld-Latest
	git stash
	git pull --rebase
	git stash pop
}
