Do {
    Clear
    echo "MS SQL SERVER Service Management"
    echo "================================"
    echo "0) Quit"
    echo "1) Start service"
    echo "2) Stop service"
    echo "3) Restart service"
    echo "4) Check service status"

    # Change commenting according to your actual service name. Edit the variable if needs be.
    # $ServiceName = "MSSQLSERVER"
    $ServiceName = "MSSQL`$SQLEXPRESS"

    Do {

    $choice = Read-Host -Prompt "Please enter your choice "

    } While ( -Not ($choice -In 0..4))


    If ( $choice -eq 1) {
        Start-Service $ServiceName
    }
    elseif ($choice -eq 2) {
        Stop-Service $ServiceName
    }
    elseif ($choice -eq 3) {
        Restart-Service $ServiceName
    }
    elseif ($choice -eq 4) {
        Get-Service $ServiceName
    }

    $continue = Read-Host -Prompt "Continue (o/N)"
} While ($continue -eq 'o')