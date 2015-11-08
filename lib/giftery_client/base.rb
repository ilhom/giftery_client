module GifteryClient

  class Base
    BASE_URL = "https://api.giftery.ru"

    @@id = nil
    @@secret = nil
    @@crt_cert_path = nil
    @@key_path = nil

    def self.set_id(id)
      @@id = id
    end

    def self.get_id
      @@id
    end

    def self.set_secret(secret)
      @@secret = secret
    end

    def self.get_secret
      @@secret
    end

    def self.set_crt_cert_path(crt_cert_path)
      @@crt_cert_path = crt_cert_path
    end

    def self.get_crt_cert_path
      @@crt_cert_path
    end

    def self.set_key_path(key_path)
      @@key_path = key_path
    end

    def self.get_key_path
      @@key_path
    end

    def self.get_sig(cmd, data)
      md5 = Digest::MD5.hexdigest( cmd.to_s + data.to_s + get_secret.to_s )
      md5[0..7]
    end

    def self.encode_path_params(path, params)
      encoded = URI.encode_www_form(params)
      [path, encoded].join("?")
    end

    # send request
    def self.send_request(cmd, data)
      # params to send
      params = {
          id: get_id,
          sig: get_sig(cmd, data),
          cmd: cmd,
          data: data,
          out: 'json'
      }
      full_path = encode_path_params("/", params) # params

      cert = File.read(get_crt_cert_path)
      key = File.read(get_key_path)

      # Send Get request
      uri = URI.parse(BASE_URL)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.cert = OpenSSL::X509::Certificate.new(cert)
      http.key = OpenSSL::PKey::RSA.new(key)
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request = Net::HTTP::Get.new(full_path)
      response = http.request(request)

      json = JSON.parse(response.body)
      return json


    end

  end

end