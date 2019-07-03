module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      pp cookies.encrypted[:user_id]
      # pp "Current user: #{User.find(cookies.encrypted[:user_id]) if cookies.encrypted[:user_id]}"

      self.current_user = if cookies.encrypted[:user_id]
        User.find(cookies.encrypted[:user_id])
      else
        nil
      end
    end
  end
end
