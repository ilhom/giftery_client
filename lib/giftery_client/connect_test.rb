module GifteryClient
  class ConnectTest < GifteryClient::Base

    def test_connecttion
      cmd = 'test' # action test connection
      data = "" # empty data
      sig = self.class::get_sig(cmd, "")
      self.class::send_request(cmd, data, sig)
    end

  end
end
