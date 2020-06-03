title 'Tests to confirm gdal works as expected'

plan_name = input('plan_name', value: 'gdal')
plan_ident = "#{ENV['HAB_ORIGIN']}/#{plan_name}"

control 'core-plans-gdal-works' do
  impact 1.0
  title 'Ensure gdal works as expected'
  desc '
  '
  gdal_path = command("hab pkg path #{plan_ident}")
  describe gdal_path do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end
  
  gdal_pkg_ident = ((gdal_path.stdout.strip).match /(?<=pkgs\/)(.*)/)[1]
  describe command("DEBUG=true; hab pkg exec #{ gdal_pkg_ident} gdalenhance --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stdout') { should match /GDAL 2.4.0/ }
    its('stderr') { should be_empty }
  end
end
