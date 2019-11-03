# Creating a Ramdisk On Windows Server

Firts install the install the iSCSI Target Server component (it is the part of the File and Storage Services role).
You may need to enable iSCSI Service traffic in the firewall.

After that download the file and update it before running.

Also you need to update the file to change:
 - IP in the file.
 - Label name of the disk.
 - Size of the disk.


# why is this useful?

Ramdisk are in my benchmarks at least 10 times faster than phisical hd, so when performing some task that have backlog by heavy HD usage, and I dont control the source code of the application I tend to use Ramdisk as a temporary solution. Some examples:
- Generating thousands of files/reports that need to be saved in a temporary folder before sending the file to the end user.
- Multiple file server, to be later then moved to a third party service.

#important

Do not store important files on this disk, use it as cache or temporary files source, files will be lost after the server restarts.
After the server restarts the unit will be lost, so you may need to recreate it.

