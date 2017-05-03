if Rails.env.development?
  require 'listen/record/symlink_detector'
  module Listen
    class Record
      class SymlinkDetector
        def _fail(_, _)
          fail Error, "Don't watch locally-symlinked directory twice"
        end
      end
    end
  end
end