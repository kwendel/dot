# Profile zsh start-up 
zmodload zsh/zprof

# Measure startup time during 10 runs
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Analyse startup time per plugin
function timeplugins() {
    for plugin ($plugins); do
        timer=$(($(gdate +%s%N)/1000000))
        if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
        elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH/plugins/$plugin/$plugin.plugin.zsh
        fi
        now=$(($(gdate +%s%N)/1000000))
        elapsed=$(($now-$timer))
        echo $elapsed":" $plugin
    done
}
