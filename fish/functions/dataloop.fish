function dlp-token-rc -d "returns the dlp token for env rc"
    python -c "import dtlpy as dl;   dl.setenv(\"rc\");   print(dl.environment()); print(dl.token())"
end
    
function dlp-token-prod -d "returns the dlp token for env prod"
    python -c "import dtlpy as dl;   dl.setenv(\"prod\");   print(dl.environment()); print(dl.token())"
end

# TODO: write the parametric function tha reads all of env


function list-dtlpy  -d "List all the dtly whl files in GCS bucket"
    gsutil ls -l gs://dtlpy/dev/ | sort -k 2 -r
end

function pip-dtlpy  -d "install dtlpy directly from dtlpy gcs bucket TODO NEED DEBUG"
    set -l maj $argv[1]
    set -l minor $argv[2]
    # set -l patch ${3:-0}  (set -q $argv[3] || set)
    set -l patch $argv[3]
    # set -q $patch || set -l patch 0  # FIXME $patch is set to '' , to use this pass with -a in def
    test "$patch" != "" || set -l patch 0

    set -l whl_path "https://storage.googleapis.com/dtlpy/dev/dtlpy-$maj.$minor.$patch-py3-none-any.whl"
    echo -e "installing from whell version $maj.$minor.$patch"
    python -m pip install $whl_path --upgrade

    echo -e "\n installed version $maj.$minor.$patch"
    echo -e "COMMAND: 'python -m pip install $whl_path --upgrde'"
end


function fonda-setup -d "cd to FONDA and setup"
    pushd ~/dlp/fonda; .
    . setup/setenv.fish
    # $argv
end

function wheel-roberto -d "creates a new roberto whell to use"
    # TODO: add a sed funciton to replace the version if given
    python3 /home/shefi/dlp_ws/dtlpy/setup.py.roberto sdist bdist_wheel
end


function howto -d "open How To files for read or edit" -a fl
    if test "$fl" = '*.md'
        typora "$HOME/HowTos/$fl"
    else
        less "$HOME/HowTos/$fl"
    end
end
