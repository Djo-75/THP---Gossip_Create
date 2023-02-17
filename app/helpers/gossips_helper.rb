module GossipsHelper
    def verify_user?
        if current_user.id == @gossip.user_id
            return true
        else
            return false
        end
    end
end
