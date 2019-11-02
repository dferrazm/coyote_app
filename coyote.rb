require_relative 'trap'
require_relative 'product_learner'

class Coyote
  def use(acme_product)
    @acme_product = acme_product
  end

  def prepare_plan!
    learn_how_to_use_acme_product
  end

  def set_trap!
    Trap.new(acme_product)
  end

  private

  attr_reader :acme_product

  def learn_how_to_use_acme_product
    ProductLearner.call(acme_product)
  end
end
