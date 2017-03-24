alias aptsearch='apt-cache search'
alias aptinstall='sudo apt-get install'
alias pygrep='find . -name "*.py" -print0 | xargs -0 grep'
alias csgrep='find . -name "*.cs" -print0 | xargs -0 grep'
alias cdtensor='cd /usr/local/lib/python2.7/dist-packages/tensorflow/'
alias cdgb='cd ~/code/GregBound'
alias cdpiper='cd ~/code/piper'
alias cdai='cd ~/code/fast-ai-course'

function imagenet {
    python /usr/local/lib/python2.7/dist-packages/tensorflow/models/image/imagenet/classify_image.py --image_file=$1
}
