module GifteryClient
  class Order < GifteryClient::Base

    def make_order(product_id, face, email_to, from, to = nil, text = nil, code = nil, comment = nil, testmode = "1")
      cmd = 'makeOrder' # action test connection
      data = "product_id=#{product_id}&face=#{face}&email_to=#{email_to}&from=#{from}&testmode=#{testmode}"


      # data = {
      #   product_id: product_id,
      #   face: face,
      #   email_to: email_to,
      #   from: from,
      #   testmode: testmode
      # }

      sig = self.class::get_sig(cmd, data)


      self.class::send_request(cmd, data, sig)
    end

  end
end
