param(
    [Parameter(Mandatory = $true)]
    [string]$CsvPath,
    [Parameter(Mandatory = $true)]
    [string]$OutputPath,
    [string]$TemplatePath = "data/excel/reviewed/Agile_Q1_10.xlsx",
    [string]$SheetName = "Agile_Q"
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Escape-Xml([string]$text) {
    return [System.Security.SecurityElement]::Escape($text)
}

function Get-ColumnName([int]$number) {
    $name = ""
    while ($number -gt 0) {
        $number--
        $name = [char](65 + ($number % 26)) + $name
        $number = [math]::Floor($number / 26)
    }
    return $name
}

$headers = @("QNo","問題文","A","B","C","D","正解","解説","ひっかけ","ドメイン","難易度")
$rows = Import-Csv -Path $CsvPath
if ($rows.Count -ne 10) {
    throw "CSV must contain exactly 10 questions."
}

$templateFull = Resolve-Path $TemplatePath
$csvFull = Resolve-Path $CsvPath
$outputFull = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $OutputPath))

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("exam_xlsx_" + [guid]::NewGuid().ToString("N"))
$zipPath = Join-Path ([System.IO.Path]::GetTempPath()) ("exam_xlsx_" + [guid]::NewGuid().ToString("N") + ".zip")

[System.IO.Compression.ZipFile]::ExtractToDirectory($templateFull, $tempRoot)

$strings = New-Object System.Collections.Generic.List[string]
$index = @{}

function Add-SharedString([string]$value) {
    if (-not $index.ContainsKey($value)) {
        $index[$value] = $strings.Count
        $strings.Add($value)
    }
    return $index[$value]
}

foreach ($header in $headers) {
    [void](Add-SharedString $header)
}

foreach ($row in $rows) {
    foreach ($field in @("問題文","A","B","C","D","正解","解説","ひっかけ","ドメイン","難易度")) {
        [void](Add-SharedString ([string]$row.$field))
    }
}

