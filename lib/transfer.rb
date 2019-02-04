require 'pry'
class Transfer
  
attr_accessor :sender, :status, :amount, :receiver
 
 def initialize(sender, receiver, amount) 
   
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = amount
 
 end
 
 def valid?
   
   if sender.valid? == true && receiver.valid? == true
     
     return true
     
   end
   
   @status = "rejected"
   false
   
 end
 
 
 
 def execute_transaction
   
  
   
   if sender.valid? == false
     
  
     @status = "rejected"
     return
   
   end
     
     
  if @status != "pending"
    
  
     @status = "rejected"
     return
   
   end
   
  if sender.balance < @amount
    

      @status = "rejected"
      return
  end
  

  sender.balance -= @amount
  receiver.balance += @amount
  @status = "complete"
  
 end
 
 def reverse_transfer
   
   if @status == "complete"
     sender.balance += @amount
     receiver.balance -= @amount
     @status = "reversed"
    end 
   
 end
 
end

