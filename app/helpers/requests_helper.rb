module RequestsHelper
  def client(client_id)
    Client.find(client_id)
  end

  def user(user_id)
    User.find(user_id)
  end
end
