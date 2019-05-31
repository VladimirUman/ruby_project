module UsersHelper
    CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
    def random_password(length)
        CHARS.sort_by { rand }.join[0...length]
    end
end
