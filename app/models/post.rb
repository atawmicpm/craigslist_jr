class Post < ActiveRecord::Base
  belongs_to :category

  before_create :generate_key


  private

  def generate_key
    self.secret_key = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Post.where(secret_key: random_token).exists?
    end
  end
end
