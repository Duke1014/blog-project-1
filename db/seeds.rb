require "faker"

25.times do
    username = Faker::Internet.username
    password = Faker::Internet.password
    email = Faker::Internet.email
    user = User.new(
        username: username,
        password: password,
        email: email,
    )
    40.times do
        title = Faker::Lorem.sentence
        content = Faker::Lorem.paragraph
        blog = user.blogs.new(
            title: title,
            content: content,
            user_id: user.id
        )
        10.times do
            comment_content = Faker::Lorem.paragraph
            blog.comment.new(
                content: comment_content,
                blog_id: blog.id,
                user_id: rand(1..25)
            )
        end
    end

end
