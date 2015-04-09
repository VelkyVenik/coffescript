util = require('util')
dhcpjs = require('dhcpjs')

# server = dhcpjs.createServer()
#
# server.on 'message', (m) ->
#     console.log(util.inspect(m, false, 3))
#
# server.on 'listening', (address) ->
#     console.log('listening on ' + address)
#
# server.bind();


client = new dhcpjs.Client

client.on 'message', (pkt) ->
    console.log 'message:', util.inspect(pkt, false, 3)

client.on 'dhcpOffer', (pkt) ->
    console.log 'dhcpOffer:', util.inspect(pkt, false, 3)

client.on 'dhcpAck', (pkt) ->
    console.log 'dhcpAck:', util.inspect(pkt, false, 3)

client.on 'dhcpNak', (pkt) ->
    console.log 'dhcpNak:', util.inspect(pkt, false, 3)

client.on 'listening', (addr) ->
    console.log 'listening on', addr


client.bind '0.0.0.0', 68, ->
    console.log 'bound to 0.0.0.0:68'


pkt =
    xid: 0x01
    chaddr: '00:88:65:39:2a:7c'
    options:
        dhcpMessageType: dhcpjs.Protocol.DHCPMessageType.DHCPDISCOVER
        clientIdentifier: 'MyMachine'


discover = client.createDiscoverPacket pkt
client.broadcastPacket discover, undefined, ->
    console.log 'dhcpDiscover: sent'
