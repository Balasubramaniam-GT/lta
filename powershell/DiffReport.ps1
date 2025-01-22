$output = &"C:\LemonTree-Automation\LTA\LemonTree.Automation.exe" diff --theirs C:\LemonTree-Automation\Lemon-test\E.qea --mine C:\LemonTree-Automation\Lemon-test\D.qea

$diffResult = ""
ForEach ($line in $($output -split "`r`n"))
{
    if ($line.EndsWith("potentially different elements."))
    {
        #ignore
    }
    elseif ($line.EndsWith(" different elements."))
    {
        Echo $Line
        $diffResult += $line
        $diffResult += "`r`n"
    }
    elseif ($line.StartsWith("Found conflicts:"))
    {
        if ($line.StartsWith("Found conflicts: 0"))
        {
            #ignore if there is 0 conflicts
        }
        else
        {
            Echo $Line
            $diffResult += $line
            $diffResult += "`r`n"
        }

    }

}

Echo "Results:`r`n $diffresult"