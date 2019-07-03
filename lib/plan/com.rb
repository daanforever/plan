class Plan::Com
  include Fie::Manipulator

  def update(user, variable, value)
    redis.lrange("user_#{user.id}", 0, 1).each do |uuid|
      @fie_connection_uuid = uuid
      state.send("#{variable.to_sym}=".to_sym, value)
    end
  end
end
