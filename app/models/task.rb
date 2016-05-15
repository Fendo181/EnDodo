class Task < ActiveRecord::Base
  #project referencesの部分
  belongs_to :project
   
  validates :title,presence: true
  
  #doneがfalseの物を検索して保存する。
  scope :unfinished, ->{where(done: false)}
  
end
