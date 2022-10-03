<#
    ·▄▄ ·  ▐ ▄ ▪   ▄▄· ▄ •▄ ▄▄▄ .▄▄▄  .▄▄ ·    ▐▄▄    ▄▄    ▄▄▌
    ▐█ ▀. •█▌▐███ ▐█ ▌▪█▌▄▌▪▀▄.▀·▀▄ █·▐█ ▀.    ▐███▄ ████ ▄███▌ 
    ▄▀▀▀█▄▐█▐▐▌▐█·██ ▄▄▐▀▀▄·▐▀▀▪▄▐▀▀▄ ▄▀▀▀█▄   ▐██████████████▌ 
    ▐█▄▪▐███▐█▌▐█▌▐███▌▐█.█▌▐█▄▄▌▐█•█▌▐█▄▪▐█   ▐███▀ ████ ▀███▌
     ▀▀▀▀ ▀▀ █▪▀▀▀·▀▀▀ ·▀  ▀ ▀▀▀ .▀  ▀ ▀▀▀▀    ▐▀▀    ▀▀    ▀▀▌ 
                            by:
                https://github.com/zoeeechu

#>

function titleStuff{
#Text artttt *sparkle sparkle*
$asciiArt = @"
  _____ ____   ____   __  __  _    ___  ____    _____
 / ___/|    \ |    | /  ]|  |/ ]  /  _]|    \  / ___/  ||   ____   ||  
(   \_ |  _  | |  | /  / |  ' /  /  [_ |  D  )(   \_   | ] |  . | [ | 
 \__  ||  |  | |  |/  /  |    \ |    _]|    /  \__  |  |  |   |  |  | 
 /  \ ||  |  | |  /   \_ |     \|   [_ |    \  /  \ |  |  |   |  |  | 
 \    ||  |  | |  \     ||  .  ||     ||  .  \ \    |  | ] |  ' | [ | 
  \___||__|__||____\____||__|\_||_____||__|\_|  \___|  ||   ||||   ||
               ____   __ __      _____   ___     ___ 
              |    \ |  |  |    |     | /   \   /  _]
              |  o  )|  |  |    |__/  ||     | /  [_ 
              |     ||  ~  |    |   __||  O  ||    _]
              |  O  ||___, |    |  /  ||     ||   [_ 
              |     ||     |    |     ||     ||     |
              |_____||____/     |_____| \___/ |_____|
                    
"@

Write-Output "$asciiArt";

Write-Host "                    Put your computer on drugs" -ForegroundColor Yellow;
Write-Host "               All errors can be safely Ignored :>" -ForegroundColor Red;
Write-Host "___________________________________________________________________________ " -ForegroundColor Yellow;
Write-Host " " -ForegroundColor Yellow;
}

function start-script{
#makesure we can use XML    
Add-Type -AssemblyName PresentationCore, PresentationFramework
Add-Type -AssemblyName WindowsBase

titleStuff

#refrence xaml
[xml]$xaml = @'
    
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
Title="MainWindow" Height="450" Width="800" ResizeMode="NoResize">
<Grid>
<Image Margin="0,-6,-10,-16" Source="https://github.com/zoeeechu/Snickers/blob/main/bg.png?raw=true" Stretch="Fill"/>
<Image Name="logo" Margin="264,28,264,184" Source="https://github.com/zoeeechu/Snickers/blob/main/snickers.png?raw=true" Stretch="Fill"/>
<CheckBox Name="Desktop" Content="Desktop" HorizontalAlignment="Left" Height="31" Margin="318,320,0,0" VerticalAlignment="Top" Width="78" FontSize="14" FontWeight="Bold"/>
<CheckBox Name="Laptop" Content="Laptop" HorizontalAlignment="Left" Height="31" Margin="402,321,0,0" VerticalAlignment="Top" Width="78" FontSize="14" FontWeight="Bold"/>
<TextBlock HorizontalAlignment="Center" Margin="0,269,0,0" TextWrapping="Wrap" Text="Select your machine type" VerticalAlignment="Top" FontSize="24" FontFamily="Arial Black"/>
<Button Name="button" Content="GO!" HorizontalAlignment="Center" Margin="0,363,0,0" VerticalAlignment="Top" Height="26" Width="84" FontSize="16" FontWeight="Bold"/>
<Ellipse HorizontalAlignment="Left" Height="48" Margin="717,245,0,0" VerticalAlignment="Top" Width="46" StrokeThickness="0" RenderTransformOrigin="0.094,-0.21">
<Ellipse.Fill>
    <ImageBrush ImageSource="https://avatars.githubusercontent.com/u/43968711?v=4"/>
</Ellipse.Fill>
</Ellipse>

<TextBlock HorizontalAlignment="Right" Margin="0,297,16,0" TextWrapping="Wrap" Text="https://github.com/zoeeechu" VerticalAlignment="Top" FontSize="11" FontFamily="Arial Black" Width="170" Height="19"/>
<TextBlock HorizontalAlignment="Right" Margin="0,320,9,0" TextWrapping="Wrap" VerticalAlignment="Top" FontSize="11" FontFamily="Arial Black" Width="184" Height="78" Text="I am not responsible for any damage done to your system run this at your own risk and MAKE SURE to read all information about this tool beforehand" TextAlignment="Center" Foreground="#FF9A0000"/>



</Grid>
</Window>
'@



#Load in xaml
$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
$Form=[Windows.Markup.XamlReader]::Load( $reader )

#load stuffs
$button = $Form.FindName('button')
$Desktop = $Form.FindName('Desktop')
$Laptop = $Form.FindName('Laptop')

#what happens when stuffs
$button.Add_Click({


  #Check which option is checked and throw if both are checked
    if ($Laptop.IsChecked-eq $true -And $Desktop.IsChecked -eq $true) {
        Write-Host "ERROR: You cant select multiple silly goose!" -ForegroundColor Red;
        $Desktop.IsChecked= $false
        $Laptop.IsChecked= $false
    }else{
        If ($Desktop.IsChecked -eq $true)
        {
            Write-Host "Creating Restore Point in case something bad happens"
            Enable-ComputerRestore -Drive "$env:SystemDrive"
            Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"   

            RunDesktop
            RunDefaults
        } elseif ($Laptop.IsChecked -eq $true) {

            Write-Host "Creating Restore Point in case something bad happens"
            Enable-ComputerRestore -Drive "$env:SystemDrive"
            Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"   

            RunLaptop
            RunDefaults
        } else {
            Write-Host "ERROR: No option is selected" -ForegroundColor Red;
        }
    }

})


#Show Form
$Form.ShowDialog() | out-null 

}


