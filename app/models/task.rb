class Task < ApplicationRecord
    validates :title, presence: true

    has_many :users_task
    has_many :users, through: :users_task
    belongs_to :list

    def status
        completed ? "Complete" : "Incomplete"
    end 

    def user_accepted(user)
        users_task.find{|user_task|user_task.user_id == user.id}.accepted
    end 
    
end
