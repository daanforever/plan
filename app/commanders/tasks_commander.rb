class TasksCommander < Fie::Commander
  def subscribed
    super
    redis.rpush "user_#{current_user.id}", params[:identifier]
  end

  def unsubscribed
    super
    redis.lrem("user_#{current_user.id}", 0, params[:identifier])
  end

  def reorder(order:)
    Meta.reorder(user_id: current_user.id, order: order)
  end
end
