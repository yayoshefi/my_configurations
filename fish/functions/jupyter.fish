function jupyter-bg  -d "runs jupyter server in background"
    (jupyter notebook ./ $argv & ) > /dev/null 2>&1
end

function jupyter-colad -d "runs a jupyter server supportive for colab"
    (jupyter notebook  --NotebookApp.allow_origin="https://colab.research.google.com" --port=8989 --NotebookApp.port_retries=0  $argv & ) > /dev/null 2>&1 && jupyter notebook list
end
