Dir.chdir('lib') do
  Dir['monkey_patches/**/*'].each do |name|
    require name
  end
end

if Rails.env.development?
  monkey_patches_reloader = ActiveSupport::FileUpdateChecker.new(Dir['lib/monkey_patches/**/*'], {Rails.root.join('lib/monkey_patches') => 'rb'}) do |attrs|
    Dir.chdir('lib') do
      Dir['monkey_patches/**/*'].each do |name|
        load name
      end
    end
  end

  ActionDispatch::Reloader.to_prepare do
    monkey_patches_reloader.execute_if_updated
  end

  Rails.application.reloaders << monkey_patches_reloader
end