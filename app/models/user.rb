class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many    :messages
  has_many    :contacts
  has_many    :members
  has_many    :groups, through: :members
  has_many    :any_informations
  has_many    :informations, through: :any_informations
  belongs_to  :category
  #フォロー申請のアソシエーションと処理の定義
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

# フォローしているかしていないか調べる処理
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

# フォローをする処理
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

# フォローを解除する処理
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  mount_uploader :image, ImageUploader

end
