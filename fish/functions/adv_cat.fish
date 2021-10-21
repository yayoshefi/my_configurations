# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln  -d "output the `n` column from input"
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index  -d "outputs the `n` row from input"
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n  -d "like head -v, ignores the first `n` lines"
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number  -d "same as head"
    head -$number
end
