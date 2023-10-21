# Prompt
## Install-Module posh-git -Scope CurrentUser -Force ## use in terminal
Import-Module posh-git
Import-Module z

## Load prompt config
oh-my-posh init pwsh --config 'C:/Users/james/.config/powershell/star.omp.json' | Invoke-Expression

## Icons
## Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Import-Module -Name Terminal-Icons

## PSRreadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

## Fzf (fuzzy file finder)
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChfordReverseHist 'Ctrl+r'

# Alias
# Remove-Alias -Name gl -Force
Set-Alias vim nvim
Set-Alias scp scoop
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# System aliases
function ll
{
  Get-ChildItem -Force -File 
}
function rm
{
  Remove-Item -confirm 
}
function cp
{
  Copy-Item
}
function c
{
  Clear-Host
}
function rfresh
{
  . $PROFILE
}

# Root
$ROOT = "C:\Users\james"

# Edit profile
function pconf
{
  $POWERSHELLCONFIG = $ROOT + "\.config\PowerShell\user_profile.ps1"
  vim $POWERSHELLCONFIG
}

# edit vim setting
function vconf
{
  $VIMCONFIG = $ROOT + "\AppData\Local\nvim\init.lua"
  vim $VIMCONFIG
}

# edit git config
function gconf
{
  $GITCONF = $ROOT + "\.gitconfig"
  vim $GITCONF
}
# find files in all childrend directories
function find($fileName)
{
  Get-ChildItem -Filter $fileName -Recurse -File
}

# Git aliases
Set-Alias g git
function gs
{
  git status
}
function clone($repo)
{
  git clone $repo
}

function gco($branchName)
{
  git checkout $branchName
}

function gcob($branchName)
{
  git checkout -b $branchName
}

function gd
{
  git diff
}
function fetch
{
  git fetch
}

function gcm($message)
{
  git commit -m $message
}

function gp
{
  git push
}
function gpo
{
  git push origin
}
function gpl
{
  git pull
}
function gplo
{
  git pull origin
}
function tag
{
  git tag
}
function newtag
{
  git tag -a
}
function gl
{
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit 
}

# Run as admin
function Start-PSAdmin
{
  Start-Process PowerShell -Verb RunAs
}
Set-Alias psAdmin Start-PSAdmin

# Utilities
function which ($command)
{
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


