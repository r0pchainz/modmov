sudo fdisk -l 
&&
umount /dev/sda
&&
sudo dd if=/home/(redacted)/Desktop/lol.iso of=/dev/sda bs=4M
&&
sync &&
sudo eject /dev/sdc
sudo apt-get install fail2ban acct tcpd
sudo lynis -c
echo "SELINUX=enforcing" >> /etc/selinux/config
#apt-get --purge remove nfs-kernel-server nfs-common portmap

echo 0 > /etc/security/limits.conf
echo "fs.suid_dumpable = 0 
# Avoid a smurf attack
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Turn on protection for bad icmp error messages
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Turn on syncookies for SYN flood attack protection
net.ipv4.tcp_syncookies = 1

# Turn on and log spoofed, source routed, and redirect packets
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

# No source routed packets here
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# Turn on reverse path filtering
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Make sure no one can alter the routing tables
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0

# Don't act as a router
net.ipv4.ip_forward = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Turn on execshield for reducing worm or other automated remote attacks 
kernel.exec-shield = 1
kernel.randomize_va_space = 1

# Tune IPv6 
net.ipv6.conf.default.router_solicitations = 0
net.ipv6.conf.default.accept_ra_rtr_pref = 0
net.ipv6.conf.default.accept_ra_pinfo = 0
net.ipv6.conf.default.accept_ra_defrtr = 0
net.ipv6.conf.default.autoconf = 0
net.ipv6.conf.default.dad_transmits = 0
net.ipv6.conf.default.max_addresses = 1

# Increase system file descriptor limit    
fs.file-max = 65535

# Allow for more PIDs (Prevention of fork() failure error message) 
kernel.pid_max = 65536

# Increase system IP port limits
net.ipv4.ip_local_port_range = 2000 65000

# Tuning Linux network stack to increase TCP buffer size. Set the max OS send buffer size (wmem) and receive buffer size (rmem) to 12 MB for queues on all protocols.
net.core.rmem_max = 8388608
net.core.wmem_max = 8388608

# set minimum size, initial size and max size
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912 

# Value to set for queue on the INPUT side when incoming packets are faster then the kernel process on them. 
net.core.netdev_max_backlog = 5000

# For increasing transfer window, enable window scaling
net.ipv4.tcp_window_scaling = 1

kernel.exec-shield = 1 
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.ip_forward =0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.icmp_ignore_bogus_error_responses =1
net.ipv4.conf.default.accept_redirects =0
net.ipv4.conf.all.send_redirects =0
net.ipv4.conf.default.send_redirects =0
net.ipv4.conf.default.accept_redirects =0
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
net.ipv4.conf.all.log_martians = 1
kernel.randomize_va_space = 2" >> etc/sysctl.conf
echo "auth required pam_env.so

auth required pam_faillock.so preauth audit silent deny=5 unlock_time=604800

auth [success=1 default=bad] pam_unix.so

auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=604800

auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=604800

auth required pam_deny.so" >> /etc/pam.d/system-auth

echo "auth required pam_env.so

auth required pam_faillock.so preauth audit silent deny=3 unlock_time=604800

auth [success=1 default=bad] pam_unix.so

auth [default=die] pam_faillock.so authfail audit deny=3 unlock_time=604800

auth sufficient pam_faillock.so authsucc audit deny=3 unlock_time=604800

auth required pam_deny.so" >>/etc/pam.d/password-auth