#Source: 
#https://github.com/ChrisTitusTech/winutil/blob/main/winutil.ps1
function RunDesktop{

    Write-Host "Disabling Activity History..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
    
    If (!(Test-Path "HKCU:\System\GameConfigStore")) {
        New-Item -Path "HKCU:\System\GameConfigStore" -Force
    }
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Type DWord -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Type DWord -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_EFSEFeatureFlags" -Type DWord -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0 -Force

    Write-Host "Disabling Hibernation..."
        Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernateEnabled" -Type Dword -Value 0
        If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
        }
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 0

        If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0

        Write-Host "Running O&O Shutup with Recommended Settings"
        curl.exe -ss "https://raw.githubusercontent.com/ChrisTitusTech/win10script/master/ooshutup10.cfg" -o ooshutup10.cfg
        curl.exe -ss "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -o OOSU10.exe
        ./OOSU10.exe ooshutup10.cfg /quiet

 # Set Services to Manual 

 $services = @(
    "ALG"                                          # Application Layer Gateway Service(Provides support for 3rd party protocol plug-ins for Internet Connection Sharing)
    "AJRouter"                                     # Needed for AllJoyn Router Service
    "BcastDVRUserService_48486de"                  # GameDVR and Broadcast is used for Game Recordings and Live Broadcasts
    #"BDESVC"                                      # Bitlocker Drive Encryption Service
    #"BFE"                                         # Base Filtering Engine (Manages Firewall and Internet Protocol security)
    #"BluetoothUserService_48486de"                # Bluetooth user service supports proper functionality of Bluetooth features relevant to each user session.
    #"BrokerInfrastructure"                        # Windows Infrastructure Service (Controls which background tasks can run on the system)
    "Browser"                                      # Let users browse and locate shared resources in neighboring computers
    "BthAvctpSvc"                                  # AVCTP service (needed for Bluetooth Audio Devices or Wireless Headphones)
    "CaptureService_48486de"                       # Optional screen capture functionality for applications that call the Windows.Graphics.Capture API.
    "cbdhsvc_48486de"                              # Clipboard Service
    "diagnosticshub.standardcollector.service"     # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                    # Diagnostics Tracking Service
    "dmwappushservice"                             # WAP Push Message Routing Service
    "DPS"                                          # Diagnostic Policy Service (Detects and Troubleshoots Potential Problems)
    "edgeupdate"                                   # Edge Update Service
    "edgeupdatem"                                  # Another Update Service
    #"EntAppSvc"                                    # Enterprise Application Management.
    "Fax"                                          # Fax Service
    "fhsvc"                                        # Fax History
    "FontCache"                                    # Windows font cache
    #"FrameServer"                                 # Windows Camera Frame Server (Allows multiple clients to access video frames from camera devices)
    "gupdate"                                      # Google Update
    "gupdatem"                                     # Another Google Update Service
    "iphlpsvc"                                     # ipv6(Most websites use ipv4 instead)
    "lfsvc"                                        # Geolocation Service
    #"LicenseManager"                              # Disable LicenseManager (Windows Store may not work properly)
    "lmhosts"                                      # TCP/IP NetBIOS Helper
    "MapsBroker"                                   # Downloaded Maps Manager
    "MicrosoftEdgeElevationService"                # Another Edge Update Service
    "MSDTC"                                        # Distributed Transaction Coordinator
    "NahimicService"                               # Nahimic Service
    #"ndu"                                          # Windows Network Data Usage Monitor (Disabling Breaks Task Manager Per-Process Network Monitoring)
    "NetTcpPortSharing"                            # Net.Tcp Port Sharing Service
    "PcaSvc"                                       # Program Compatibility Assistant Service
    "PerfHost"                                     # Remote users and 64-bit processes to query performance.
    "PhoneSvc"                                     # Phone Service(Manages the telephony state on the device)
    #"PNRPsvc"                                     # Peer Name Resolution Protocol (Some peer-to-peer and collaborative applications, such as Remote Assistance, may not function, Discord will still work)
    #"p2psvc"                                      # Peer Name Resolution Protocol(Enables multi-party communication using Peer-to-Peer Grouping.  If disabled, some applications, such as HomeGroup, may not function. Discord will still work)iscord will still work)
    #"p2pimsvc"                                    # Peer Networking Identity Manager (Peer-to-Peer Grouping services may not function, and some applications, such as HomeGroup and Remote Assistance, may not function correctly. Discord will still work)
    "PrintNotify"                                  # Windows printer notifications and extentions
    "QWAVE"                                        # Quality Windows Audio Video Experience (audio and video might sound worse)
    "RemoteAccess"                                 # Routing and Remote Access
    "RemoteRegistry"                               # Remote Registry
    "RetailDemo"                                   # Demo Mode for Store Display
    "RtkBtManServ"                                 # Realtek Bluetooth Device Manager Service
    "SCardSvr"                                     # Windows Smart Card Service
    "seclogon"                                     # Secondary Logon (Disables other credentials only password will work)
    "SEMgrSvc"                                     # Payments and NFC/SE Manager (Manages payments and Near Field Communication (NFC) based secure elements)
    "SharedAccess"                                 # Internet Connection Sharing (ICS)
    #"Spooler"                                     # Printing
    "stisvc"                                       # Windows Image Acquisition (WIA)
    #"StorSvc"                                     # StorSvc (usb external hard drive will not be reconized by windows)
    "SysMain"                                      # Analyses System Usage and Improves Performance
    "TrkWks"                                       # Distributed Link Tracking Client
    #"WbioSrvc"                                    # Windows Biometric Service (required for Fingerprint reader / facial detection)
    "WerSvc"                                       # Windows error reporting
    "wisvc"                                        # Windows Insider program(Windows Insider will not work if Disabled)
    #"WlanSvc"                                     # WLAN AutoConfig
    "WMPNetworkSvc"                                # Windows Media Player Network Sharing Service
    "WpcMonSvc"                                    # Parental Controls
    "WPDBusEnum"                                   # Portable Device Enumerator Service
    "WpnService"                                   # WpnService (Push Notifications may not work)
    #"wscsvc"                                      # Windows Security Center Service
    "WSearch"                                      # Windows Search
    "XblAuthManager"                               # Xbox Live Auth Manager (Disabling Breaks Xbox Live Games)
    "XblGameSave"                                  # Xbox Live Game Save Service (Disabling Breaks Xbox Live Games)
    "XboxNetApiSvc"                                # Xbox Live Networking Service (Disabling Breaks Xbox Live Games)
    "XboxGipSvc"                                   # Xbox Accessory Management Service
    # Hp services
    "HPAppHelperCap"
    "HPDiagsCap"
    "HPNetworkCap"
    "HPSysInfoCap"
    "HpTouchpointAnalyticsService"
    # Hyper-V services
    "HvHost"
    "vmicguestinterface"
    "vmicheartbeat"
    "vmickvpexchange"
    "vmicrdv"
    "vmicshutdown"
    "vmictimesync"
    "vmicvmsession"
    # Services that cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist

    Write-Host "Setting $service StartupType to Manual"
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Manual
}

