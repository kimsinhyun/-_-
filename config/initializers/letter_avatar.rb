# frozen_string_literal: true

LetterAvatar.setup do |config|
  config.cache_base_path   = "tmp/lets" # default is 'public/system'
  config.colors_palette    = :iwanthue # default is :google
  config.weight            = 500 # default is 300
  config.letters_count     = 2 # default is 1
  config.pointsize         = 150 # default is 140
end
