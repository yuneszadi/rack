require 'rack'

app = Proc.new do |env|
  [
    200,
    { 'Content-Type' => 'text/plain' },
    ["Welcom aboard!\n"]
  ]
end

Rack:Mandler:WEBrick.run app
