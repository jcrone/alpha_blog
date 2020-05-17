module ApplicationHelper

  def gravatar_for(user)
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    # compile URL which can be used in <img src="RIGHT_HERE"...
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
    image_tag(gravatar_url, alt: @user.username)
  end
end
