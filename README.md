<p align="center">
<img src="https://github.com/Chainski/Lifetime-Amsi-EtwPatch/assets/96607632/1933768a-15b8-4f32-808c-8ebc49a82680", width="800", height="800">
</p>

<h1 align="center">Lifetime AMSI+ETW Patch</h1>

This nim program applies a lifetime patch to PowerShell to disable ETW (Event Tracing for Windows) and AMSI (Antimalware Scan Interface) protections.

### Overview
The program modifies the PowerShell profile (`Microsoft.PowerShell_profile.ps1`) to apply two patches:

1. **AMSI Patch**: Disables AMSI by modifying the `AmsiScanBuffer` function, ```{ 0x31, 0xC0, 0xC3 }```.
2. **ETW Patch**: Modifies the `EtwEventWrite` function in `ntdll.dll` to prevent event tracing, ```{ 0xC3 }```.
3. Sets File attributes Hidden and System to : `Microsoft.PowerShell_profile.ps1`.


### Before
![before](https://github.com/Chainski/Lifetime-Amsi-EtwPatch/assets/96607632/0de546cf-5f0a-46a0-b7f8-25fd07d688a8)


### After
![after](https://github.com/Chainski/Lifetime-Amsi-EtwPatch/assets/96607632/7ce8fe7a-4cf0-4dc1-948b-e60133bc250f)


**Effect: Once applied, PowerShell sessions initiated afterward will have AMSI and ETW bypassed.**


### Can this be removed ? 
Run the powershell command below as admin to remove it 

```ps1
$file = "$env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $file) { Remove-Item $file -Force } 
```

### Disclaimer
I, the creator, am not responsible for any actions, and or damages, caused by this software. You bear the full responsibility of your actions and acknowledge that this tool was created for educational purposes only. This tool's main purpose is NOT to be used maliciously, or on any system that you do not own, or have the right to use. By using this software, you automatically agree to the above.

### Credits
- https://github.com/EvilBytecode
