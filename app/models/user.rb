class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.first_name = auth_info.info.first_name
      new_user.last_name  = auth_info.info.last_name
      new_user.token      = auth_info.credentials.token
      new_user.id_token   = auth_info.extra.id_token
      new_user.uid        = auth_info.uid
      new_user.email      = auth_info.info.email
      new_user.image_path = auth_info.info.image
    end
  end
end
