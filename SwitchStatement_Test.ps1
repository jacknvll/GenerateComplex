#$Value1 = "Parameter1"
$Value2 = "Parameter2"
$Test1 = if($Value1){$True}
$Test2 = if ($Value2){$True}

switch ($True){
    {$Test1 -and $Test2} {Write-Host "Answer1"} #Both Parameters have been given Values
    {!$Test1 -and !$Test2} {Write-Host "Answer2"} #Neither Parameters have been given values
    {$Test1 -and !$Test2} {Write-Host "Answer3"} #Only Parameter1 has been given a value
    {$Test2 -and !$Test1} {Write-Host "Answer4"} #Only Parameter2 has been given a value
}