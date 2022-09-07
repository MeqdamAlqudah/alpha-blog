module UsersHelper
    def gravatar_for(user,options = {size:200})
        user_email = user.email.downcase
        hash = Digest::MD5.hexdigest(user_email)
        size = options[:size]
        gravatar_url =  "https://s.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url,alt:user.username,class:"rounded shadow")
    end
end
