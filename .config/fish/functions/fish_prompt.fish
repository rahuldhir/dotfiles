function fish_prompt --description 'Write out the prompt'
	if test -z $WINDOW
        printf '%s%s@%s%s%s%s%s' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    else
        printf '%s%s@%s%s%s(%s)%s%s%s' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color white) (echo $WINDOW) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    end
    switch $fish_bind_mode
        case default
            set_color red
        case insert
            set_color green
        case replace_one
            set_color green
        case visual
            set_color magenta
    end
    echo '> '
end
