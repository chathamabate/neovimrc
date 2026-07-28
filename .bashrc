
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
