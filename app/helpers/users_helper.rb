module UsersHelper
    def gravatar_for(user,options = {size:200})
        user_email = user.email.downcase
        hash = Digest::MD5.hexdigest(user_email)
        size = options[:size]
        gravatar_url =  "https://s.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url,alt:user.username,class:"rounded shadow")
    end
    def joined_since(user)
        join_date = DateTime.new(user.created_at.year,user.created_at.month,user.created_at.day,user.created_at.hour)
        date_now = DateTime.now
        day_diff = (date_now - join_date).to_i
        if(day_diff != 0 )
            if day_diff > 30
                if day_diff >360
                   return "#{join_date.year -date_now.year} years"
                else 
                    return "#{join_date.month -date_now.month} months"
                end
            else 
                return "#{day_diff} days"
            end
        else 
            return "#{join_date.hour - date_now.hour} hours"
        end

    end
    def count_articles(id)
        Article.where(user_id:id).length
    end
end
