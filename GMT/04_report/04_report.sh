# set file name
out_ps=04_report.ps
input_list=eq.list

# reset output paper size to A4
gmt set PS_MEDIA A4
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -B1 -G0/250/250 -X-0.5 -Y5 -O -K >> $out_ps
gmt pscoast -R -J -K -G250/250/0 -W1 -Df -Ia -O -K >> $out_ps
awk '{print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -O -K >> $out_ps
echo 121.29 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps
echo "121.29 22.7 M:4.6 Depth:5.9km" | gmt pstext -R -J -O -K -F+f,Helvetica-Bold,black >> $out_ps

echo 121.87 24.97 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps
echo "121.87 24.8 M:5.1 Depth:132.5km" | gmt pstext -R -J -O -K -F+f,Helvetica-Bold,black >> $out_ps

# Bottom map
gmt psbasemap -R119/123/0/315 -Jx3/-0.01 -Bxa1f1 -Bya100f20 -X0 -Y-5 -O -K >> $out_ps
gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.05 -O -K >> $out_ps
echo 121.29 5.9 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_p 

# Right map
gmt psbasemap -R0/315/21/26 -Jx0.01/3.25 -Bxa100f20 -Bya1f1 -X14 -Y5 -O -K >> $out_ps
gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -O -K >> $out_ps
echo 5.9 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps

# end gmt session
gmt psxy -R -J -O -T >> $out_ps
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg
# end gmt session
gmt psxy -R -J -O -T >> $out_ps
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg