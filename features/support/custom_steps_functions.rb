def create_or_find_user(email, password)
  unless user = User.find_by_email(email)
    user = User.create!({:email => email, :password => password, :password_confirmation => password})
  end
  user
end
