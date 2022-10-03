<#
    ·▄▄ ·  ▐ ▄ ▪   ▄▄· ▄ •▄ ▄▄▄ .▄▄▄  .▄▄ ·    ▐▄▄    ▄▄    ▄▄▌
    ▐█ ▀. •█▌▐███ ▐█ ▌▪█▌▄▌▪▀▄.▀·▀▄ █·▐█ ▀.    ▐███▄ ████ ▄███▌ 
    ▄▀▀▀█▄▐█▐▐▌▐█·██ ▄▄▐▀▀▄·▐▀▀▪▄▐▀▀▄ ▄▀▀▀█▄   ▐██████████████▌ 
    ▐█▄▪▐███▐█▌▐█▌▐███▌▐█.█▌▐█▄▄▌▐█•█▌▐█▄▪▐█   ▐███▀ ████ ▀███▌
     ▀▀▀▀ ▀▀ █▪▀▀▀·▀▀▀ ·▀  ▀ ▀▀▀ .▀  ▀ ▀▀▀▀    ▐▀▀    ▀▀    ▀▀▌ 
                            by:
                https://github.com/zoeeechu

#>

function start-script{
#makesure we can use XML    
Add-Type -AssemblyName PresentationCore, PresentationFramework
Add-Type -AssemblyName WindowsBase


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
Write-Host "___________________________________________________________________________ " -ForegroundColor Yellow;
Write-Host " " -ForegroundColor Yellow;
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
            RunDesktop
            RunDefaults
        } elseif ($Laptop.IsChecked -eq $true) {
            RunLaptop
            RunDefaults
        } else {
            Write-Host "ERROR: No option is selected" -ForegroundColor Red;
        }
    }

})


#Show Form
$Form.ShowDialog() | out-null 


# stop script from auto closing
Read-Host -Prompt "Press Enter to exit"
}

function RunDesktop{

}

function RunLaptop{

}

function RunDefaults{
# Remove TempFiles
Write-Host "Removing TempFiles..." -ForegroundColor Yellow;
Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue

<# 
fix this
#>

#$tempfolders = @(“C:\Windows\Prefetch\*”, “C:\Documents and Settings\*\Local Settings\temp\*”, “C:\Users\*\Appdata\Local\Temp\*”)
#Remove-Item $tempfolders -force -recurse-ErrorAction SilentlyContinue

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
taskkill /f /im OneDrive.exe
Write-Host "Removing OneDrive..." -ForegroundColor Yellow;
cmd -c "%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall"
cmd -c "%SystemRoot%\System32\OneDriveSetup.exe /uninstall"



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

    foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host "Removing Other Bloatware..." -ForegroundColor Yellow;
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

}

$pshost = get-host
$pswindow = $pshost.ui.rawui
$newsize = $pswindow.buffersize
$newsize.height = 3000
$newsize.width = 150
$pswindow.buffersize = $newsize
$newsize = $pswindow.windowsize
$newsize.height = 50
$newsize.width = 75
$pswindow.windowsize = $newsize

#get Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
start-script
}else{
start-script 
}

