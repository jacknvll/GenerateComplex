function Generate-Complex {
    [CmdletBinding()]
    [Alias('gco')]   
    Param
    (
        # Define number of characters to spit out, could use a Switch statement for this one. ParameterSet as well? as it needs minimum 6 characters
        [Parameter(Position=1)] 
        [int]
        $Length=8,

        # Define number of Pins to generate. Could use a Do/While statement
        [Parameter(Position=2)]
        [int]
        $Count=1
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

    for ($j=0;$j -lt $Count;$j++){
        if ($String){Clear-Variable String}
        for ($i=0;$i -lt $Length;$i++) {
            $String += Get-RandChar
        }
        $Loop += $String
    }
    $Password += $Loop

    return $Password
}