def start
    create_admin
    test_user
end

def create_admin
    data = {
        first_name: "Joma",
        last_name: "Pormentilla",
        email: "jomapormentilla@gmail.com",
        password: ENV['ADMIN_PASSWORD']
    }
    
    User.create(data)
end

def test_user
    data = {
        first_name: "Steve",
        last_name: "Rogers",
        email: "steverogers@gmail.com",
        password: ENV['ADMIN_PASSWORD']
    }
    
    User.create(data)
end

start