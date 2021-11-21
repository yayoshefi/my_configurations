function less --wraps /usr/bin/less -d " opens less with reading ANSI and wrap lines"
    command less -SR $argv
end

function l -d "shorthand for ls"
    less $argv
end
