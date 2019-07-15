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

require 'rails_helper'

RSpec.describe Meta, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
