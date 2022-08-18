User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

Post.create(author_id: 1, title: 'Hello', text: 'This is my first post.')
Post.create(author_id: 1, title: 'Hi', text: 'This is my second post.')
Post.create(author_id: 1, title: 'Atomic Habits', text: 'This power of habits.')
Post.create(author_id: 1, title: 'Paris', text: 'Experience my journey.')

Comment.create(post_id: 3, author_id: 1, text: 'Great book!' )
Comment.create(post_id: 3, author_id: 1, text: 'Loved every chapter.' )
Comment.create(post_id: 3, author_id: 1, text: 'So useful' )
Comment.create(post_id: 3, author_id: 1, text: 'I\'d love to read it again.' )
Comment.create(post_id: 3, author_id: 1, text: 'Favorite book' )
Comment.create(post_id: 3, author_id: 1, text: 'I recommended it to all my friends' )
