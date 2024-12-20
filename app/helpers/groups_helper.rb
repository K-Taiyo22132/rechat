module GroupsHelper
  def home
    if (controller.controller_name == "chats" and controller.action_name == "show") or (controller.controller_name == "messages" and controller.action_name == "index")
      @grouplist = Chat.all
      true
    else
      false
    end
  end

end

