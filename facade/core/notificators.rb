# Prototypes
class Notificator; end
class BuyerNotificator < Notificator; end
class GuestNotificator < Notificator; end
# =================

# Interface
class Notificator
  def send_email; end
end
# =================

class BuyerNotificator < Notificator
  def initialize(user, order)
    @user = user
    @order = order
  end

  def call
    send_email
    send_account_notification
  end

  private

  def send_email
    puts "Sending notification to #{@user.email}"
  end

  def send_account_notification
    puts "Sending notification to #{@user.first_name} #{@user.last_name} account"
  end
end

class GuestNotificator < Notificator
  def initialize(user, order)
    @user = user
    @order = order
  end

  def call
    send_email
  end

  private

  def send_email
    puts "Sending notification to #{@user.email}"
  end
end
