class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  has_many :books
end
