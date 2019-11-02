class UserManualParser
  def self.parse!(user_manual)
    raise 'cannot parse an empty string' if user_manual.empty?

    user_manual.to_s
  end
end