pip install ldapdomaindump impacket mona scapy socket dpkt pcapy requests beautifulsoup paramiko
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses1SE_Ovr_vw.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question1.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question2.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses2_Req.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question3.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question4.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec1.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec2.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec3.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec4.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec5.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec6.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec7.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec8.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec9.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec10.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec11.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec12.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n1.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n2.pdf
http://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec01.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec02.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec03.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec04.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec05.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec06.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture1.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture2.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture3.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture4.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture5.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture6.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture7.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture8.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture9.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture10.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture11.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture12.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture13.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture14.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture15.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture16.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture17.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture18.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture19.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture20.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture21.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture22.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture23.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture24.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture25.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture26.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture27.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture28.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture29.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture30.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture31.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture32.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture33.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture34.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture35.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec0.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec1.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec2.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec3.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117notes.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec01.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec02.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_intro.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_booleanrings.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_lptheory.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_orthonormal.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_fseries1.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_fseries2.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_fseries3.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am35.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am51.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am52.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am53.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am54.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am55.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am56.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am57.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am61.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am62.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am63.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am64.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture1.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture2.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec1.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec2.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec3.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec4.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec5.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec6.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec7.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec8.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec9.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec12.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec13.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec14.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec15.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec16.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec17.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec18.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec19.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec20.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec21.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec22.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec23.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec24.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec25.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec26.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec27.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec28.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec29.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec30.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec31.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec32.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec33.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec34.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec35.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec36.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec37.pdf
https://ocw.mit.edu/courses/mathematics/18-905-algebraic-topology-i-fall-2016/lecture-notes/MIT18_905F16_lec38.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture3.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture4.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture5.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture6.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture7.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture8.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture9.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture10.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture11.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture12.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture13.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture14.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture15.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture16.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture17.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture18.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture19.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture20.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture21.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture22.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture23.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture24.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture25.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture26.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture27.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture28.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture29.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture30.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture31.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture32.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture33.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture34.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture35.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am65.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am71.pdf
https://ocw.mit.edu/courses/mathematics/18-086-mathematical-methods-for-engineers-ii-spring-2006/readings/am72.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_fourierint1.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_fourierint2.pdf
https://ocw.mit.edu/courses/mathematics/18-103-fourier-analysis-fall-2013/readings/MIT18_103F13_brownian.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec1.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec2.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec3.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec4.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec5.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec6.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec7.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec8.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec9.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec12.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec13.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec14.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec15.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec16.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec17.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec18.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec19.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec20.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec21.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec22.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec23.pdf
https://ocw.mit.edu/courses/mathematics/18-125-measure-and-integration-fall-2003/lecture-notes/18125_lec24.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec03.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec04.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec05.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec06.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec07.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec08.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec09.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec12.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec13.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec14.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec15.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec16.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec17.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec18.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec19.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec20.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec21.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec22.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec23.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec24.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec25.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec26.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec27.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec28.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec29.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec30.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec31.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec32.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec33.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec34.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec35.pdf
https://ocw.mit.edu/courses/mathematics/18-117-topics-in-several-complex-variables-spring-2005/lecture-notes/18117_lec36.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec4.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec5.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec6.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec7.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec8.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec9.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da1.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da2.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da3.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da4.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da5.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da6.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da7.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da8.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da9.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da10.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da11.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da12.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da13andlast.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec0.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec1.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec2.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec3.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec4.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec5.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec6.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec7.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec8.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec9.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da1.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da2.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da3.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da4.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da5.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da6.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da7.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da8.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da9.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da10.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da11.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da12.pdf
https://ocw.mit.edu/courses/mathematics/18-156-differential-analysis-spring-2004/lecture-notes/da13andlast.pdf

