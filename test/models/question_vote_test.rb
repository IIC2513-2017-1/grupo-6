# == Schema Information
#
# Table name: question_votes
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  question_id :integer
#
# Indexes
#
#  index_question_votes_on_question_id  (question_id)
#  index_question_votes_on_user_id      (user_id)
#

require 'test_helper'

class QuestionVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
