param(
    [parameter(Mandatory = $false)]
    [string]$License,
    [parameter(Mandatory = $false)]
    [string]$RunnerOs 
)

Write-Output "Testing PowerShell script execution..."

# Check if parameters are provided
if ([string]::IsNullOrWhiteSpace($License)) {
    Write-Output "No License info provided."
} else {
    Write-Output "License info: $License"
}

if ($RunnerOs -eq 'Linux') {
    Write-Output "Running on Linux"
} elseif ($RunnerOs -eq 'Windows') {
    Write-Output "Running on Windows"
} else {
    Write-Output "Unsupported OS: $RunnerOs"
}

# Create a test output file to verify script execution
$testOutput = "test_output.txt"
"Test completed successfully on $(Get-Date)" | Out-File -FilePath $testOutput

# Check if the file was created
if (Test-Path $testOutput) {
    Write-Output "Test output file created successfully: $testOutput"
} else {
    Write-Output "Failed to create the output file."
}

# Exit with success code
exit 0
