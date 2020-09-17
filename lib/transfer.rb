class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else false
    end
  end

  def execute_transaction
    if sender.balance > @amount && @status == "pending" && self.valid?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance > @amount && @status == "complete" && self.valid?
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
