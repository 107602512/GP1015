# set file name
out_ps=HW.ps
input_list=HW.list
cpt=HW.cpt
gmt makecpt -T7/40/5 -Csealand -Z > $cpt
  
# reset output paper size to A4
gmt set PS_MEDIA A4
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
  
# write your gmt code here
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -B1 -G197/226/226 -X-0.5 -Y5 -O -K>> $out_ps
gmt pscoast -R -J -B -W1 -G205/205/152 -Df -Ia -O -K >> $out_ps
awk '{if ($3>=0 && $3<15) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($3>=15 && $3<25) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=25 && $3<35) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.35 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=35 && $3<45) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.4 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=45 && $3<55) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.45 -W0.01 -C$cpt -O -K >> $out_ps

echo "122 25.8 PM2.5 concentration 2019Jan" | gmt pstext -R -J -O -K -F+f,Helvetica-Bold,black >> $out_ps


# Bottom map
gmt psbasemap -R119/123/0/60 -Jx3/-0.1 -Bxa1f1 -Bya5f5 -X0 -Y-7 -O -K >> $out_ps
awk '{if ($3>=0 && $3<15) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($3>=15 && $3<25) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=25 && $3<35) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.35 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=35 && $3<45) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.4 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=45 && $3<55) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.45 -W0.01 -C$cpt -O -K >> $out_ps

# end gmt session
gmt psxy -R -J -O -T >> $out_ps
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg