module MessagesHelper
  def customize(message)
    result = []
    count= message.size
    count1= message.size
    counter = 0
    counter2 = 16
    if count >= 16
    while count >= 16
      result << message.slice(counter,counter2)
      result << "\n"
      counter = counter + 16
      count = count - 16
    end   
  else
    result << message
  end
  if counter >= 16
    result << message.slice(counter,count1-counter)
  end
    return result


  end

end

