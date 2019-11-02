require_relative 'acme_api'
require_relative 'coyote'
require_relative 'looney_tunes'


puts LooneyTunes.new(
  coyote: Coyote.new,
  acme: AcmeAPI::Client.new
).play_episode
