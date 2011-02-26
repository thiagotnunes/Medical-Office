def create_or_find_user(email, password)
  unless user = User.find_by_email(email)
    unless role = Role.find_by_name('admin')
      role = Role.create!(:name => 'admin')
    end
    user = User.create!(:email => email, :password => password, :password_confirmation => password, :role => role)
  end
  user
end
