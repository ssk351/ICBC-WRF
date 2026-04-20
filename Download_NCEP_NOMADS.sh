#############################
###Assume your pc/hpc has bash and curl
##@Author : Saikrishna
##@Email : sivasai351@gmail.com
## To download NOMADS data
#############################
export DIR1=20250919
##`date +%Y%m%d`
mkdir ${DIR1}00
i=0
while [ $i -le 9 ]
do
curl "https://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t00z.pgrb2.0p25.f00${i}&all_lev=on&all_var=on&subregion=&leftlon=10&rightlon=130&toplat=60&bottomlat=-20&d\
ir=%2Fgfs.${DIR1}%2F00%2Fatmos" -o gfs.t00z.pgrb2.0p25.f00${i} >& temp00${i} &
i=$(expr $i + 3)
done
while [ $i -le 99 ]
do
echo Count is $i
curl "https://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t00z.pgrb2.0p25.f0${i}&all_lev=on&all_var=on&subregion=&leftlon=10&rightlon=130&toplat=60&bottomlat=-20&di\
r=%2Fgfs.${DIR1}%2F00%2Fatmos" -o gfs.t00z.pgrb2.0p25.f0${i} >& temp0${i} &
i=$(expr $i + 3)
done
while [ $i -le 120 ]
do
echo Count is $i
curl "https://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t00z.pgrb2.0p25.f${i}&all_lev=on&all_var=on&subregion=&leftlon=10&rightlon=130&toplat=60&bottomlat=-20&dir\
=%2Fgfs.${DIR1}%2F00%2Fatmos" -o gfs.t00z.pgrb2.0p25.f${i} >& temp${i} &
i=$(expr $i + 3)
done
wait

mv gfs.t00z.pgrb2.0p25.f* ${DIR1}001/
wait
#sbatch /scratch/sahiduli/OPS/opsjob/Auto_pre_process_NCEP.sh
echo `date` > completed
