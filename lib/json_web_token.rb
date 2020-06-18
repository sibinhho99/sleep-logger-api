class JsonWebToken
  # Wrapper library for encoding and decoding JWTs.
  SECRET_KEY_BASE = ENV['SECRET_KEY_BASE']
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY_BASE)
    end

    def decode(token)
      HashWithIndifferentAccess.new(JWT.decode(token, SECRET_KEY_BASE)[0])
    rescue
      nil
    end
  end
end