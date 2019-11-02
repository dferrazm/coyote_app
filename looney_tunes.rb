class LooneyTunes
  def initialize(coyote:, acme:)
    @coyote = coyote
    @acme = acme
  end

  def play_episode
    acme_product = @acme.products.sample

    @coyote.use(acme_product)
    @coyote.prepare_plan!
    @coyote.set_trap!

    # ...
  end
end
