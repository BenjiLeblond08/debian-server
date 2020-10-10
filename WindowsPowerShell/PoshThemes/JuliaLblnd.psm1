#requires -Version 2 -Modules posh-git

function Write-Theme {

    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    $user = $sl.CurrentUser
    $computer = $sl.CurrentHostname
    $path += Get-FullPath -dir $pwd
    $time = Get-Date -Format "HH:mm:ss"

    $prompt = Write-Prompt -Object ([char]::ConvertFromUtf32(0x250C)) -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Prompt "[" -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Prompt "$user" -ForegroundColor $sl.Colors.PromptForegroundColor
    $prompt += Write-Prompt "@" -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Prompt "$computer" -ForegroundColor $sl.Colors.PromptForegroundColor
    $prompt += Write-Prompt ":" -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Prompt "$path" -ForegroundColor $sl.Colors.PromptForegroundColor
    $prompt += Write-Prompt "] " -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Segment -content $time -ForegroundColor $sl.Colors.GitForegroundColor

    # Display Git info
    $status = Get-VCSStatus
    if ($status) {
        $branch = $status.Branch
        $prompt += Write-Prompt "[" -ForegroundColor $sl.Colors.PromptSymbolColor
        $prompt += Write-Prompt "$branch" -ForegroundColor $sl.Colors.GitForegroundColor
        if ($status.HasWorking) {
            $prompt += Write-Prompt " *" -ForegroundColor $sl.Colors.PromptSymbolColor
        }
        $prompt += Write-Prompt "] " -ForegroundColor $sl.Colors.PromptSymbolColor
    }

    # Check for elevated prompt
    If (Test-Administrator) {
        $prompt += Write-Segment -content $sl.PromptSymbols.ElevatedSymbol -foregroundColor $sl.Colors.AdminIconForegroundColor
    }

    # Check the last command state and indicate if failed
    If ($lastCommandFailed) {
        $prompt += Write-Segment -content 'x' -foregroundColor $sl.Colors.CommandFailedIconForegroundColor
    }

    # SECOND LINE
    $prompt += Set-Newline
    $prompt += Write-Prompt -Object ([char]::ConvertFromUtf32(0x2514)) -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Prompt -Object '>' -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += ' '
    $prompt
}

function Write-Segment {

    param(
        $content,
        $ForegroundColor
    )

    $prompt += Write-Prompt -Object '[' -ForegroundColor $sl.Colors.PromptSymbolColor
    $prompt += Write-Prompt -Object $content -ForegroundColor $ForegroundColor
    $prompt += Write-Prompt -Object '] ' -ForegroundColor $sl.Colors.PromptSymbolColor
    return $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.Colors.PromptForegroundColor = [ConsoleColor]::White
$sl.Colors.PromptSymbolColor = [ConsoleColor]::DarkRed
$sl.Colors.PromptHighlightColor = [ConsoleColor]::DarkBlue
$sl.Colors.GitForegroundColor = [ConsoleColor]::White
