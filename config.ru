require 'rack/contrib/try_static'

use Rack::TryStatic,
    :root => 'public',
    :urls => %w[/],
    :try  => ['.html', 'index.html', '/index.html']

# otherwise 404 NotFound
run lambda { |env|
  [
    404,{
      'Content-Type' => 'text/html'
    }, ['whoops! Not Found']
  ]
}
