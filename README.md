# Homebrew Tap - Pen Test Tools

## NOTICE

*This repo is UNMAINTAINED*. Unless pull requests are received, no changes or fixes will be made in the foreseable future. I no longer use these formulae, and do not have the time to keep them in a working state.

## About

This is a [Tap](https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/brew-tap.md) containing some [Homebrew](http://brew.sh/) formulas consisting of penetration testing related tools. Nearly all these formulas should build and run on both macOS and [Linux](http://linuxbrew.sh/).



## macOS Specific Notes

The following Formulae do not build/work under macOS:

* enum4linux - depends on rpcclient, net, nmblookup, smbclient which are tools included with Samba and not found on macOS
* libnl - depends on specific functionality contained only within the Linux kernel
* aircrack-ng - depends on libnl (see above)
* wifite - depends on aircrack-ng (see above)
* nfsshell - depends on specific functionality contained within the glibc library
* frogger - depends on the Linux vconfig tool
* mitmf - a python dependency depends on specific functionality found only within the Linux kernel



## Ubuntu Specific Notes

The following dependencies will need to be installed on Ubuntu based systems:


```
sudo apt install build-essential curl git libpcap-dev python-setuptools python-dev
```

---



## Available Tools

### information-gathering
| tool                                                          | install
| ------------------------------------------------------------- | ----------------------------------------
| [CeWL](https://github.com/digininja/CeWL/)                    | brew install sidaf/pentest/cewl
| [dirb](https://github.com/seifreed/dirb)                      | brew install sidaf/pentest/dirb
| [dnsrecon](https://github.com/darkoperator/dnsrecon)          | brew install sidaf/pentest/dnsrecon
| [enum4linux](https://labs.portcullis.co.uk/tools/enum4linux/) | brew install sidaf/pentest/enum4linux
| [gobuster](https://github.com/OJ/gobuster)                    | brew install sidaf/pentest/gobuster
| [netdiscover](http://nixgeneration.com/~jaime/netdiscover/)   | brew install sidaf/pentest/netdiscover
| [polenum](https://labs.portcullis.co.uk/tools/polenum/)       | brew install sidaf/pentest/polenum
| [praeda](https://github.com/percx/Praeda)                     | brew install sidaf/pentest/praeda
| [recon-ng](https://bitbucket.org/LaNMaSteR53/recon-ng)        | brew install sidaf/pentest/recon-ng
| [ridenum](https://github.com/trustedsec/ridenum)              | brew install sidaf/pentest/ridenum
| [Scrape-DNS](https://github.com/304GEEK/Scrape-DNS)           | brew install sidaf/pentest/scrape_dns
| [SimplyEmail](https://github.com/killswitch-GUI/SimplyEmail)  | brew install sidaf/pentest/simply_email
| [snmpcheck](http://www.nothink.org/codes/snmpcheck/)          | brew install sidaf/pentest/snmpcheck
| [theHarvester](https://github.com/laramies/theHarvester)      | brew install sidaf/pentest/the_harvester
| [wafw00f](https://github.com/sandrogauci/wafw00f)             | brew install sidaf/pentest/wafw00f
| [whatweb](https://github.com/urbanadventurer/WhatWeb)         | brew install sidaf/pentest/whatweb
| [wig](https://github.com/jekyc/wig)                           | brew install sidaf/pentest/wig

### vulnerability-analysis
| tool                                                                                  | install
| ------------------------------------------------------------------------------------- | ------------------------------------------
| [aircrack-ng](http://www.aircrack-ng.org/)                                            | brew install sidaf/pentest/aircrack-ng
| [ikeforce](https://github.com/SpiderLabs/ikeforce)            | brew install sidaf/pentest/ikeforce
| [iker](https://labs.portcullis.co.uk/tools/iker/)                                     | brew install sidaf/pentest/iker
| [header-check](https://labs.portcullis.co.uk/tools/headercheck/)                      | brew install sidaf/pentest/header_check
| [nfsshell](https://github.com/NetDirect/nfsshell)                                     | brew install sidaf/pentest/nfsshell
| [nopc](https://labs.portcullis.co.uk/tools/nopc/)                                     | brew install sidaf/pentest/nopc
| [rdp-sec-check](https://labs.portcullis.co.uk/tools/rdp-sec-check/)                   | brew install sidaf/pentest/rdp-sec-check
| [serializekiller](https://github.com/johndekroon/serializekiller)                     | brew install sidaf/pentest/serializekiller
| [sslscan](https://github.com/rbsec/sslscan)                                           | brew install sidaf/pentest/sslscan-static
| [ssl-cipher-suite-enum](https://labs.portcullis.co.uk/tools/ssl-cipher-suite-enum/)   | brew install sidaf/pentest/ssl-cipher-suite-enum
| [testssl](https://github.com/drwetter/testssl.sh)                                     | brew install sidaf/pentest/testssl-static
| [vFeed](https://github.com/toolswatch/vFeed)                                          | brew install sidaf/pentest/vfeed
| [wfuzz](https://github.com/xmendez/wfuzz)                                             | brew install sidaf/pentest/wfuzz
| [windows-exploit-suggester](https://github.com/GDSSecurity/Windows-Exploit-Suggester) | brew install sidaf/pentest/windows-exploit-suggester
| [wpscan](https://github.com/wpscanteam/wpscan)                                        | brew install sidaf/pentest/wpscan
| [yasuo](https://github.com/0xsauby/yasuo)                                             | brew install sidaf/pentest/yasuo

### exploitation
| tool                                                          | install
| ------------------------------------------------------------- | -----------------------------------------------
| [armitage](http://www.fastandeasyhacking.com)                 | brew install sidaf/pentest/armitage
| [bettercap](https://github.com/evilsocket/bettercap)          | brew install sidaf/pentest/bettercap
| [crackmapexec](https://github.com/byt3bl33d3r/CrackMapExec)   | brew install sidaf/pentest/crackmapexec
| [clusterd](https://github.com/hatRiot/clusterd)               | brew install sidaf/pentest/clusterd
| [commix](https://github.com/stasinopoulos/commix)             | brew install sidaf/pentest/commix
| [frogger](https://github.com/commonexploits/vlan-hopping)     | brew install sidaf/pentest/frogger
| [jexboss](https://github.com/joaomatosf/jexboss)              | brew install sidaf/pentest/jex_boss
| [impacket](https://github.com/CoreSecurity/impacket)          | brew install sidaf/pentest/impacket
| [inception](https://github.com/carmaa/inception)              | brew install sidaf/pentest/inception
| [metasploit](https://github.com/rapid7/metasploit-framework)  | brew install sidaf/pentest/metasploit-framework
| [mitmf](https://github.com/byt3bl33d3r/MITMf)                 | brew install sidaf/pentest/mitmf
| [odat](https://github.com/quentinhardy/odat)                  | brew install sidaf/pentest/odat
| [panoptic](https://github.com/lightos/Panoptic)               | brew install sidaf/pentest/panoptic
| [responder](https://github.com/lgandx/Responder)              | brew install sidaf/pentest/responder
| [sqlmap](http://sqlmap.org/)                                  | brew install sidaf/pentest/sqlmap
| [wifite](https://github.com/derv82/wifite)                    | brew install sidaf/pentest/wifite
| [yersinia](http://www.yersinia.net/)                          | brew install sidaf/pentest/yersinia
| [ysoserial](https://github.com/frohoff/ysoserial)             | brew install sidaf/pentest/ysoserial

### post-exploitation
| tool                                                          | install
| ------------------------------------------------------------- | ---------------------------------------
| [babel-sf](https://github.com/attackdebris/babel-sf)          | brew install sidaf/pentest/babel-sf
| [egressbuster](https://github.com/trustedsec/egressbuster)    | brew install sidaf/pentest/egressbuster
| [empire](https://github.com/PowerShellEmpire/Empire)          | brew install sidaf/pentest/empire
| [laudanum](https://sourceforge.net/projects/laudanum/)        | brew install sidaf/pentest/laudanum
| [nishang](https://github.com/samratashok/nishang)             | brew install sidaf/pentest/nishang
| [posh-secmod](https://github.com/darkoperator/Posh-SecMod)    | brew install sidaf/pentest/posh-secmod
| [powersploit](https://github.com/PowerShellMafia/PowerSploit) | brew install sidaf/pentest/powersploit
| [pykek](https://github.com/bidord/pykek)                      | brew install sidaf/pentest/pykek
| [tater](https://github.com/Kevin-Robertson/Tater)             | brew install sidaf/pentest/tater
| [unicorn](https://github.com/trustedsec/unicorn)              | brew install sidaf/pentest/magic_unicorn

### password-recovery
| tool                                                                | install
| ------------------------------------------------------------------- | ----------------------------------------
| [cowpatty](http://www.willhackforsushi.com/?page_id=50)             | brew install sidaf/pentest/cowpatty
| [crunch](https://sourceforge.net/projects/crunch-wordlist/)         | brew install sidaf/pentest/crunch
| [hashcat-bin](http://hashcat.net/hashcat/)                          | brew install sidaf/pentest/hashcat-bin
| [hashcat-legacy](https://github.com/hashcat/hashcat-legacy)         | brew install sidaf/pentest/hashcat-legacy
| [hashcat-utils](https://hashcat.net/wiki/doku.php?id=hashcat_utils) | brew install sidaf/pentest/hashcat-utils
| [hashid](https://github.com/psypanda/hashID)                        | brew install sidaf/pentest/hashid
| [john](https://github.com/magnumripper/JohnTheRipper)               | brew install sidaf/pentest/john-jumbo

### wordlists
| tools                                                                  | install
| ---------------------------------------------------------------------- | --------------------------------------------
| [fuzzdb](https://github.com/fuzzdb-project/fuzzdb)                     | brew install sidaf/pentest/fuzzdb
| [SecList](https://github.com/danielmiessler/SecLists)                  | brew install sidaf/pentest/sec_lists
| [RobotsDisallowed](https://github.com/danielmiessler/RobotsDisallowed) | brew install sidaf/pentest/robots_disallowed



## Todo

### vulnerability-analysis
- [EAPeak](https://github.com/securestate/eapeak)
- [wEAPe](https://github.com/commonexploits/weape)

### exploitation
- [fimap](https://github.com/kurobeats/fimap)
- [Cisc0wn](https://github.com/nccgroup/cisco-SNMP-enumeration)

### post-exploitation
- [PowerPath](https://github.com/andyrobbins/PowerPath)
- [Egress-Assess](https://github.com/ChrisTruncer/Egress-Assess)
- [Mimikittenz](https://github.com/putterpanda/mimikittenz)
- dnscat2
- metassh
- potato
- pth-toolkit
- spraywmi

### av-bypass
- backdoorfactory
- pyobfuscate
- shellter
- veil-evasion

### password-recovery
- iphelix-pack
