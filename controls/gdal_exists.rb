title 'Tests to confirm gdal exists'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'gdal')

control 'core-plans-gdal-exists' do
  impact 1.0
  title 'Ensure gdal exists'
  desc '
  Verify gdal by ensuring bin/gdalenhance exists'
  
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stderr') { should be_empty }
  end

  gdal_config_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal-config")
  describe file(gdal_config_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdal_contour_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_contour")
  describe file(gdal_contour_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdal_grid_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_grid")
  describe file(gdal_grid_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdal_rasterize_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_rasterize")
  describe file(gdal_rasterize_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdal_translate_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdal_translate")
  describe file(gdal_translate_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdaladdo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaladdo")
  describe file(gdaladdo_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalbuildvrt_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalbuildvrt")
  describe file(gdalbuildvrt_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdaldem_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaldem")
  describe file(gdaldem_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalenhance_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalenhance")
  describe file(gdalenhance_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalinfo")
  describe file(gdalinfo_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdallocationinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdallocationinfo")
  describe file(gdallocationinfo_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalmanage_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalmanage")
  describe file(gdalmanage_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalserver_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalserver")
  describe file(gdalserver_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalsrsinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalsrsinfo")
  describe file(gdalsrsinfo_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdaltindex_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaltindex")
  describe file(gdaltindex_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdaltransform_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdaltransform")
  describe file(gdaltransform_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gdalwarp_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gdalwarp")
  describe file(gdalwarp_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gnmanalyse_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gnmanalyse")
  describe file(gnmanalyse_full_path) do
    it { should exist }
    it { should be_executable }
  end
  gnmmanage_full_path = File.join(plan_installation_directory.stdout.strip, "bin/gnmmanage")
  describe file(gnmmanage_full_path) do
    it { should exist }
    it { should be_executable }
  end
  nearblack_full_path = File.join(plan_installation_directory.stdout.strip, "bin/nearblack")
  describe file(nearblack_full_path) do
    it { should exist }
    it { should be_executable }
  end
  ogr2ogr_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogr2ogr")
  describe file(ogr2ogr_full_path) do
    it { should exist }
    it { should be_executable }
  end
  ogrinfo_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogrinfo")
  describe file(ogrinfo_full_path) do
    it { should exist }
    it { should be_executable }
  end
  ogrlineref_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogrlineref")
  describe file(ogrlineref_full_path) do
    it { should exist }
    it { should be_executable }
  end
  ogrtindex_full_path = File.join(plan_installation_directory.stdout.strip, "bin/ogrtindex")
  describe file(ogrtindex_full_path) do
    it { should exist }
    it { should be_executable }
  end
  testepsg_full_path = File.join(plan_installation_directory.stdout.strip, "bin/testepsg")
  describe file(testepsg_full_path) do
    it { should exist }
    it { should be_executable }
  end
end
