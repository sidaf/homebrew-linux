#!/bin/sh

macos_tools=('aircrack-ng' 'armitage' 'babel-sf' 'bettercap' 'cewl' 'clusterd' 'commix' 'cowpatty' 'crackmapexec' 'crunch' 'cuty_capt' 'dirb' 'dnsrecon' 'egressbuster' 'empire' 'enum4linux' 'frogger' 'fuzzdb' 'gobuster' 'hashcat-bin' 'hashcat-legacy' 'hashcat-utils' 'hashid' 'header_check' 'hostapd-wpe' 'ikeforce' 'iker' 'impacket' 'inception' 'install' 'jex_boss' 'laudanum' 'libnl' 'magic_unicorn' 'metasploit-framework' 'mitmf' 'netdiscover' 'nfsshell' 'nishang' 'nopc' 'odat' 'panoptic' 'polenum' 'posh-secmod' 'powersploit' 'praeda' 'pykek' 'rdp-sec-check' 'recon-ng' 'responder' 'ridenum' 'robots_disallowed' 'scrape_dns' 'sec_lists' 'serializekiller' 'simply_email' 'snmpcheck' 'sqlmap-extra' 'ssl-cipher-suite-enum' 'sslscan-static' 'tater' 'testssl-static' 'the_harvester' 'vfeed' 'wafw00f' 'wfuzz' 'whatweb' 'wifite' 'wig' 'windows-exploit-suggester' 'wpscan' 'yasuo' 'yersinia' 'ysoserial')

for each in ${macos_tools[*]};do
    brew install $each
done
