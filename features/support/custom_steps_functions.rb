def create_or_find_user(email, password)
  unless user = User.find_by_email(email)
    user = User.create!(:email => email, :password => password, :password_confirmation => password)
    role = Role.find_by_name('admin')
    role = Role.create!(:name => 'admin') if role.nil?
    user.roles << role
    user.save!
  end
  user
end
