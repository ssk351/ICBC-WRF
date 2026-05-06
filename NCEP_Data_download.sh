#!/usr/bin/env csh
#
# c-shell script to download selected files from gdex.ucar.edu using Wget
# NOTE: if you want to run under a different shell, make sure you change
#       the 'set' commands according to your shell's syntax
# after you save the file, don't forget to make it executable
#   i.e. - "chmod 755 <name_of_script>"
#
# Experienced Wget Users: add additional command-line flags to 'opts' here
#   Use the -r (--recursive) option with care
#   Do NOT use the -b (--background) option - simultaneous file downloads
#       can cause your data access to be blocked
set opts = "-N"
#
# Check wget version.  Set the --no-check-certificate option
# if wget version is 1.10 or higher
set v = `wget -V |grep 'GNU Wget ' | cut -d ' ' -f 3`
set a = `echo $v | cut -d '.' -f 1`
set b = `echo $v | cut -d '.' -f 2`
if(100 * $a + $b > 109) then
  set cert_opt = "--no-check-certificate"
else
  set cert_opt = ""
endif

set filelist= ( \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f000.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f003.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f006.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f009.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f012.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f015.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f018.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f021.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f024.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f027.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f030.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f033.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f036.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f039.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f042.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f045.grib2 \
  https://osdf-director.osg-htc.org/ncar/gdex/d084001/2025/20250719/gfs.0p25.2025071900.f048.grib2 \
)
while($#filelist > 0)
  set syscmd = "wget $cert_opt $opts $filelist[1]"
  echo "$syscmd ..."
  $syscmd
  shift filelist
end
