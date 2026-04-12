$files = Get-ChildItem "drafts/batches/q101_q*.csv"
foreach ($file in $files) {
    $content = Import-Csv -Path $file.FullName -Encoding UTF8
    foreach ($row in $content) {
        if ($row.'難易度' -eq '★★★') {
            $row.'難易度' = (Get-Random -InputObject @('★★★★', '★★★★★'))
        }
    }
    $content | Export-Csv -Path $file.FullName -NoTypeInformation -Encoding UTF8
}