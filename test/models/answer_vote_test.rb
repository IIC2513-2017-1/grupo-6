# == Schema Information
#
# Table name: answer_votes
#
#  id         :integer          not null, primary key
#  delta      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  answer_id  :integer
#
# Indexes
#
#  index_answer_votes_on_answer_id              (answer_id)
#  index_answer_votes_on_user_id                (user_id)
#  index_answer_votes_on_user_id_and_answer_id  (user_id,answer_id) UNIQUE
#

require 'test_helper'

class AnswerVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
