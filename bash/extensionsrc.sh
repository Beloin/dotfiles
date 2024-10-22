# Import on your main *rc file

# Aliases
alias gpp="git pull --rebase"
alias dstop="docker container ls -q | xargs -I {} docker stop {}"
alias gst="git status"
alias g="git"
alias xilip="xclip -sel clip"

# Functions
# alias list="ls -lht"
function list () {
    if [ -z "$1" ]; then num=10; fi;
    ls -lht --color=auto | head -n $num
}

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Copy pipe to clipboard
function copy () {
    read var
    xclip -sel clip <<< $var
}

# Run program from terminal without output and asynchronously
function async_run() {
    if [ -z "$1" ]; then echo "Not given any arguments" 1>&2; return 1; fi;
    echo "Running: $@";
    nohup $@ > /dev/null 2>&1 &;
    export ASYNC_LAST_RUN=$(echo "$!")
}

function async_close() {
    if [ "$ASYNC_LAST_RUN" -eq 0 ]; then echo "asynchronously proccess has not started" 1>&2; return 1; fi;
    echo "Closing: $ASYNC_LAST_RUN";
    kill $ASYNC_LAST_RUN;
}

function async_await() {
    if [ "$ASYNC_LAST_RUN" -eq 0 ]; then echo "asynchronously proccess has not started" 1>&2; return 1; fi;
    echo "Waiting for $ASYNC_LAST_RUN";
    wait $ASYNC_LAST_RUN;
}

function this_branch () {
    git branch | grep \* | awk '{print $2}'
}

function shwsize ()
{
    du -h -d1  . | sort -hr
}

#######################################
# Generate a GIF from a video
# Arguments:
#   video input
#   gif output 
#   Size (Default is 720x405)
#   Framerate (Default is 10)
#######################################
function create_gif() {
    command -v ffmpeg 2>&1 > /dev/null
    e_code=$?
    if [[ ! $e_code = 0 ]]; then 
      echo "ffmpeg is not installed";
      return 1;
    fi;

    arg1=$1;
    arg2=$2;
    arg3=$3;
    arg4=$4;

    if [ ! -n "$arg1" ]; then return 1; else; fi;
    if [ ! -n "$arg2" ]; then return 1; else; fi;
    if [ ! -n "$arg3" ]; then arg3="720x405"; else; fi;
    if [ ! -n "$arg4" ]; then arg4=10; else; fi;


    palette=palette_$(date +%s).png;

    ffmpeg -y -i "$arg1" -vf palettegen "$palette";
    ffmpeg -y -i "$arg1" -i "$palette" -filter_complex paletteuse -r $arg4 -s "$arg3" "$arg2";

    rm "$palette";
}

