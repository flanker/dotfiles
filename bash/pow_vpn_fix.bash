alias fixpow='sudo ipfw delete 2 && sudo ipfw delete 3 && sudo ipfw add 2 fwd 127.0.0.1,20559 tcp from any to me dst-port 80 in && sudo ipfw add 3 skipto 65535 ip from any to any via lo\*'