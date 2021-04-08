def start
    create_admin
    test_user
    create_posts
end

def create_admin
    data = {
        first_name: "Joma",
        last_name: "Pormentilla",
        username: "jomapormentilla",
        email: "jomapormentilla@gmail.com",
        password: ENV['ADMIN_PASSWORD'],
        website: "https://github.com/jomapormentilla",
        bio: "Full Stack Software Engineer",
        gender: "Male"
    }
    
    User.create(data)
end

def test_user
    data = {
        first_name: "Tony",
        last_name: "Stark",
        username: "ironman",
        email: "tonystark@gmail.com",
        password: ENV['ADMIN_PASSWORD'],
        website: "https://github.com/jomapormentilla",
        bio: "Billionaire | Philanthropist",
        gender: "Male"
    }
    
    User.create(data)
end

def create_posts
    2.times do
        data = {
            title: Faker::Book.title,
            content: "https://picsum.photos/450",
            user_id: User.all.sample.id
        }

        Post.create(data)
    end
end

start