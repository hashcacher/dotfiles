alias pygrep='find . -name "*.py" -print0 | xargs -0 grep'
alias csgrep='find . -name "*.cs" -print0 | xargs -0 grep'
alias cdtensor='cd /usr/local/lib/python2.7/dist-packages/tensorflow/'
alias cdgb='cd ~/code/GregBound'
alias cdpiper='cd ~/code/piper3'
alias cdai='cd ~/code/fast-ai-course'
alias cdtd='cd ~/code/td/Assets'
alias cdcg='cd ~/code/ChessGo_n_Ads/ChessGo/Assets'
alias gitgraph='git log --graph --all --decorate'

function imagenet {
    python /usr/local/lib/python2.7/dist-packages/tensorflow/models/image/imagenet/classify_image.py --image_file=$1
}

function rmLastNMod {
    ls -pt | grep -v / | head -$1 | xargs -d '\n' rm -i -f --
}
