module GifteryClient
  class Products < GifteryClient::Base

    def get_products
      cmd = 'getProducts' # action test connection
      data = "" # empty data
      sig = self.class::get_sig(cmd, "")
      self.class::send_request(cmd, data, sig)
    end

  end
end
