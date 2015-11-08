module GifteryClient
  class ConnectTest < GifteryClient::Base

    def test_connecttion
      cmd = 'test' # action test connection
      data = "" # empty data
      self.class::send_request(cmd, data)
    end

  end
end
