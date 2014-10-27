require "simple-worker/version"

module SimpleWorker
  class Worker < Queue
    def initialize(num = 1)
      super()
      @workers = []

      num.times do |i|
        @workers << Thread.start do
          loop do
            pop.call(i)
          end
        end
      end
    end

    def push(obj = nil, &block)
      super(obj || block)
    end
  end
end
