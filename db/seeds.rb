tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

Post.create(user_id: tom.id, title: 'Hello', text: 'This is my first post.')
Post.create(user_id: tom.id, title: 'Hi', text: 'This is my second post.')
Post.create(user_id: tom.id, title: 'Atomic Habits', text: 'This power of habits.')
Post.create(user_id: tom.id, title: 'Paris', text: 'Experience my journey.')

Comment.create(post_id: 3, user_id: tom.id, text: 'Great book!' )
Comment.create(post_id: 3, user_id: tom.id, text: 'Loved every chapter.' )
Comment.create(post_id: 3, user_id: tom.id, text: 'So useful' )
Comment.create(post_id: 3, user_id: tom.id, text: 'I\'d love to read it again.' )
Comment.create(post_id: 3, user_id: tom.id, text: 'Favorite book' )
Comment.create(post_id: 3, user_id: tom.id, text: 'I recommended it to all my friends' )
