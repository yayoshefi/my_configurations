## Lenguaje Go
set --export GOROOT /usr/local/go
set -gx PATH /usr/local/go/bin $PATH
#set -gx PATH GOROOT/bin $PATH
set --export GOPATH $HOME/GoProjects
set -gx PATH $GOPATH/bin $PATH

## AppEngine para GO
set -gx PATH $HOME/programs/go_appengine $PATH

## Android
set --export JAVA_HOME /usr/local/java/jdk1.7.0_67/
set --export ANDROID $HOME/programs/android-studio
set --export ANDROID_HOME $ANDROID/sdk
set -gx PATH $ANDROID/bin $PATH
set -gx PATH $ANDROID/sdk/platform-tools $PATH

#Gradle
set --export GRADLE_HOME $HOME/programs/gradle-2.3/
set -gx PATH $GRADLE_HOME/bin $PATH

## Configuramos herramientas para Haskell
set -gx PATH $HOME/.cabal/bin $PATH

## Configuramos el editor de texto por defecto 
set -U EDITOR "emacsclient -t"
set -U VISUAL "emacsclient -c -a emacs"

## Configuramos algunos comandos para ejecutar emacs de forma automatica
function emax
    emacsclient -t
end

function semac
    sudo emacs -nw
end

function emacsc
    emacsclient -c -a emacs
end

# Esto es para cambiar el mensaje de inicio  de esta shell
# En este caso uso archey para mostrar los datos del sistema
# y el logo de Ubunut
function fish_greeting
               archey
end
funcsave fish_greeting


function devilstart
    devilspie -a &
end

funcsave devilstart
