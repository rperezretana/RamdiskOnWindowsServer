# Firts install the install the iSCSI Target Server component (it is the part of the File and Storage Services role).
# you may need to enable iSCSI Service traffic in the firewall

#replace it by your computer IP, not localhost
$DiskSize = "50MB"



#To allow traffic to the loopback interface for iSCSI:
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\iSCSI Target' -Name AllowLoopBack -Value 1

#create the unit with the size specified
New-IscsiVirtualDisk -Path "ramdisk:ramdiskDrive.vhdx" -Size @DiskSize

#Set target to server ip, #REPLACE IT WITH YOUR IP (NOT LOCALHOST)
New-IscsiServerTarget -TargetName targetRAMDisk -InitiatorIds @("IPAddress:192.168.1.3") 

#Connect the RAM disk to the created iSCSI target
Add-IscsiVirtualDiskTargetMapping -TargetName targetRAMDisk -DevicePath "ramdisk:ramdiskDrive.vhdx"

# Connect the  iSCSI Target
Get-IscsiTarget | Connect-IscsiTarget

# create the partition similar to using the Disk Management
Get-Disk | Where partitionstyle -eq 'raw' | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel "RamDisk" -Confirm:$false