class AddColumnReviewable < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :reviewable, polymorphic: true, index: true
  end
end
