# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Import-Module z
Set-PoshPrompt star

# Icons
Import-Module -Name Terminal-Icons

# PSRreadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChfordReverseHistory 'Ctrl+r'


# Root
$ROOT = "C:\Users\james"

# Alias
Remove-Alias -Name gl -Force
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
#Set-Alias node 'C:\Users\james\scoop\apps\nodejs-lts\16.13.1\node.exe'

# Edit profile
function pconfig
{
    $PCONF = $ROOT + "\.config\PowerShell\user_profile.ps1"
    vim $PCONF
}

# edit vim setting
function vconfig
{
    $VCONF = $ROOT + "\AppData\Local\nvim\init.vim"
    vim $VCONF
}

function gconfig
{
    $GITCONF = $ROOT + "\.gitconfig"
    vim $GITCONF
}

# System aliases
function ls { ls -Force -File }
function rm { rm -confirm }

# find files in all childrend directories
function find($fileName)
{
    ls -Filter $fileName -Recurse -File
}
Set-Alias ll ls
Set-Alias c clear

# Git aliases
Set-Alias g git
function gs { git status }
function gaa  { git add --all }
function gb { git branch }
function clone($repo) { git clone $repo }

function gco($branchName)
{
    git checkout $branchName
}

function gcob($branchName)
{
    git checkout -b $branchName
}

function gd { git diff }
function fetch { git fetch }

function gc($message)
{
    git commit -m $message
}

function gp { git push }
function gpo { git push origin }
function gpl { git pull }
function gplo { git pull origin}
function tag  { git tag }
function newtag { git tag -a }
function gl { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit }


# Run as admin
function Start-PSAdmin {Start-Process PowerShell -Verb RunAs}
Set-Alias psAdmin Start-PSAdmin

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
