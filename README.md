# Creating a Ramdisk On Windows Server

Firts install the install the iSCSI Target Server component (it is the part of the File and Storage Services role).
You may need to enable iSCSI Service traffic in the firewall.

After that download the file and update it before running.

Also you need to update the file to change:
 - IP in the file.
 - Label name of the disk.
 - Size of the disk.


# Why is this useful?

Ramdisk are in my benchmarks at least 10 times faster than physical hd, so when performing some task that have backlog by heavy HD usage, and I dont control the source code of the application I tend to use Ramdisk as a temporary solution. Some examples:
- Generating thousands of files/reports that need to be saved in a temporary folder before sending the file to the end user. Onetime I had to run this program by a clients request where they needed to generate millions of documents based on DB information, I did not control the sourcecode of the software so I could not change it, I saw the software used a folder as cache to generate the reports, when runing the software in a RankDisk, instead of 12 months generating millions of documents, I manage to print the reports in less than 4 weeks.
- Multiple file server, to be later then moved to a third party service. I managed to increase the speed of upload by adding async cronous upload to a RanDisk. The file was validated then moved to a AWS file manager, the procces used to take several seconds, now it became almost instant.
- Game servers with a large number of users and a lot of writes to the HD. Implemented game servers with map generation, that save chunks in to HD, when the server contains hundreds of players the HD starts lagging behind and users experience lag, after running the games from RanmDisk and generating periodical backups the lag issue solved.

# Important

Do not store important files permanently on this disk, use it as cache or temporary files source, files will be lost after the server restarts or if the server lose power.
After the server restarts the unit will be lost, so you may need to recreate it.
Creating the ramdisk will tax your ram, so consider the ram available and the consumption before creating it.

