# Load prompt config
oh-my-posh --init --shell pwsh --config C:\Users\james\Documents\PowerShell\star.omp.json | Invoke-Expression

## Icons
Import-Module -Name Terminal-Icons

## PSRreadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
#Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
# Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
# Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Tab -Function AcceptSuggestion
## Fzf (fuzzy file finder)
# Import-Module PSFzf
#Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChfordReverseHist 'Ctrl+r'

# Undo some alias
Remove-Item alias:rm

# Alias
Set-Alias scp scoop
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias g git

function clone {
  param (
    $gitRepo
  )

  git clone $gitRepo
}

function tig
{
  'C:\Program Files\Git\usr\bin\tig.exe'
}

function less
{
  'C:\Program Files\Git\usr\bin\less.exe'
}

function c
{
  Clear-Host
}

function ll
{
  Get-ChildItem -Force -File
}

function rm {
  param (
    $1
  )
  Remove-Item -Confirm $1
}

function xop
{
  Start-Process .
}

function ..
{
    cd ..
}

# Edit powershell profile
function pconf
{
  $shell_config = [System.IO.Path]::Combine($HOME, "Documents\PowerShell\Microsoft.PowerShell_profile.ps1")
  nvim $shell_config
}

## edit wezterm
function wezconf {
  $wezterm_config = [System.IO.Path]::Combine($HOME, ".wezterm.lua")
  nvim $wezterm_config
}

# edit vim setting
function vconf
{
  $nvim_config = [System.IO.Path]::Combine($HOME, "AppData\Local\nvim\init.lua")
  nvim $nvim_config
}

# edit git config
function gconf
{
  $git_conf = [System.IO.Path]::Combine($HOME, ".gitconfig")
  nvim $git_conf
}

function Compare-Checksum
{
  Param (
    [Parameter(Position=0, Mandatory)][String] $FileHashDir,
    [Parameter(Position=1, Mandatory)][String] $CheckHashDir,
    [Parameter(Position=2)][String] $Algorithm = "SHA256"
  )

  [string] $fileHash = (Get-FileHash $FileHashDir -Algorithm $Algorithm).Hash
  [string] $checkHash = Get-Content $CheckHashDir

  [switch] $result = $fileHash -eq $checkHash

  if (-not $result)
  {
    return Write-Host $result -ForegroundColor Red
  }

  return Write-Host $result -ForegroundColor Green
}

