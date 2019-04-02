# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  key        :string
#  value      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Settings < ApplicationRecord
	include Settingson::Base
end
