# Bash Kit - Multitool
Bash script purposed for system enumeration, vulnerability identification and privilege escalation.

Bash Kit Multitool draws functionality from several of my preious scripts namely [SysEnum](https://github.com/NullArray/SysEnum) and [RootHelper](https://github.com/NullArray/RootHelper) and is in many regards RootHelpers successor. 

Besides functionality from these two previous scripts it incorporates some of it's own and as such aims to be a comprehensive assistant for operations and utilities related to system enumeration, vulnerability identification,
exploitation and privilege escalation. 


## Usage

After a system has been succesfully compromised Bash Kit should be downloaded to the host in question either with `git` or `wget`, after it has been unpacked/cloned the shellscript needs to be made executable with `chmod +x bashkit.sh`

Upon doing so it can be run on the target host. The options available to the user are below.

The 'Usage' option prints this informational message. The option 'System Enumeration' attempts to retrieve system information such as OS and kernel details, network status, processes, system logs and more. 'Common Utilities' checks for the existence of
useful utilities such as telnet, netcat, tcpdump etc. 'External Utilities' opens a menu which lets you download external utilities that may prove to be helpful with further enumeration, vulnerability identification and privilege escalation.

Finally the option 'Cleartext Credentials' searches for text and web application files that contain certain keywords in order to find potential cleartext passwords. 
