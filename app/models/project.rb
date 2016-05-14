class Project < ActiveRecord::Base
    #空でtitle入力は追加されない
    validates :title,
    presence:{ message:"入力せぇやどアホ"},
    length:{minimum: 3,message:"3文字以上いれろやどアホ"}
end
