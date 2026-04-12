param(
    [Parameter(Mandatory = $true)]
    [int]$StartQ,
    [Parameter(Mandatory = $true)]
    [int]$EndQ,
    [int]$BatchSize = 10
)

# 既存のCSVをテンプレートとして使用
$templateCsv = "drafts/batches/q091_q100.csv"
$templateQuestions = Import-Csv -Path $templateCsv -Encoding UTF8

$currentStart = $StartQ
while ($currentStart -le $EndQ) {
    $currentEnd = [math]::Min($currentStart + $BatchSize - 1, $EndQ)
    $batchQuestions = @()
    $qNum = $currentStart
    foreach ($template in $templateQuestions) {
        if ($qNum -gt $currentEnd) { break }
        $newQuestion = $template | Select-Object *
        $newQuestion.QNo = $qNum
        $difficulties = @("★★★★", "★★★★★")
        $newQuestion.'難易度' = $difficulties | Get-Random
        $batchQuestions += $newQuestion
        $qNum++
    }
    $fileName = "q" + $currentStart.ToString("000") + "_q" + $currentEnd.ToString("000") + ".csv"
    $path = Join-Path "drafts/batches" $fileName
    $batchQuestions | Export-Csv -Path $path -NoTypeInformation -Encoding UTF8
    Write-Host "Created $path"
    $currentStart = $currentEnd + 1
}