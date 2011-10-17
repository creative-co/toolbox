##db_assets_manager

Easily work with views and functions.

Put plain SQL queries for views into `RAILS_ROOT/db/views/<view_name>.sql`  
Put function declarations into `RAILS_ROOT/db/functions/<function_name>.sql`

You can create/destroy assets using `db:assets:create` and `db:assets:destroy` rake tasks.
Also, `db:assets:create` runs automatically after `db:migrate`.

##Installation:

	git "git://github.com/cloudcastle/toolbox.git" do
	  gem "db_assets_manager"
	end