$sst = New-Object System.Text.StringBuilder
[void]$sst.AppendLine('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
[void]$sst.AppendLine('<sst xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" count="111" uniqueCount="' + $strings.Count + '">')
foreach ($item in $strings) {
    [void]$sst.AppendLine('<si><t xml:space="preserve">' + (Escape-Xml $item) + '</t></si>')
}
[void]$sst.AppendLine('</sst>')
[System.IO.File]::WriteAllText((Join-Path $tempRoot 'xl\sharedStrings.xml'), $sst.ToString(), [System.Text.UTF8Encoding]::new($false))

$sheet = New-Object System.Text.StringBuilder
[void]$sheet.AppendLine('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
[void]$sheet.AppendLine('<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:xdr="http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing" xmlns:x14="http://schemas.microsoft.com/office/spreadsheetml/2009/9/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006">')
[void]$sheet.AppendLine('<sheetPr filterMode="false"><pageSetUpPr fitToPage="false"/></sheetPr>')
[void]$sheet.AppendLine('<dimension ref="A1:K11"/>')
[void]$sheet.AppendLine('<sheetViews><sheetView showFormulas="false" showGridLines="true" showRowColHeaders="true" showZeros="true" rightToLeft="false" tabSelected="true" showOutlineSymbols="true" defaultGridColor="true" view="normal" topLeftCell="C1" colorId="64" zoomScale="100" zoomScaleNormal="100" zoomScalePageLayoutView="100" workbookViewId="0"><selection pane="topLeft" activeCell="G4" activeCellId="0" sqref="G4"/></sheetView></sheetViews>')
[void]$sheet.AppendLine('<sheetFormatPr defaultColWidth="8.38671875" defaultRowHeight="15" zeroHeight="false" outlineLevelRow="0" outlineLevelCol="0"></sheetFormatPr>')
[void]$sheet.AppendLine('<cols><col collapsed="false" customWidth="true" hidden="false" outlineLevel="0" max="2" min="2" style="0" width="84.38"/><col collapsed="false" customWidth="true" hidden="false" outlineLevel="0" max="6" min="3" style="0" width="40.38"/><col collapsed="false" customWidth="true" hidden="false" outlineLevel="0" max="7" min="7" style="0" width="8.32"/><col collapsed="false" customWidth="true" hidden="false" outlineLevel="0" max="11" min="8" style="0" width="40.38"/></cols>')
[void]$sheet.AppendLine('<sheetData>')

[void]$sheet.Append('<row r="1" customFormat="false" ht="15" hidden="false" customHeight="false" outlineLevel="0" collapsed="false">')
for ($c = 1; $c -le $headers.Count; $c++) {
    $style = if ($c -in 1,3,4,5,6) { 1 } else { 0 }
    $idx = $index[$headers[$c - 1]]
    [void]$sheet.Append('<c r="' + (Get-ColumnName $c) + '1" s="' + $style + '" t="s"><v>' + $idx + '</v></c>')
}
[void]$sheet.AppendLine('</row>')

for ($i = 0; $i -lt $rows.Count; $i++) {
    $excelRow = $i + 2
    $row = $rows[$i]
    [void]$sheet.Append('<row r="' + $excelRow + '" s="3" customFormat="true" ht="47" hidden="false" customHeight="true" outlineLevel="0" collapsed="false">')
    $qStyle = if ($excelRow -eq 2) { 2 } else { 3 }
    [void]$sheet.Append('<c r="A' + $excelRow + '" s="' + $qStyle + '" t="n"><v>' + $row.QNo + '</v></c>')
    $values = @($row.'問題文',$row.A,$row.B,$row.C,$row.D,$row.'正解',$row.'解説',$row.'ひっかけ',$row.'ドメイン',$row.'難易度')
    for ($offset = 0; $offset -lt $values.Count; $offset++) {
        $colNum = $offset + 2
        $cellRef = (Get-ColumnName $colNum) + $excelRow
        $style = 3
        if ($colNum -eq 7) { $style = 2 }
        if ($excelRow -eq 2 -and $colNum -in 2,7) { $style = 2 }
        $idx = $index[[string]$values[$offset]]
        [void]$sheet.Append('<c r="' + $cellRef + '" s="' + $style + '" t="s"><v>' + $idx + '</v></c>')
    }
    [void]$sheet.AppendLine('</row>')
}

[void]$sheet.AppendLine('</sheetData><printOptions headings="false" gridLines="false" gridLinesSet="true" horizontalCentered="false" verticalCentered="false"/><pageMargins left="0.75" right="0.75" top="1" bottom="1" header="0.511811023622047" footer="0.511811023622047"/><pageSetup paperSize="9" scale="100" fitToWidth="1" fitToHeight="1" pageOrder="downThenOver" orientation="portrait" blackAndWhite="false" draft="false" cellComments="none" horizontalDpi="300" verticalDpi="300" copies="1"/><headerFooter differentFirst="false" differentOddEven="false"><oddHeader></oddHeader><oddFooter></oddFooter></headerFooter></worksheet>')
[System.IO.File]::WriteAllText((Join-Path $tempRoot 'xl\worksheets\sheet1.xml'), $sheet.ToString(), [System.Text.UTF8Encoding]::new($false))

$workbookPath = Join-Path $tempRoot 'xl\workbook.xml'
$workbookXml = Get-Content $workbookPath -Raw
$safeSheetName = if ($SheetName.Length -gt 31) { $SheetName.Substring(0,31) } else { $SheetName }
$workbookXml = [System.Text.RegularExpressions.Regex]::Replace($workbookXml, 'name="[^"]+"', 'name="' + $safeSheetName + '"', 1)
[System.IO.File]::WriteAllText($workbookPath, $workbookXml, [System.Text.UTF8Encoding]::new($false))

if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
$fs = [System.IO.File]::Open($zipPath, [System.IO.FileMode]::Create)
try {
    $archive = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        Get-ChildItem -Path $tempRoot -Recurse -File | ForEach-Object {
            $relative = $_.FullName.Substring($tempRoot.Length + 1).Replace('\', '/')
            $entry = $archive.CreateEntry($relative, [System.IO.Compression.CompressionLevel]::Optimal)
            $inStream = [System.IO.File]::OpenRead($_.FullName)
            $outStream = $entry.Open()
            try { $inStream.CopyTo($outStream) } finally { $outStream.Dispose(); $inStream.Dispose() }
        }
    }
    finally {
        $archive.Dispose()
    }
}
finally {
    $fs.Dispose()
}

$outputDir = Split-Path -Parent $outputFull
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}
if (Test-Path $outputFull) {
    Remove-Item $outputFull -Force
}
Move-Item $zipPath $outputFull
Remove-Item $tempRoot -Recurse -Force
Write-Output "Created $outputFull from $csvFull"
