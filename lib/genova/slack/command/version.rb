module Genova
  module Slack
    module Command
      class Version
        VERSION = <<~DOC.freeze
          ```
          #{Genova::VERSION::LONG_STRING}
          ```
        DOC

        def self.call(_statements, _user, _parent_message_ts)
          client = Genova::Slack::Bot.new
          client.post_simple_message(text: VERSION)
        end
      end
    end
  end
end
