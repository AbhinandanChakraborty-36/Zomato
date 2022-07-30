module ApplicationHelper
    def get_user(user)
        return User.find(user)
    end   

    def get_restaurant(rest)
        return Restaurant.find(rest)
    end
end
