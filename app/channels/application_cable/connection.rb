module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      self.current_user = if cookies.encrypted[:user_id]
        User.find(cookies.encrypted[:user_id])
      else
        nil
      end
    end
  end
end
