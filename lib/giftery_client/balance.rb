module GifteryClient
  class Balance < GifteryClient::Base

    def get_balance
      cmd = 'getBalance' # action test connection
      data = "" # empty data
      sig = self.class::get_sig(cmd, "")
      self.class::send_request(cmd, data, sig)
    end

  end
end
