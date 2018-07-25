function fish_git
    if test -e .git
        set -l git_branch (git branch 2> /dev/null | grep -e '\*' | cut -d' ' -f2-)
        set -l git_status (git status -s)

        if test -n "$git_status"
            echo (set_color purple) $git_branch(set_color normal)
        else
            echo (set_color green) $git_branch(set_color normal)
        end
    end
end

function fish_bind_mode_indicator
    switch $fish_bind_mode
        case default
            set_color red
        case insert
            set_color normal
        case replace_one
            set_color normal
        case visual
            set_color magenta
    end
    echo ' >'
end

function fish_prompt
    printf '%s%s%s%s%s%s ' (set_color yellow) (prompt_pwd) (set_color $fish_color_cwd) (fish_git) (set_color normal) (fish_bind_mode_indicator)
end
