#!/usr/bin/env ruby

require 'sinatra'

#set :port, 80
set :bind, '0.0.0.0'   

get '/' do
  <<-HTML
    <html>
      <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <style>
          * {
            width: 100%;
            box-sizing: border-box;
          }
        </style>
      </head>
      <body>
        <form method='post'>
          <input type='textarea' name='text'>
          <input type='submit' value='Say'>
        </form>
      </body>
    </html>
  HTML
end

post '/' do
  puts params
  `espeak "#{ params['text'] }" 2>/dev/null`
  redirect '/'
end
