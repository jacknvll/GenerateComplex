﻿function Generate-Complex {
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Define number of characters to spit out, could use a Switch statement for this one. ParameterSet as well? as it needs minimum 6 characters
        [Parameter(Mandatory=$false)] 
        [int]
        $Length,

        # Define number of Pins to generate. Could use a Do/While statement
        [Parameter(Mandatory=$false)]
        [int]
        $Count
    )
    
    #Complex Generator
    $lowercase = @('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
    $uppercase = @('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
    $special = @('!','@','#','%','*',',','.','?')
    $numbers = @('0','1','2','3','4','5','6','7','8','9')

    $Password = @()
    $Loop = @()
    $Error.Clear()

    $characters = @($lowercase,$uppercase,$special,$numbers)
    $defaultLength = 7
    $defaultCount = 1
<# FOR TESTING PURPOSES:
    for ($i=0;$i -lt $defaultLength;$i++) {
            $RandomSet = Get-Random -InputObject $characters
            $RandomFromSet = Get-Random -InputObject $RandomSet
            $Password += $RandomFromSet   
        }
#>
  
    if (!$Length -and !$Count){ #Use the Default Length=7 and Count=1
        for ($i=0;$i -lt $defaultLength;$i++) {
            $RandomSet = Get-Random -InputObject $characters
            $RandomFromSet = Get-Random -InputObject $RandomSet
            $String += $RandomFromSet   
        }
        $Password +=$String
    } elseif (!$Count) { #Length has been defined, but Count=1
        for ($i=0;$i -lt $Length;$i++) {
            $RandomSet = Get-Random -InputObject $characters
            $RandomFromSet = Get-Random -InputObject $RandomSet
            $String += $RandomFromSet   
        }
        $Password +=$String
    } elseif (!$Length) { #Count has been defined, but Length=7
        for ($j=0;$j -lt $Count;$j++){
            if ($String){Clear-Variable String}
            for ($i=0;$i -lt $defaultLength;$i++) {
                $RandomSet = Get-Random -InputObject $characters
                $RandomFromSet = Get-Random -InputObject $RandomSet
                $String += $RandomFromSet
            }
            $Loop += $String
        }
        $Password += $Loop
    } else { #Both Count and Length have been defined
        for ($j=0;$j -lt $Count;$j++){
            if ($String){Clear-Variable String}
            for ($i=0;$i -lt $Length;$i++) {
                $RandomSet = Get-Random -InputObject $characters
                $RandomFromSet = Get-Random -InputObject $RandomSet
                $String += $RandomFromSet
            }
            $Loop += $String
        }
        $Password += $Loop
    }   
    return $Password
}