namespace :ember do
  desc 'build ember frontend'
  task :build_frontend do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{release_path}/frontend"
      execute "cd #{release_path}/frontend && npm i"
      execute "cd #{release_path}/frontend && bower i"
      execute "cd #{release_path}/frontend && ./node_modules/ember-cli/bin/ember b -prod --output-path=#{release_path}/builded_frontend"
    end
  end
end