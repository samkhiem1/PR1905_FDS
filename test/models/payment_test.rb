# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  used_id    :integer
#  buyer_id   :integer
#  coin       :integer
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
