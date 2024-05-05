###
# GET SERVICES WITH UNQUOTED PATHS
###
Get-CimInstance win32_service | where PathName -notlike "" | where { $_.PathName.StartsWith('"') -eq $false }| select @{e={$_.PathName.split(" ")[0]};n="FirstPath"},PathName | where { $_.FirstPath.EndsWith(".exe") -eq $false } 