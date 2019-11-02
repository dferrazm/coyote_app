class AcmeAPI::ProductDetails
  attr_reader :user_manual

  def initialize(details)
    @user_manual = details.fetch('user_manual', '')
  end

  def user_manual?
    !user_manual.empty?
  end
end
