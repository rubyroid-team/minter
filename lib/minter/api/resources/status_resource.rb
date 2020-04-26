module Minter
  module Api
    module Status
      def status
        path =  '/status'            
        get(path)
      end
    end
  end
end