Write-Host "Disabling Storage Sense..."
Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue

Write-Host "Disabling Wi-Fi Sense..."
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0

If (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling") {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Type DWord -Value 00000001
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Type DWord -Value 0000000

Write-Host "Enabling NumLock after startup..."
If (!(Test-Path "HKU:")) {
    New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
}
Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2


}

function RunLaptop{

    Write-Host "Disabling Activity History..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0

    If (!(Test-Path "HKCU:\System\GameConfigStore")) {
        New-Item -Path "HKCU:\System\GameConfigStore" -Force
    }
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Type DWord -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Type DWord -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_EFSEFeatureFlags" -Type DWord -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0 -Force

    If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0

    Write-Host "Running O&O Shutup with Recommended Settings"
        curl.exe -ss "https://raw.githubusercontent.com/ChrisTitusTech/win10script/master/ooshutup10.cfg" -o ooshutup10.cfg
        curl.exe -ss "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -o OOSU10.exe
        ./OOSU10.exe ooshutup10.cfg /quiet

 # Set Services to Manual 

 $services = @(
    "ALG"                                          # Application Layer Gateway Service(Provides support for 3rd party protocol plug-ins for Internet Connection Sharing)
    "AJRouter"                                     # Needed for AllJoyn Router Service
    "BcastDVRUserService_48486de"                  # GameDVR and Broadcast is used for Game Recordings and Live Broadcasts
    #"BDESVC"                                      # Bitlocker Drive Encryption Service
    #"BFE"                                         # Base Filtering Engine (Manages Firewall and Internet Protocol security)
    #"BluetoothUserService_48486de"                # Bluetooth user service supports proper functionality of Bluetooth features relevant to each user session.
    #"BrokerInfrastructure"                        # Windows Infrastructure Service (Controls which background tasks can run on the system)
    "Browser"                                      # Let users browse and locate shared resources in neighboring computers
    "BthAvctpSvc"                                  # AVCTP service (needed for Bluetooth Audio Devices or Wireless Headphones)
    "CaptureService_48486de"                       # Optional screen capture functionality for applications that call the Windows.Graphics.Capture API.
    "cbdhsvc_48486de"                              # Clipboard Service
    "diagnosticshub.standardcollector.service"     # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                    # Diagnostics Tracking Service
    "dmwappushservice"                             # WAP Push Message Routing Service
    "DPS"                                          # Diagnostic Policy Service (Detects and Troubleshoots Potential Problems)
    "edgeupdate"                                   # Edge Update Service
    "edgeupdatem"                                  # Another Update Service
    #"EntAppSvc"                                    # Enterprise Application Management.
    "Fax"                                          # Fax Service
    "fhsvc"                                        # Fax History
    "FontCache"                                    # Windows font cache
    #"FrameServer"                                 # Windows Camera Frame Server (Allows multiple clients to access video frames from camera devices)
    "gupdate"                                      # Google Update
    "gupdatem"                                     # Another Google Update Service
    "iphlpsvc"                                     # ipv6(Most websites use ipv4 instead)
    "lfsvc"                                        # Geolocation Service
    #"LicenseManager"                              # Disable LicenseManager (Windows Store may not work properly)
    "lmhosts"                                      # TCP/IP NetBIOS Helper
    "MapsBroker"                                   # Downloaded Maps Manager
    "MicrosoftEdgeElevationService"                # Another Edge Update Service
    "MSDTC"                                        # Distributed Transaction Coordinator
    "NahimicService"                               # Nahimic Service
    #"ndu"                                          # Windows Network Data Usage Monitor (Disabling Breaks Task Manager Per-Process Network Monitoring)
    "NetTcpPortSharing"                            # Net.Tcp Port Sharing Service
    "PcaSvc"                                       # Program Compatibility Assistant Service
    "PerfHost"                                     # Remote users and 64-bit processes to query performance.
    "PhoneSvc"                                     # Phone Service(Manages the telephony state on the device)
    #"PNRPsvc"                                     # Peer Name Resolution Protocol (Some peer-to-peer and collaborative applications, such as Remote Assistance, may not function, Discord will still work)
    #"p2psvc"                                      # Peer Name Resolution Protocol(Enables multi-party communication using Peer-to-Peer Grouping.  If disabled, some applications, such as HomeGroup, may not function. Discord will still work)iscord will still work)
    #"p2pimsvc"                                    # Peer Networking Identity Manager (Peer-to-Peer Grouping services may not function, and some applications, such as HomeGroup and Remote Assistance, may not function correctly. Discord will still work)
    "PrintNotify"                                  # Windows printer notifications and extentions
    "QWAVE"                                        # Quality Windows Audio Video Experience (audio and video might sound worse)
    "RemoteAccess"                                 # Routing and Remote Access
    "RemoteRegistry"                               # Remote Registry
    "RetailDemo"                                   # Demo Mode for Store Display
    "RtkBtManServ"                                 # Realtek Bluetooth Device Manager Service
    "SCardSvr"                                     # Windows Smart Card Service
    "seclogon"                                     # Secondary Logon (Disables other credentials only password will work)
    "SEMgrSvc"                                     # Payments and NFC/SE Manager (Manages payments and Near Field Communication (NFC) based secure elements)
    "SharedAccess"                                 # Internet Connection Sharing (ICS)
    #"Spooler"                                     # Printing
    "stisvc"                                       # Windows Image Acquisition (WIA)
    #"StorSvc"                                     # StorSvc (usb external hard drive will not be reconized by windows)
    "SysMain"                                      # Analyses System Usage and Improves Performance
    "TrkWks"                                       # Distributed Link Tracking Client
    #"WbioSrvc"                                    # Windows Biometric Service (required for Fingerprint reader / facial detection)
    "WerSvc"                                       # Windows error reporting
    "wisvc"                                        # Windows Insider program(Windows Insider will not work if Disabled)
    #"WlanSvc"                                     # WLAN AutoConfig
    "WMPNetworkSvc"                                # Windows Media Player Network Sharing Service
    "WpcMonSvc"                                    # Parental Controls
    "WPDBusEnum"                                   # Portable Device Enumerator Service
    "WpnService"                                   # WpnService (Push Notifications may not work)
    #"wscsvc"                                      # Windows Security Center Service
    "WSearch"                                      # Windows Search
    "XblAuthManager"                               # Xbox Live Auth Manager (Disabling Breaks Xbox Live Games)
    "XblGameSave"                                  # Xbox Live Game Save Service (Disabling Breaks Xbox Live Games)
    "XboxNetApiSvc"                                # Xbox Live Networking Service (Disabling Breaks Xbox Live Games)
    "XboxGipSvc"                                   # Xbox Accessory Management Service
    # Hp services
    "HPAppHelperCap"
    "HPDiagsCap"
    "HPNetworkCap"
    "HPSysInfoCap"
    "HpTouchpointAnalyticsService"
    # Hyper-V services
    "HvHost"
    "vmicguestinterface"
    "vmicheartbeat"
    "vmickvpexchange"
    "vmicrdv"
    "vmicshutdown"
    "vmictimesync"
    "vmicvmsession"
    # Services that cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist

    Write-Host "Setting $service StartupType to Manual"
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Manual
}

Write-Host "Disabling Storage Sense..."
Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue

Write-Host "Disabling Wi-Fi Sense..."
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
 
If (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling") {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Type DWord -Value 00000000
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Type DWord -Value 0000001

Write-Host "Disabling NumLock after startup..."
If (!(Test-Path "HKU:")) {
    New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
}
Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 0

}

function RunDefaults{
# Remove TempFiles
Write-Host "Removing TempFiles..." -ForegroundColor Yellow;
Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue

<# 
fix this
#>

$tempfolders = @(
“C:\Windows\Prefetch\*” 
“C:\Documents and Settings\*\Local Settings\temp\*”
“C:\Users\*\Appdata\Local\Temp\*”
)

foreach ($temp in $tempfolders) {
    Remove-Item $temp -force -recurse-ErrorAction SilentlyContinue
}



# Remove Network repair
Write-Host "Network repair..." -ForegroundColor Yellow;
ipconfig /flushdns
netsh interface ip delete arpcache
netsh winsock reset catalog 


# Remove Cortana
Write-Host "Removing Cortana..." -ForegroundColor Yellow;
Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppPackage

# Remove Your phone
Write-Host "Removing Your phone..." -ForegroundColor Yellow;
Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage

# Remove Xbox
Write-Host "Removing Everything Xbox..." -ForegroundColor Yellow;
Get-AppxPackage *xbox* | Remove-AppxPackage
Get-AppxPackage *Xbox* | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.XboxGameCallableUI" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.XboxIdentityProvider" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.XboxApp" | Remove-AppxPackage

# Source:
# https://serverfault.com/questions/1089965/how-to-remove-onedrive-via-powershell

# Remove OneDrive
#taskkill /f /im OneDrive.exe
#Write-Host "Removing OneDrive..." -ForegroundColor Yellow;
#cmd -c "%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall"
#cmd -c "%SystemRoot%\System32\OneDriveSetup.exe /uninstall"



# Remove Other bloatware

# Source:
# https://github.com/Sycnex/Windows10Debloater

# I Added a app or two to the list :]

$Bloatware = @(
    #Unnecessary Windows 10 AppX Apps
    "Microsoft.3DBuilder"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.AppConnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.MinecraftUWP"
    "Microsoft.GamingServices"
    "Microsoft.BioEnrollment"
    # "Microsoft.WindowsReadingList"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.Sway"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.XboxApp"
    "Microsoft.ConnectivityStore"
    "Microsoft.CommsPhone"
    "Microsoft.ScreenSketch"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.MixedReality.Portal"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.YourPhone"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftOfficeHub"

    #Sponsored Windows 10 AppX Apps
    #Add sponsored/featured apps to remove in the "*AppName*" format
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Royal Revolt*"
    "*Sway*"
    "*Speed Test*"
    "*Dolby*"
    "*Viber*"
    "*ACGMediaPlayer*"
    "*Netflix*"
    "*OneCalendar*"
    "*LinkedInforWindows*"
    "*HiddenCityMysteryofShadows*"
    "*Hulu*"
    "*HiddenCity*"
    "*AdobePhotoshopExpress*"
    "*HotspotShieldFreeVPN*"


#OPTIONAL!
    "*Microsoft.Advertising.Xaml*"
    #"*Microsoft.MSPaint*"
    #"*Microsoft.MicrosoftStickyNotes*"
    #"*Microsoft.Windows.Photos*"
    #"*Microsoft.WindowsCalculator*"
    #"*Microsoft.WindowsStore*"
)

Write-Host "Removing Other Bloatware..." -ForegroundColor Yellow;

    foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host  "`r`n" +"`r`n" + "Trying to remove $Bloat." -ForegroundColor Yellow;
    }

    Write-Host "Finished Removing Bloatware Apps" -ForegroundColor Yellow;


# disable Windows Update Delivery Optimization.
# NB this applies to Windows 10.
# 0: Disabled
# 1: PCs on my local network
# 3: PCs on my local network, and PCs on the Internet

#Source:
#https://github.com/rgl/windows-vagrant/blob/master/disable-windows-updates.ps1
Write-Host "disabled Windows Update Delivery Optimization" -ForegroundColor Yellow;
$deliveryOptimizationPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config'
if (Test-Path $deliveryOptimizationPath) {
    New-ItemProperty `
        -Path $deliveryOptimizationPath `
        -Name DODownloadMode `
        -Value 0 `
        -PropertyType DWORD `
        -Force `
        | Out-Null
}

Write-Host "Setting Windows Update to Security ONLY" -ForegroundColor Yellow;
Write-Host "Disabling driver offering through Windows Update..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Type DWord -Value 1
Write-Host "Disabling Windows Update automatic restart..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -Type DWord -Value 0
Write-Host "Disabled driver offering through Windows Update"

# UnPin Startmenu Items

# Source:
# https://superuser.com/a/1442733

Write-Host "Removing StartMenu Pins" -ForegroundColor Yellow;
$START_MENU_LAYOUT = @"
<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
    <LayoutOptions StartTileGroupCellWidth="6" />
    <DefaultLayoutOverride>
        <StartLayoutCollection>
            <defaultlayout:StartLayout GroupCellWidth="6" />
        </StartLayoutCollection>
    </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@

$layoutFile="C:\Windows\StartMenuLayout.xml"

#Delete layout file if it already exists
If(Test-Path $layoutFile)
{
    Remove-Item $layoutFile
}

#Creates the blank layout file
$START_MENU_LAYOUT | Out-File $layoutFile -Encoding ASCII

$regAliases = @("HKLM", "HKCU")

#Assign the start layout and force it to apply with "LockedStartLayout" at both the machine and user level
foreach ($regAlias in $regAliases){
    $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
    $keyPath = $basePath + "\Explorer" 
    IF(!(Test-Path -Path $keyPath)) { 
        New-Item -Path $basePath -Name "Explorer"
    }
    Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1
    Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value $layoutFile
}

#Restart Explorer, open the start menu (necessary to load the new layout), and give it a few seconds to process
Stop-Process -name explorer
Start-Sleep -s 5
$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^{ESCAPE}')
Start-Sleep -s 5

#Enable the ability to pin items again by disabling "LockedStartLayout"
foreach ($regAlias in $regAliases){
    $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
    $keyPath = $basePath + "\Explorer" 
    Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0
}

#Restart Explorer and delete the layout file
Stop-Process -name explorer

# Uncomment the next line to make clean start menu default for all new users
#Import-StartLayout -LayoutPath $layoutFile -MountPath $env:SystemDrive\

Remove-Item $layoutFile

# Source:
# https://github.com/Sycnex/Windows10Debloater

Write-Host "Disabling Telementry" -ForegroundColor Yellow;
#Disables Windows Feedback Experience
Write-Host "Disabling Windows Feedback Experience program"
$Advertising = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
If (Test-Path $Advertising) {
    Set-ItemProperty $Advertising Enabled -Value 0 
}

Write-Host "Disabling Telemetry..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
Write-Host "Disabling Application suggestions..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
Write-Host "Disabling Feedback..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClient" -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" -ErrorAction SilentlyContinue | Out-Null
Write-Host "Disabling Tailored Experiences..."
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1
Write-Host "Disabling Advertising ID..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
Write-Host "Disabling Error reporting..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" | Out-Null
Write-Host "Restricting Windows Update P2P only to local network..."
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1
Write-Host "Stopping and disabling Diagnostics Tracking Service..."
Stop-Service "DiagTrack" -WarningAction SilentlyContinue
Set-Service "DiagTrack" -StartupType Disabled
Write-Host "Stopping and disabling WAP Push Service..."
Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
Set-Service "dmwappushservice" -StartupType Disabled
Write-Host "Enabling F8 boot menu options..."
bcdedit /set `{current`} bootmenupolicy Legacy | Out-Null
Write-Host "Disabling Remote Assistance..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
Write-Host "Stopping and disabling Superfetch service..."
Stop-Service "SysMain" -WarningAction SilentlyContinue
Set-Service "SysMain" -StartupType Disabled

