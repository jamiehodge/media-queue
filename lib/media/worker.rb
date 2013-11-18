module Media
  class Worker < QC::Worker

    def setup_child
      Persistence::DB.disconnect if defined?(Persistence::DB)
    end
  end
end
