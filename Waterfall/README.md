## Details
The default port will be `25577`.

You will need to edit the connected servers within the server's `config.yml`.

Use either your public IP or private IP (If you have a NAT router) for the server config.

Example config:

```
servers:
  lobby:
    motd: '&1Just another Waterfall - Forced Host'
    address: 192.168.1.230:25565
    restricted: false
```