# Task Manager Details
If ((get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name CurrentBuild).CurrentBuild -lt 22557) {
    Write-Host "Showing task manager details..."
    $taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru
    Do {
        Start-Sleep -Milliseconds 100
        $preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
    } Until ($preferences)
    Stop-Process $taskmgr
    $preferences.Preferences[28] = 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
}
else { Write-Host "Task Manager patch not run in builds 22557+ due to bug" }

Write-Host "Showing file operations details..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1
Write-Host "Hiding Task View button..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
Write-Host "Hiding People icon..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0

Write-Host "Changing default Explorer view to This PC..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1

Write-Host "Hiding 3D Objects icon from This PC..."
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue  

## Performance Tweaks and More Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Type DWord -Value 2000
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WaitToKillAppTimeout" -Type DWord -Value 5000
Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "HungAppTimeout" -ErrorAction SilentlyContinue
# Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "HungAppTimeout" -Type DWord -Value 4000 # Note: This caused flickering
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "AutoEndTasks" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "LowLevelHooksTimeout" -Type DWord -Value 1000
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WaitToKillServiceTimeout" -Type DWord -Value 2000
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseHoverTime" -Type DWord -Value 10


# Network Tweaks
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "IRPStackSize" -Type DWord -Value 20
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Type DWord -Value 4294967295

