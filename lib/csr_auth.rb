require "csr_auth/version"
require "helpers/configuration"

module CsrAuth
  extend Configuration
  
  define_setting :allowed_origins, "*"

  class Filter

    include CsrAuth
    
    def self.block_csr?(request)
  	 if request.format.html?
        return true
     else
        block = true
        unless request.headers['origin'].nil?
          if @@allowed_origins == "*"
            block = false
          else
            @@allowed_origins.each do |origin|
              if origin[:origin].class == String
                if request.headers['origin'].start_with? origin[:origin]
                  block = block_method? origin[:methods], request.method
                  break
                end
              elsif origin[:origin].class == Regexp
                if request.headers['origin'] =~ origin[:origin]
                  block = block_method? origin[:methods], request.method
                  break
                end
              end
            end
          end
        end
        block
      end
    end

    private
    def self.block_method?(origin_methods, request_method)
      if origin_methods == :all
        false
      else
        origin_methods = [].push(origin_methods) if origin_methods.class == Symbol
        origin_methods.exclude?(request_method.downcase.to_sym)
      end
    end
  end
end
