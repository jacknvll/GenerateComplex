function Generate-Complex {
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
    $Password = @()
    $Loop = @()
    $Error.Clear()

    function Get-RandChar {
        #Complex Generator
        $lowercase = @('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
        $uppercase = @('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
        $special = @('!','@','#','%','*',',','.','?')
        $numbers = @('0','1','2','3','4','5','6','7','8','9')
        $characters = @($lowercase,$uppercase,$special,$numbers)

        $RandomSet = Get-Random -InputObject $characters
        $RandomFromSet = Get-Random -InputObject $RandomSet
        return $RandomFromSet
    }
    $defaultLength = 8 #DefaultCount = 1, but there is no need to define this.
    $Test1 = if($Length){$True}
    $Test2 = if ($Count){$True}

    switch ($True){
        {$Test1 -and $Test2} {   #"Length and Count Provided"
            for ($j=0;$j -lt $Count;$j++){
                if ($String){Clear-Variable String}
                    for ($i=0;$i -lt $Length;$i++) {
                        $String += Get-RandChar
                    }
                $Loop += $String
            }
            $Password += $Loop
        }
        {!$Test1 -and !$Test2} { #"Use default Length and Count"
            for ($i=0;$i -lt $defaultLength;$i++) {
                $String += Get-RandChar  
            }
            $Password +=$String
        }
        {$Test1 -and !$Test2} {  #"Length Provided, Use Default Count"
            for ($i=0;$i -lt $Length;$i++) {
                $String += Get-RandChar  
            }
            $Password +=$String
        }
        {$Test2 -and !$Test1} {  #"Count Provided, Use Default Length"
            for ($j=0;$j -lt $Count;$j++){
                if ($String){Clear-Variable String}
                    for ($i=0;$i -lt $defaultLength;$i++) {
                        $String += Get-RandChar
                    }
                $Loop += $String
            }
            $Password += $Loop
        }
    }    
    return $Password
}