# Gaming Tweaks
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Type DWord -Value 8
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Priority" -Type DWord -Value 6
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Scheduling Category" -Type String -Value "High"

# Group svchost.exe processes
$ram = (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1kb
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value $ram -Force

Write-Host "Disable News and Interests"
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Type DWord -Value 0
# Remove "News and Interest" from taskbar
Set-ItemProperty -Path  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Type DWord -Value 2

# remove "Meet Now" button from taskbar

If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null
}

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAMeetNow" -Type DWord -Value 1

Write-Host "Removing AutoLogger file and restricting directory..."
$autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
If (Test-Path "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl") {
    Remove-Item "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl"
}
icacls $autoLoggerDir /deny SYSTEM:`(OI`)`(CI`)F | Out-Null

Write-Host "Stopping and disabling Diagnostics Tracking Service..."
Stop-Service "DiagTrack"
Set-Service "DiagTrack" -StartupType Disabled
    
#Stops Cortana from being used as part of your Windows Search Function
Write-Host "Stopping Cortana from being used as part of your Windows Search Function"
$Search = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
If (Test-Path $Search) {
    Set-ItemProperty $Search AllowCortana -Value 0 
}

#Disables Web Search in Start Menu
Write-Host "Disabling Bing Search in Start Menu"
$WebSearch = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" BingSearchEnabled -Value 0 
If (!(Test-Path $WebSearch)) {
    New-Item $WebSearch
}
Set-ItemProperty $WebSearch DisableWebSearch -Value 1 
    
