title 'Tests to confirm gdal exists'

plan_name = input('plan_name', value: 'gdal')
plan_ident = "#{ENV['HAB_ORIGIN']}/#{plan_name}"
gdal_relative_path = input('command_path', value: '/bin/gdalenhance')
gdal_installation_directory = command("hab pkg path #{plan_ident}")
gdal_full_path = gdal_installation_directory.stdout.strip + "#{ gdal_relative_path}"
 
control 'core-plans-gdal-exists' do
  impact 1.0
  title 'Ensure gdal exists'
  desc '
  '
   describe file(gdal_full_path) do
    it { should exist }
  end
end
