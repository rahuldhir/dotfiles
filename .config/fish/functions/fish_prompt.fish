function fish_git
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
        set -l git_branch (git branch 2> /dev/null | grep -e '\*' | cut -d' ' -f2-)
        set -l git_status (git status -s)

        if test -n "$git_status"
            echo (set_color purple)$git_branch(set_color normal)
        else
            echo (set_color green)$git_branch(set_color normal)
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
    echo '>'
end

function fish_prompt
    if type -q kubectl && kubectl config current-context > /dev/null 2>&1
        set cluster (echo (string split _ (kubectl config current-context))[-1])
        set ns (kubectl config view --minify -o 'jsonpath={..namespace}' 2>/dev/null)
        printf '%s:%s\n' (set_color blue)(echo $cluster) (set_color grey)(echo $ns)
    end
    printf '%s %s %s ' (set_color yellow)(prompt_pwd) (set_color $fish_color_cwd)(fish_git) (set_color normal)(fish_bind_mode_indicator)
end
