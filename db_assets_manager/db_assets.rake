namespace :db do
  task :migrate do
    Rake::Task['db:assets:create'].invoke
  end

  namespace :assets do
    task :create => :environment do
      create_object = lambda do |object|
        return unless @objects_to_create.include? object

        object_sql = File.read("db/#{object[:type] == :view ? 'views' : 'functions'}/#{object[:name]}.sql")
        @objects_to_create.select {|obj| (obj[:name] != object[:name]) && object_sql.match(/#{obj[:name]}/) }.each {|obj| create_object.call(obj)}

        if object[:type] == :view
          ActiveRecord::Base.connection.execute("CREATE VIEW #{object[:name]} AS #{object_sql}")
          puts "#{object[:name]} VIEW CREATED"
        else
          ActiveRecord::Base.connection.execute(object_sql)
          puts "#{object[:name]} FUNCTION CREATED"
        end

        @objects_to_create.delete_if do |obj|
          obj[:name] == object[:name] && obj[:type] == object[:type]
        end
      end

      functions = Dir.glob('db/functions/*.sql').map {|name| { :name => name.match(/([^\/]*?).sql/)[1], :type => :function } }
      views =     Dir.glob('db/views/*.sql').    map {|name| { :name => name.match(/([^\/]*?).sql/)[1], :type => :view } }

      @objects_to_create = functions + views

      views.each do |view|
        ActiveRecord::Base.connection.execute("DROP VIEW IF EXISTS #{view[:name]} CASCADE;")
        puts "#{view[:name]} VIEW DROPPED"
      end

      while (object = @objects_to_create.first).present?
        create_object.call object
      end
    end

    task :drop => :environment do
      Dir.glob('db/views/*.sql').
          map {|name| name.match(/([^\/]*?).sql/)[1] }.
          each {|name| ActiveRecord::Base.connection.execute("DROP VIEW IF EXISTS #{name} CASCADE;"); puts "#{name} VIEW DROPPED"; }

      Dir.glob('db/functions/*.sql').each do |name|
        function_signature = File.read(name).match(/FUNCTION (.*?) RETURNS/i)[1]
        ActiveRecord::Base.connection.execute("DROP FUNCTION IF EXISTS #{function_signature} CASCADE")
        puts "#{function_signature} FUNCTION DROPPED"
      end
    end
  end
end