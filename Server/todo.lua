---------------NETWORKING----------------------------

--[[server:
--autodiscovery ??
*searching for server...*
create a socket
broadcast to all clients(randomdata) or own_ip
clients recieve broadcast 
clients parse/get ip from server
clients save server ip
clients init connection to server
*found server!*
gmae begins
--autodiscovery ?? end

create socket
while chikaisgod:

listen to incomming messages
redistribute messages to all clients except original sender each second
send enemydata to all clients
render all shit

end
]]

--[[client:
create socket
while allplayersarenoobs:

send playerdata to server
recieve otherplayerdata from server
recieve enemy data from server
render all shit

end

data = socket:recieve()
entityname, entitydata = parseData(data)
if entityname not in entitylist then
    Player:create(entitydata)
end
for k, v in entitylist do
    if k == entityname then
        k.update(entitydata)
    end
end
]]