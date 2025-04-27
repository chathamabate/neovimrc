
#### EXPORT LOCAL BIN FOLDER TO GLOBAL PATH ####
export PATH=$PATH:/Users/chathamabate/cbin

#### TI C Toolchain Binaries ####
export PATH=$PATH:/Users/chathamabate/CEdev/bin

#### GPG Prompt ####
export GPG_TTY=$(tty)

#### EXPORT GO BINARIES ####
export PATH=$PATH:/Users/chathamabate/go/bin

#### RACKET BINARIES ####
export PATH=$PATH:/Applications/Racket\ v8.2/bin

#### EXPORT JAVA HOME ####
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

export LW_SAVES=/Users/chathamabate/Library/Application\ Support/Steam/steamapps/common/Logic\ World/saves

#### EXPORT VCPKG PATH ####
export VCPKG_ROOT=$HOME/vcpkg

#### AWS RDS Stuff ####
export RDSHOST="db-free-test.csiej2iy743u.us-east-2.rds.amazonaws.com"

alias clang16="/usr/local/opt/llvm/bin/clang"
alias clang16++="/usr/local/opt/llvm/bin/clang++"

alias vi="nvim"
alias vim="nvim"


# Some extra everforst colors.
EF_BLACK=#1B1D21

# $1 - FG Color
# $2 - BG Color
# $3 - msg
prompt_block() {
    echo "%F{$1}%K{$2}$3%k%f"
}

LH_CIRCLE=""
RH_CIRCLE=""

TIME_BG=red
TIME_FG=$EF_BLACK

CWD_BG=blue
CWD_FG=$EF_BLACK

L_BORDER=" $(prompt_block $TIME_BG default $LH_CIRCLE)"
TIME_BLOCK="$(prompt_block $TIME_FG $TIME_BG '%t')"
SEGWAY="$(prompt_block $TIME_BG $CWD_BG $RH_CIRCLE)"
CWD_BLOCK="$(prompt_block $CWD_FG $CWD_BG ' %1d')"
R_BORDER="$(prompt_block $CWD_BG default $RH_CIRCLE)"

TEMP_PROMPT=""
TEMP_PROMPT+=$L_BORDER
TEMP_PROMPT+=$TIME_BLOCK
TEMP_PROMPT+=$SEGWAY
TEMP_PROMPT+=$CWD_BLOCK
TEMP_PROMPT+=$R_BORDER


export PROMPT="$TEMP_PROMPT %B>%b "

# Everforest colors 
# (Light Red) F5 6C 72
# (Black) 1B 1D 21
