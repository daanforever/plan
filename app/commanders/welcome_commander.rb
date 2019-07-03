class WelcomeCommander < Fie::Commander
  def subscribed
    super
    redis.rpush "user_#{current_user.id}", params[:identifier]
  end

  def unsubscribed
    super
    redis.lrem("user_#{current_user.id}", 0, params[:identifier])
  end
end