#Stops the Windows Feedback Experience from sending anonymous data
Write-Host "Stopping the Windows Feedback Experience program"
$Period = "HKCU:\Software\Microsoft\Siuf\Rules"
If (!(Test-Path $Period)) { 
    New-Item $Period
}
Set-ItemProperty $Period PeriodInNanoSeconds -Value 0 

#Prevents bloatware applications from returning and removes Start Menu suggestions               
Write-Host "Adding Registry key to prevent bloatware apps from returning"
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$registryOEM = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
If (!(Test-Path $registryPath)) { 
    New-Item $registryPath
}
Set-ItemProperty $registryPath DisableWindowsConsumerFeatures -Value 1 

If (!(Test-Path $registryOEM)) {
    New-Item $registryOEM
}
Set-ItemProperty $registryOEM ContentDeliveryAllowed -Value 0 
Set-ItemProperty $registryOEM OemPreInstalledAppsEnabled -Value 0 
Set-ItemProperty $registryOEM PreInstalledAppsEnabled -Value 0 
Set-ItemProperty $registryOEM PreInstalledAppsEverEnabled -Value 0 
Set-ItemProperty $registryOEM SilentInstalledAppsEnabled -Value 0 
Set-ItemProperty $registryOEM SystemPaneSuggestionsEnabled -Value 0          

