local v0 = {
    IDENTIFIER_CAP = 65536, 
    IDENTIFIER_CAP_STRING = "2^16", 
    SERVER_CONNECT_LOG = "connection '%*' was triggered by [%*] with data: \n===============\n%* (%*B)\n===============\nat: script %* line %*", 
    SERVER_FIRE_LOG = "fired bridge '%*' to players: %* with data: \n===============\n%* (%*B)\n===============\n", 
    CLIENT_CONNECT_LOG = "connection '%*' was triggered with data: \n===============\n%* (%*B)\n===============\nat: script %* line %*", 
    CLIENT_FIRE_LOG = "fired bridge '%*' with data: \n===============\n%* (%*B)\n===============\n"
};
return (table.freeze(v0));