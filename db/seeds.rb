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
        first_name: "Steve",
        last_name: "Rogers",
        username: "captainamerica",
        email: "steverogers@gmail.com",
        password: ENV['ADMIN_PASSWORD'],
        website: "https://github.com/jomapormentilla",
        bio: "The First Avenger",
        gender: "Male"
    }
    
    User.create(data)
end

def create_posts
    10.times do
        data = {
            title: Faker::Book.title,
            content: Faker::LoremPixel.image,
            user_id: User.all.sample.id
        }

        Post.create(data)
    end
end

start