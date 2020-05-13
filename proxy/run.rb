require_relative 'autoload'

instance = Server.new('Bastion')
proxy = Proxy.new(instance)

headers = {}
proxy.send_headers(headers)
proxy.rpc_call
