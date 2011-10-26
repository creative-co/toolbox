##db_assets_manager

Easily work with views and functions.

Put plain SQL queries for views into `RAILS_ROOT/db/views/<view_name>.sql`  
Put function declarations into `RAILS_ROOT/db/functions/<function_name>.sql`

You can create/destroy assets using `db:assets:create` and `db:assets:destroy` rake tasks.
Also, `db:assets:create` runs automatically after `db:migrate`.

##jss_template

Provide plain templates to clientside JS.

Put HTMLs you want in JS somewhere in assets subdirectory, give them `jss` extension.  
They will be bundled into JSS top-level JavaScript object respecting paths to them.

For example, `app/assets/javascripts/templates/posts/index.jss` will be available as
String by `JSS.templates.posts.index`.

##Installation:

	git "git://github.com/cloudcastle/toolbox.git" do
	  gem "db_assets_manager"
	  gem "jss_template"
	end