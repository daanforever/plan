class TaskChannel < ApplicationCable::Channel
  def redis
    ActionCable.server.pubsub.redis_connection_for_subscriptions
  end
  
  def subscribed
    redis.rpush "user_#{current_user.id}", params[:identifier]
  end

  def unsubscribed
    redis.lrem("user_#{current_user.id}", 0, params[:identifier])
  end

  def reorder(order:)
    Meta.reorder(user_id: current_user.id, order: order)
  end
end
