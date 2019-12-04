class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure :production do
  end

  Student = {
    'name' => 'Mr Test',
    'age' => 35,
    'birthday' => '2019-1-1'
  }

  get '/' do
    erb :index, :locals => {:my_var => 'my variable'}
  end

  get '/posts' do
    "#{params['limit']}, #{params['offset']}"
  end

  get '/hello/:name' do
    "Hello #{params['name']}"
  end

  get '/name/*/age/*' do
    params['splat'].inspect
  end

  get '/download/*.*' do
    "Start to download #{params['splat'].inspect}"
  end

  get '/upload/*.*' do |path, ext|
    "Start to upload #{path}.#{ext}"
  end

  get '/json-response' do
    json Student.merge(merged: true)
  end
end