#Preping mixed Reality Portal for removal    
Write-Host "Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings"
$Holo = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic"    
If (Test-Path $Holo) {
    Set-ItemProperty $Holo  FirstRunSucceeded -Value 0 
}

#Disables Wi-fi Sense
Write-Host "Disabling Wi-Fi Sense"
$WifiSense1 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting"
$WifiSense2 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots"
$WifiSense3 = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
If (!(Test-Path $WifiSense1)) {
    New-Item $WifiSense1
}
Set-ItemProperty $WifiSense1  Value -Value 0 
If (!(Test-Path $WifiSense2)) {
    New-Item $WifiSense2
}
Set-ItemProperty $WifiSense2  Value -Value 0 
Set-ItemProperty $WifiSense3  AutoConnectAllowedOEM -Value 0 

#Disables live tiles
Write-Host "Disabling live tiles"
$Live = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"    
If (!(Test-Path $Live)) {      
    New-Item $Live
}
Set-ItemProperty $Live  NoTileApplicationNotification -Value 1 

#Turns off Data Collection via the AllowTelemtry key by changing it to 0
Write-Host "Turning off Data Collection"
$DataCollection1 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
$DataCollection2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$DataCollection3 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection"    
If (Test-Path $DataCollection1) {
    Set-ItemProperty $DataCollection1  AllowTelemetry -Value 0 
}
If (Test-Path $DataCollection2) {
    Set-ItemProperty $DataCollection2  AllowTelemetry -Value 0 
}
If (Test-Path $DataCollection3) {
    Set-ItemProperty $DataCollection3  AllowTelemetry -Value 0 
}

