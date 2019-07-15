# == Schema Information
#
# Table name: meta
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meta < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # order:
  # [
  #   {"position"=>6, "id"=>10},
  #   {"position"=>5, "id"=>6},
  #   {"position"=>7, "id"=>7},
  # ]
  def self.reorder(user_id:, order:)
    ids = order.map{|item| item['id'] }
    pos = order.map{|item| item['position'] }.sort.reverse
    transaction do
      ids.each_with_index do |id, index|
        meta = find_by(user_id: user_id, task_id: id)
        if meta.update(position: pos[index])
          Rails.logger.debug("Meta update #{pos[index]}: #{meta.inspect}")
        else
          Rails.logger.error("Meta update: #{meta.errors}")
        end
      end
    end
  end
end
