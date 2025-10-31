cat > start.ps1 << 'EOF'
# Optional: Konfiguration laden, wenn vorhanden
if (Test-Path ".\config.env") {
  Get-Content .\config.env | ForEach-Object {
    if ($_ -notmatch "^\s*#" -and $_.Trim() -ne "") {
      $kv = $_.Split("=",2)
      [Environment]::SetEnvironmentVariable($kv[0], $kv[1], "Process")
    }
  }
}
.\bin\app.exe
EOF
