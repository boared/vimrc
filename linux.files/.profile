################################################################################
###                             Profile for ZSH                              ###
################################################################################

########################################
##       Fuzzy-finder them all        ##
########################################

# Fuzzy finder for history
function hf() {
    local cmd=`history | fzf --scheme=history --tac --tiebreak=begin | awk '{sub(/^[ \t]+/, ""); sub(/^[0-9]+  /, ""); print}'`
    echo -n $cmd | xclip -selection clipboard
    echo "'$cmd' copied to the clipboard"
}
