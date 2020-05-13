# Interface
class Network
  def rpc_call; end
end
# ================

class Server < Network
  def initialize(name)
    @name = name
  end

  def rpc_call
    puts "#{@name} info:"
    system('uname -amnprsv')
  end
end

class Proxy < Network
  def initialize(instance)
    @access_token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @headers = {}

    @instance = instance
  end

  def send_headers(headers)
    raise TypeError, 'Must be a Hash' unless headers.is_a?(Hash)

    @headers.merge(headers)
  end

  def rpc_call
    raise NotAuthorizedError unless authorized?

    @instance.rpc_call
  end

  private

  def authorized?
    @headers['Authorization'] == @access_token
  end
end

