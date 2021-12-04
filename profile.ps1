function Pro {notepad $PROFILE.CurrentUserAllHosts}
function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

Set-Alias -Name vim -Value C:\tools\neovim\Neovim\bin\nvim.exe