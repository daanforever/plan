# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  title         :string
#  user_id       :integer
#  assignee_id   :integer
#  assignee_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :task do
    title { "MyString" }
    owner { nil }
  end
end
