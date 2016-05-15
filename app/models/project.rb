class Project < ActiveRecord::Base
    #Project1つに対してTaskが複数あるので[has_many :tasks]と記述する。
    has_many :tasks
    
    #空でtitle入力は追加されない
    validates :title,
    presence:{ message:"タイトルを入力してください"},
    length:{minimum: 3,message:"短すぎます!3文字以上入力してください"}
    
   
end
