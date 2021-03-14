def start
    create_admin
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

start