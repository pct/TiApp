group 'styles' do
  guard 'sass', :output => 'Resources', :output_format => 'jss' do
    watch(%r{^stylesheets/.+\.sass}) { puts 'compiling sass' }
    watch(%r{^stylesheets/.+\.scss}) { puts 'compiling scss' }
  end
end

group 'coffee' do
  guard 'shell' do
    watch(%r{app/(.+\.coffee)}) do
      puts 'compiling coffeescript'
      `coffee -p --bare src > Resources/ti_app.js`
    end
  end
end