https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture1.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture2.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture3.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture4.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture5.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture6.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture7.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture8.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture9.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture10.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture11.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture12.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture13.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture14.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture15.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture16.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture17.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture18.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture19.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture20.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture21.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture22.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture23.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture24.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture25.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture26.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture27.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture28.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture29.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture30.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture31.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture32.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture33.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture34.pdf
https://ocw.mit.edu/courses/mathematics/18-075-advanced-calculus-for-engineers-fall-2004/lecture-notes/lecture35.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec07.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec08.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec09.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec12.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec13.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec14.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec15.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec21.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec22.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec29.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec30.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec31.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec32.pdf
https://ocw.mit.edu/courses/mathematics/18-906-algebraic-topology-ii-spring-2006/lecture-notes/lec33.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec01.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec02.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec03.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec04.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec05.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec06.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec07.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec08.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec09.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec10.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec11.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec12.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec13.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec14.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec15.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec16.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec17.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec18.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec19.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec20.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec21.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec22.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec23.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec24.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_lec25.pdf
https://ocw.mit.edu/courses/mathematics/18-725-algebraic-geometry-fall-2015/lecture-notes/MIT18_725F15_notes.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n3.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n4.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n5.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n6.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n7.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n8.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n9.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n10.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n11.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n12.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n13.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n14.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n15.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n16.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n17.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n18.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n19.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n20.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n21.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n22.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n23.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n24.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-856j-randomized-algorithms-fall-2002/lecture-notes/n25.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec14.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec15.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec16.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec17.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec18.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec19.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec22.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec23.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses3_sysmodlg.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question5.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MTI16_842F15_Ses4_Con_Syn.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses_5_Design.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question6.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses_6_Des_Def.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question7.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses7Mastr_Sol.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses_8_Sys_Int.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question8.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses9_Ver.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question9.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses_10_Com_Opr.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Question10.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_Ses11_Life.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MIT16_842F15_StandardsQ.pdf
https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-842-fundamentals-of-systems-engineering-fall-2015/lecture-notes/MTI16_842F15_Ses12_FutofSE.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/fibheaps.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n0_intro.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n1_fibonacci.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/persistent.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n2_persistent.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/dzhang_splaytree.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n3_splay.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/suffix.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n4_suffix.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/veb.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n5_bucket.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n6_hashing.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/max_flow_dff.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n7_flow.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/min_cost_flow.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n10_mincostflow.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/dualitynotes.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n15_approx.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n22_fixedparam.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/ragnarok.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n23online.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/rasmu_sweepline.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n25_geometry.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n28_external.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/n32parallel.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec01_1999.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec05_1999.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec01_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec02_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec13_2001.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec06_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec14_1999.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec10_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec11_2001.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec12_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec14_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec15_2003.pdf
 wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2005/lecture-notes/lec18_2003.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-854j-advanced-algorithms-fall-2008/lecture-notes/lec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_lec24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-845-quantum-complexity-theory-fall-2010/lecture-notes/MIT6_845F10_npc_slides.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-852j-distributed-algorithms-fall-2009/lecture-notes/MIT6_852JF09_lec25.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-858-computer-systems-security-fall-2014/lecture-notes/MIT6_858F14_lec23.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec01.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec01.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec02.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec03.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec03b.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec04.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec05.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec06.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec07.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec08.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec09.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec10.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec11_12.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec13.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec14.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec15.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec16.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec17.pdf
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec18.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Introduction.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Anfinsen.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Rnase.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Retrieving.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Packing.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Packing2.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_CoiledCoils.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Tropomyosin.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_S_peptide.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Detecting.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Cytochrome.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_CollagenS.pdf
https://ocw.mit.edu/courses/mechanical-engineering/2-785j-cell-matrix-mechanics-fall-2014/readings/MIT2_785JF14_Chapter_1.pdf
https://ocw.mit.edu/courses/mechanical-engineering/2-785j-cell-matrix-mechanics-fall-2014/readings/MIT2_785JF14_Chapter_2.pdf
https://ocw.mit.edu/courses/mechanical-engineering/2-785j-cell-matrix-mechanics-fall-2014/readings/MIT2_785JF14_Chapter_3.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture01.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture1.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0201_1_rosow.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/ln34hms3275.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/essential.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/male_system.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/introduction_2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/epithelium_2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/immunesystem2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/cellinjury_2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/inflammation2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/tissuerepair2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/infections.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/transplant_2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/optimal_diets_sl.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/isch_infarct2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/genetics_2003.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-035-principle-and-practice-of-human-pathology-spring-2003/lecture-notes/liver.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/temp_testis.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/endometriosis.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/female_repro_sys.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/endomertrio_chap.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/normal_mens_cyc.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/fibroids.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/ovarian_tumors.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/fibroids_chap.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/ovarian_pathlogy.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/non_hormonal_con.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/non_hormonal.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/hormonal_contrp.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/hormonal_con.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/phytoestrogens.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/placenta.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/placental_path.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/placental_path2.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/cervical_cancer.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/cervix.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/genital_warts.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/sexual_differen.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/infertility.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/maternal_physio.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/hypertension.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/uterine_physlogy.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/poly_ovar_syndom.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/ovarian_failure.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/toxoplasmosis.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/isoimmunization.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/teratology.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/energy_impact.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/prenatal_genetic.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/fetal_surveill.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-071-human-reproductive-biology-fall-2005/lecture-notes/pregnancy_termi.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0203_case_exampl.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/ln1112hms5008.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0215_2_weinblatt.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0216_1_baker.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0216_2_baker.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0217_1_lees.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/0222_2_spitzer.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/parkinson.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/ln15ahms2066.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/antidepresedtive.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/anticonvulsants.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/ln2425_antimic.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/ln2627hms5885.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-151-principles-of-pharmacology-spring-2005/lecture-notes/ln2829ahms7471.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture02.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture03_lod.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture03_hand.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture03.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture04.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture05.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture06_housma.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture06.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture07.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture09.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture10_giersch.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture10.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture11.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture12.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture13.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture14.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture16.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture17.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture18.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture19.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture20.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture21.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture22.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture23.pdf
https://ocw.mit.edu/courses/health-sciences-and-technology/hst-161-molecular-biology-and-genetics-in-modern-medicine-fall-2007/lecture-notes/lecture24.pdf
https://ocw.mit.edu/courses/mechanical-engineering/2-785j-cell-matrix-mechanics-fall-2014/readings/MIT2_785JF14_Chapter_6.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Collagen.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Chaperonins.pdf
https://ocw.mit.edu/courses/biology/7-88j-protein-folding-and-human-disease-spring-2015/study-materials/MIT7_88JS15_Ribosomes.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec02.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec03.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec04.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec05.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec06.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec07.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec08.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec09.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec10.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec11.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec12.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec13.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec14.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec15.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec16.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec17.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec18.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec19.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec20.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec21.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec22.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec23.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec24.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-083j-integer-programming-and-combinatorial-optimization-fall-2009/lecture-notes/MIT15_083JF09_lec25.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l01_earlydev.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l02_fifties.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l03_sixties.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l04_microprog.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l05_singlecycle.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l06_pipeline.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l07_caches.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l08_caches_2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l09_add_trans.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l10_vrtl_mem.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l11_cmplx_pipes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l12_ooo_pipes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l13_brnchpred.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l14_superscalar.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l15_micro_evlutn.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l16_smps_sc.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l17_cc.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l18_ccprotocols.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l19_snoopy_prot.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l20_relaxedmm.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l21_vliw.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l22_vector.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l23_multithread.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l24_reliability.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-823-computer-system-architecture-fall-2005/lecture-notes/l25_vms.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec2_concurrency.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec2_events.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec3_events.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec4_nfs.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec5_rpc.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec6_crash.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec7_logging.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec8_cache.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec9_memory.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec11_memory.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec12_vector.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec13_twophase.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec14_paxos.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec15_viewstamp.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec16_harp.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec18_frangipani.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-824-distributed-computer-systems-engineering-spring-2006/lecture-notes/lec19_scalable.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_xv6-sourc-rev7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_xv6-book-rev7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec1_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec2_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec3_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec4_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec4_handout.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec5_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec5_handout.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec6_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec7_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec8_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec9_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec10_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec11_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec13_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec17_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec18_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec21_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-828-operating-system-engineering-fall-2012/lecture-notes-and-readings/MIT6_828F12_lec22_notes.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_TimeSpace.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Relativ.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Circuits.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_UniqueSAT.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Todas.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_AC0Lower.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Razborov.pdf
http://theory.cs.princeton.edu/uploads/Compbook/accnexp.pdf
http://www.cs.toronto.edu/~toni/Courses/CommComplexity2014/Lectures/lecture1.pdf
http://www.cs.toronto.edu/~toni/Courses/CommComplexity2014/Lectures/lecture2.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Random.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_IntroPCP.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Linearity.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_Exponential.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_SumCheck.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_UGC_MAX2LIN.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_P_vs_BPP1.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_P_vs_BPP2.pdf
wget https://ocw.mit.edu/courses/mathematics/18-405j-advanced-complexity-theory-spring-2016/lecture-notes/MIT18_405JS16_CircuitLower.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec01.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Feb19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Feb24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Feb26.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar19_1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_course_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Probability.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Random_Proc.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec1.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec1.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec1_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec2and3.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs2and3_notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Preliminaries.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec03.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec1_unconstr_opt.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec3_newton_mthd.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec4_quad_form.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec5_steep_desce.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec6_constr_opt.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec9_project_mthd.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec10_penalty_mt.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec12_barrier_mt.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec14_int_pt_mthd.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec16_convex_sets.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec18_duality_thy.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec21_hw_probs.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec_comp.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec03b.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec11_12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-035-computer-language-engineering-spring-2010/lecture-notes/MIT6_035S10_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-231-dynamic-programming-and-stochastic-control-fall-2015/lecture-notes/MIT6_231F15_Lec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec14.pdf
http://www.athenasc.com/convexdualitychapter.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec22.pdf
http://web.mit.edu/dimitrib/www/Incremental_Survey_LIDS.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-253-convex-analysis-and-optimization-spring-2012/lecture-notes/MIT6_253S12_lec25.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec22_gen_prgm_o.pdf
wget https://ocw.mit.edu/courses/sloan-school-of-management/15-084j-nonlinear-programming-spring-2004/lecture-notes/lec23_semidef_opt.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec25.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-301-solid-state-circuits-fall-2010/recitations/MIT6_301F10_rec26.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-432-stochastic-processes-detection-and-estimation-spring-2004/recitations/rec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec15-16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-438-algorithms-for-inference-fall-2014/lecture-notes/MIT6_438F14_Lec24.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec4.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec4_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec5.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec5_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec6.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec6_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec7.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec7_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs8_9_10.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs8_9_10_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec11.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec11_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec12.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec12_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs13and14.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs13_14_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec15.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec15_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs16_17.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs16_17_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs18_19.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs18_19_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec20_toupload.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec20_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec21.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec21_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec22.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec22_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec24.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec24_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec25.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec26.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec1_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec2and3.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs2and3_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec4.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec4_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec5.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec5_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec6.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec6_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec7.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec7_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs8_9_10.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs8_9_10_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec11.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec11_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec12.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec12_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs13and14.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs13_14_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec15.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec15_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs16_17.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs16_17_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs18_19.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lecs18_19_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec20_toupload.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec20_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec21.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec21_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec22.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec22_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec24.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec24_notes.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec25.pdf
wget https://ocw.mit.edu/courses/aeronautics-and-astronautics/16-920j-numerical-methods-for-partial-differential-equations-sma-5212-spring-2003/lecture-notes/lec26.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect1_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect2_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect3_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect4_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect5_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect6_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect7_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect8_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect9_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect10_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect11_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect12_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect13_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect14_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect15_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect16_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect17_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect18_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect19_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect20_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect21_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect22_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect23_Notes.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-453-quantum-optical-communication-fall-2016/readings-and-lecture-slides/MIT6_453F16_Lect23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_25.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_26.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_27.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-441-information-theory-spring-2016/lecture-notes/MIT6_441S16_chapter_28.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar19_2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-635-advanced-electromagnetism-spring-2003/lecture-notes/Mar31.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-661-receivers-antennas-and-signals-spring-2003/lecture-notes/lecture24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-685-electric-machines-fall-2013/course-notes/MIT6_685F13_chapter12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec07b.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec09_selinger.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-830-database-systems-fall-2010/lecture-notes/MIT6_830F10_lec20b.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_02.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect01_intro.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect02_know.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect03_dendral.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect04_case.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect06_rules.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect07_semcnets.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect08_logic.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect09_frames.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect10_uncert.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect12_pragmatic.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect13_whatkr.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect14_causal.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect15_mbr.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect17_constrain.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-871-knowledge-based-applications-systems-spring-2005/lecture-notes/lect22_ontolog.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect3.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture1_2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l1_2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture3_4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l3_4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture7_8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture9_10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture1.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture2.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture3A.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture3S.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture4.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture5.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture6.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn01.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture9.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-introduction-to-c-and-c-january-iap-2013/lectures-and-assignments/MIT6_S096_IAP13_lec7.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-introduction-to-c-and-c-january-iap-2013/lectures-and-assignments/MIT6_S096_IAP13_lec8.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/lecture-notes/MIT6_S096IAP14_Lecture10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-972-algebraic-techniques-and-semidefinite-optimization-spring-2006/lecture-notes/lecture_22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec05.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-079-introduction-to-convex-optimization-fall-2009/lecture-notes/MIT6_079F09_lec19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/L20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-973-organic-optoelectronics-spring-2003/lecture-notes/20b.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-945-adventures-in-advanced-symbolic-programming-spring-2009/assignments/MIT6_945s09_assn08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture11_12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l11.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture13_14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l13_14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/lecture15_16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l23.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l24.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l25.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-897-selected-topics-in-cryptography-spring-2004/lecture-notes/l26.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/interconnection.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect14.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect18.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect19.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect20.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect21.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/lect22.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-896-theory-of-parallel-hardware-sma-5511-spring-2004/lecture-notes/area_universal.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_04.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_05.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_06.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_07.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_09.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_11.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_12.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_13.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_14a.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_14b.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_15.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_16.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_17.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_18.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_19.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_22.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_23.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_25.pdf
wget https://ocw.mit.edu/courses/institute-for-data-systems-and-society/ids-505j-engineering-economics-and-regulation-of-the-electric-power-sector-spring-2010/lecture-notes/MITESD_934S10_lec_26.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec02.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec03.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec04.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec05.pdf
http://people.csail.mit.edu/rivest/RivestShamir-mpay.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec06.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec07.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec08.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec09.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec10.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec11.pdf
wget https://eprint.iacr.org/2013/449.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec12.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec13.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec14.pdf
http://www.ams.org/notices/199902/boneh.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec15.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec16.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec17.pdf
wget https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-857-network-and-computer-security-spring-2014/lecture-notes-and-readings/MIT6_857S14_Lec18.pdf
