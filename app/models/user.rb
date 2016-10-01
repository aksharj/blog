class User < ActiveRecord::Base
    validates :username,presence:true,uniqueness:{case_sensitive:false},length:{minimum:3, maximum:25}
    validates :email,presence:true,uniqueness:{case_sensitive:false},length:{maximum:105}
end