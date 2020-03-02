# == Schema Information
#
# Table name: downloads
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  document_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
