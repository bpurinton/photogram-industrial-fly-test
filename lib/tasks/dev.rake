desc "Fill the database tables with some sample data"
task sample_data: :environment do
  p "Creating sample data"

  FollowRequest.destroy_all
  Like.destroy_all
  Photo.destroy_all
  User.destroy_all
  Comment.destroy_all

  10.times do
    user = User.new
    user_hash = Faker::Internet.user('username', 'email', 'password')
    user.username = user_hash[:username]
    user.email = user_hash[:email]
    user.password = user_hash[:password]
    user.private = [true, false].sample
    user.comments_count = rand(100)
    user.likes_count = rand(100)
    user.save
  end

  p "Added #{User.count} Users"
  

  #
#  id                     :bigint           not null, primary key
#  comments_count         :integer          default(0)
#  email                  :citext           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer          default(0)
#  photos_count           :integer          default(0)
#  private                :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
end
