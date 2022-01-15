function set-title --description 'Change current terminal title' 
  if [ (count $argv) -lt 1 ]
      set -l new_title  (string upper (basename (pwd)))
      echo "No title given using default : $new_title"
      echo "function fish_title; echo \"$new_title\"; end" | source -
  else
      echo "function fish_title; echo \"$argv\"; end" | source -
  end
end
