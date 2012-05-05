##db_assets_manager

Easily work with views and functions.

Put plain SQL queries for views into `RAILS_ROOT/db/views/<view_name>.sql`  
Put function declarations into `RAILS_ROOT/db/functions/<function_name>.sql`

You can create/destroy assets using `db:assets:create` and `db:assets:destroy` rake tasks.
Also, `db:assets:create` runs automatically after `db:migrate`.

##jss_template

Provides plain templates to clientside JS.

Put HTMLs you want in JS somewhere in assets subdirectory, give them `jss` extension.  
They will be bundled into JSS top-level JavaScript object respecting paths to them.

For example, `app/assets/javascripts/templates/posts/index.jss` will be available as
String by `JSS.templates.posts.index`.

##js_routes

Provides access from js code to all your application named routes.
In Rails version > 3.1 just require 'routes.js' in your js files or directly include it into view.

You can hide some important routes from js, for example:
`get '/some_secret_route', :to => 'secret_controller#secret_action', :hidden => true`

##monkey_patcher

Requirer and autoreloader (in development) for monkey patches.
Just put your monkey patch files into <rails_root>/lib/monkey_patches directory and relax.

##email_validator

Email validation support (see http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/ for details).
Usage:
`validates :user_email, email: true`


##Installation:

	git "git://github.com/cloudcastle/toolbox.git" do
	  gem "db_assets_manager"
	  gem "jss_template"
	end
