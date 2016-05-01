# CsrAuth

Allow CORS(Cross Origin Resource Sharing) via AJAX requests from trusted web applications to your Rails Back-End.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csr_auth'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install csr_auth

## Usage

### Generate Initializer

    $ rails generate csr_auth:install
    
### Edit Initializer
Allowed origins can be specified in the generated Rails intializer:

    config/initializers/csr_auth.rb
    
Configure allowed origins and allowed methods for each origin as shown:

```ruby
# Tell CsrAuth the origins that will send AJAX requests

CsrAuth.configuration do |config|
 # Cross Origin Resource Sharing via remote requests will be allowed only for the specified origins.
 # By default the value is set to '*', allows all origins and request methods
 config.allowed_origins = "*"

 # Examples:
 # config.allowed_origins = {:origin => 'http://localhost:3000', :methods => :all}
 # config.allowed_origins = {:origin => '127.0.0.1:3000', :methods => :all}, {:origin => 'chrome-extension://my_extension_id', :methods => [:get, :post, :put]}
end
```

#### Hash Description
__:origin__ => The origin that will send cross script requests to your Rails app. You can pass either a string or a regex.\
__:methods__ => The allowed methods for a request from an origin. Value can either be *:all* for all methods or an array of allowed methods - *[:get, :post, :delete]*.\
_"*"_ => Allows requests from all origins and methods.

__NOTE__: When passing a Regex be sure not to be too inclusive.

### Modify Application Controller
```ruby
class ApplicationController < ActionController::Base
  require 'csr_auth'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, if: :block_csr?
  #before_filter :chrome_extension
  
  private
  def block_csr?
    CsrAuth::Filter.block_csr? request
  end
```
1. Create a private method like - `block_csr?` and call CsrAuth's filter method passing in the request object - `CsrAuth::Filter.block_csr? request`
2. Change line - `protect_from_forgery...` to `protect_from_forgery with: :exception, if: :block_csr?`

## Configuration Examples:
config.allowed_origins = "*"\
config.allowed_origins = {:origin => 'http://localhost:3000', :methods => :all}\
config.allowed_origins = {:origin => '127.0.0.1:3000', :methods => :all}, {:origin => 
'chrome-extension://my_extension_id', :methods => [:get, :post, :put]}\
config.allowed_origins = {:origin => /chrome-extension:\\/\\/my_extension_id/, :methods => :get}, {:origin => /http:\\/\\/localhost:3000/, :methods => [:post, :put]}


## License:
MIT - [SEE HERE](../master/LICENSE)