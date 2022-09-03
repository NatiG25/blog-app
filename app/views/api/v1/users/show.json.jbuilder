json.id @user.id
json.name @user.name

json.current do
    json.post @user.posts
end