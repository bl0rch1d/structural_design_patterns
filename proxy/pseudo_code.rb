class Network
  def rpc_call; end
end

NotAuthorizedError = Class.new(StandardError)

class Server < Network
  def initialize(name); end
  def rpc_call; end
end

class Proxy < Network
  def initialize(instance); end
  def send_headers(headers); end
  def rpc_call; end

  private

  def authorized?; end
end

instance = Server.new('Bastion')
proxy = Proxy.new(instance)

headers = {}
proxy.send_headers(headers)
proxy.rpc_call
