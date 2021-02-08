module Genova
  module Utils
    class Mutex
      def initialize(key)
        @key = key
      end

      def lock
        Redis.current.multi do
          return false unless Redis.current.setnx(@key, true)

          Redis.current.expire(@key, Settings.github.deploy_lock_timeout)
        end

        true
      end

      def locked?
        Redis.current.get(@key) || false
      end

      def unlock
        Redis.current.del(@key) == 1
      end
    end
  end
end
