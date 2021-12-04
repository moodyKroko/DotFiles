function Pro {notepad $PROFILE.CurrentUserAllHosts}
function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

function vim { nvim }

Invoke-Expression (&starship init powershell)