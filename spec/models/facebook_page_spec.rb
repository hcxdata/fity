# == Schema Information
#
# Table name: facebook_pages
#
#  id                  :integer          not null, primary key
#  account_id          :integer
#  username            :string
#  upcode              :string
#  sync_at             :datetime
#  name                :string
#  bio                 :text
#  link                :string
#  likes               :integer
#  talking_about_count :integer
#  extra               :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe FacebookPage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
