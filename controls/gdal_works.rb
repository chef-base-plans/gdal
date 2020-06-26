title 'Tests to confirm gdal works as expected'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'gdal')

control 'core-plans-gdal-works' do
  impact 1.0
  title 'Ensure gdal works as expected'
  desc '
  Verify gdal by ensuring that
  (1) its installation directory exists 
  (2) it returns the expected version
  '
  
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stderr') { should be_empty }
  end
  
  plan_pkg_version = plan_installation_directory.stdout.split("/")[5]
  gdal_config_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal-config")
  describe command("#{gdal_config_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /#{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdal_contour_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_contour")
  describe command("#{gdal_contour_full_path} --version") do
      its('exit_status') { should_not eq 0 }
      its('stderr') { should_not be_empty }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
  end
  gdal_grid_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_grid")
  describe command("#{gdal_grid_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdal_rasterize_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_rasterize")
  describe command("#{gdal_rasterize_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdal_translate_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_translate")
  describe command("#{gdal_translate_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdaladdo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaladdo")
  describe command("#{gdaladdo_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdalbuildvrt_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalbuildvrt")
  describe command("#{gdalbuildvrt_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdaldem_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaldem")
  describe command("#{gdaldem_full_path} --version") do
      its('exit_status') { should_not eq 0 }
      its('stdout') { should_not be_empty }
      its('stderr') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
  end
  gdalenhance_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalenhance")
  describe command("#{gdalenhance_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdalinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalinfo")
  describe command("#{gdalinfo_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdallocationinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdallocationinfo")
  describe command("#{gdallocationinfo_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdalmanage_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalmanage")
  describe command("#{gdalmanage_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdalserver_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalserver")
  describe command("#{gdalserver_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdalsrsinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalsrsinfo")
  describe command("#{gdalsrsinfo_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdaltindex_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaltindex")
  describe command("#{gdaltindex_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdaltransform_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaltransform")
  describe command("#{gdaltransform_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gdalwarp_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalwarp")
  describe command("#{gdalwarp_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gnmanalyse_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gnmanalyse")
  describe command("#{gnmanalyse_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  gnmmanage_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gnmmanage")
  describe command("#{gnmmanage_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  nearblack_full_path = File.join(plan_installation_directory.stdout.strip, "bin/nearblack")
  describe command("#{nearblack_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  ogr2ogr_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogr2ogr")
  describe command("#{ogr2ogr_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  ogrinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogrinfo")
  describe command("#{ogrinfo_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  ogrlineref_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogrlineref")
  describe command("#{ogrlineref_full_path} --version") do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /GDAL #{plan_pkg_version}/ }
      its('stderr') { should be_empty }
  end
  ogrtindex_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogrtindex")
  describe command("#{ogrtindex_full_path} --help") do
      its('exit_status') { should_not eq 0 }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /Usage: ogrtindex/ }
      its('stderr') { should be_empty }
  end
  testepsg_full_path = File.join(plan_installation_directory.stdout.strip, "bin/testepsg")
  describe command("#{testepsg_full_path}") do
      its('exit_status') { should eq 0 }
      its('stderr') { should be_empty }
      its('stdout') { should_not be_empty }
      its('stdout') { should match /testepsg \[-xml\]/ }
  end
end