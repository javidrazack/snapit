class User < ApplicationRecord
  validates :user_name,:presence => true,length: { minimum: 4, maximum: 16 }, :uniqueness => {  :case_sensitive => false}
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :user_name
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable,
       :validatable, :authentication_keys => [:user_name]

       has_many :posts, dependent: :destroy
end
