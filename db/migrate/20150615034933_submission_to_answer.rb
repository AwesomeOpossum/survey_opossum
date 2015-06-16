class SubmissionToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :submission_id, :integer
  end
end
