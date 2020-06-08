title 'Tests to confirm gdal exists'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'gdal')
plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
command_relative_path = input('command_relative_path', value: '/bin/gdalenhance')
command_full_path = plan_installation_directory.stdout.strip + "#{command_relative_path}"

control 'core-plans-gdal-exists' do
  impact 1.0
  title 'Ensure gdal exists'
  desc '
  Verify gdal by ensuring /bin/gdalenhance exists'
  
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end

  describe file(command_full_path) do
    it { should exist }
  end
end
