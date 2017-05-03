set :application, 'fitclubs'
set :tmp_dir, '/var/www/fitclubs/tmp'
set :repo_url, 'https://github.com/topolnyak012/fitclubs'
set :password, ask('Server password:', nil, echo: false)
set :bundle_flags, "--deployment"
set :default_shell, '/bin/bash -l'
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')
set :linked_dirs,  fetch(:linked_dirs, []).push('log', 'pids',  'tmp/pids', 'tmp/cache', 'tmp/sockets',
                'vendor/bundle', 'public/system', 'frontend/node_modules', 'frontend/bower_components')

after 'deploy:assets:precompile', 'ember:build_frontend'
after 'deploy:publishing',        'deploy:restart'