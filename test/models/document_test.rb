# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  status      :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  description :text
#  attachment  :string
#  deleted_at  :datetime
#

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
