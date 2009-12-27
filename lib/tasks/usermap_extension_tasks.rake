namespace :radiant do
  namespace :extensions do
    namespace :usermap do
      
      desc "Runs the migration of the Usermap extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          UsermapExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          UsermapExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Usermap to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from UsermapExtension"
        Dir[UsermapExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(UsermapExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
