class Answer < ActiveRecord::Base
	belongs_to :user
	belong_to :comment
end
