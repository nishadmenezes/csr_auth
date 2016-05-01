# Tell CsrAuth the origins that will send AJAX requests

CsrAuth.configuration do |config|
 # Cross Origin Resource Sharing via remote requests will be allowed only for the specified origins.
 # By default the value is set to '*', allows all origins and request methods
 config.allowed_origins = "*"

 # Examples:
 # config.allowed_origins = {:origin => 'http://localhost:3000', :methods => :all}
 # config.allowed_origins = {:origin => '127.0.0.1:3000', :methods => :all}, {:origin => 'chrome-extension://my_extension_id', :methods => [:get, :post, :put]}
end