#Disabling Location Tracking
Write-Host "Disabling Location Tracking"
$SensorState = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
$LocationConfig = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
If (!(Test-Path $SensorState)) {
    New-Item $SensorState
}
Set-ItemProperty $SensorState SensorPermissionState -Value 0 
If (!(Test-Path $LocationConfig)) {
    New-Item $LocationConfig
}
Set-ItemProperty $LocationConfig Status -Value 0 

#Disables People icon on Taskbar
Write-Host "Disabling People icon on Taskbar"
$People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
If (Test-Path $People) {
    Set-ItemProperty $People -Name PeopleBand -Value 0
} 

#Disables scheduled tasks that are considered unnecessary 
Write-Host "Disabling scheduled tasks"
#Get-ScheduledTask XblGameSaveTaskLogon | Disable-ScheduledTask
Get-ScheduledTask XblGameSaveTask | Disable-ScheduledTask
Get-ScheduledTask Consolidator | Disable-ScheduledTask
Get-ScheduledTask UsbCeip | Disable-ScheduledTask
Get-ScheduledTask DmClient | Disable-ScheduledTask
Get-ScheduledTask DmClientOnScenarioDownload | Disable-ScheduledTask

#Write-Host "Uninstalling Telemetry Windows Updates"
#Uninstalls Some Windows Updates considered to be Telemetry. !WIP!
#Wusa /Uninstall /KB:3022345 /norestart /quiet
#Wusa /Uninstall /KB:3068708 /norestart /quiet
#Wusa /Uninstall /KB:3075249 /norestart /quiet
#Wusa /Uninstall /KB:3080149 /norestart /quiet        

Write-Host "Stopping and disabling WAP Push Service"
#Stop and disable WAP Push Service
Stop-Service "dmwappushservice"
Set-Service "dmwappushservice" -StartupType Disabled

Write-Host "Stopping and disabling Diagnostics Tracking Service"
#Disabling the Diagnostics Tracking Service
Stop-Service "DiagTrack"
Set-Service "DiagTrack" -StartupType Disabled

# Source:
# https://github.com/Sycnex/Windows10Debloater

Write-Host "Removing Bloatware REGKEYS" -ForegroundColor Yellow;
$Keys = @(
            
    New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    #Remove Background Tasks
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
    
    #Windows File
    "HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    
    #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
    
    #Scheduled Tasks to delete
    "HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
    
    #Windows Protocol Keys
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
       
    #Windows Share Target
    "HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
)

#This writes the output of each key it is removing and also removes the keys listed above.
ForEach ($Key in $Keys) {
    Write-Host "Removing $Key from registry"
    Remove-Item $Key -Recurse
}
Write-Host "Additional bloatware keys have been removed!"

EndFUNC

}

function EndFUNC {
    Clear-Host
    Start-Sleep -s 2
# stop script from auto closing
Read-Host -Prompt "All Done! Press Enter to exit!"
}

$pshost = get-host
$pswindow = $pshost.ui.rawui
$newsize = $pswindow.buffersize
$newsize.height = 3000
$newsize.width = 150
$pswindow.buffersize = $newsize
$newsize = $pswindow.windowsize
$newsize.height = 41
$newsize.width = 75
$pswindow.windowsize = $newsize

#get Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
start-script
}else{
start-script 
}

