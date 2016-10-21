namespace :namespace do

  desc "Data  migration in to local database"
  task data_import: :environment do
    Zombiedatum.data_migration
  end

end
