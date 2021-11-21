function clear  --wraps='/usr/clear' -d "nice clear with spark"
    /bin/clear $argv;
    echo;
    seq 1 (tput cols) | sort -R | spark | lolcat;
    return 0
end

