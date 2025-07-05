# theme
oh-my-posh init pwsh --config ~/ys.omp.json | Invoke-Expression
# prediction source from history
Set-PSReadLineOption -PredictionSource History
# up arrow to search history backward
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
# down arrow to search history forward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# fnm
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
