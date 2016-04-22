# Gnuplot for data countryDiversity
clear
reset
set key off
set border 3
set autoscale
set xrange[0:3]
#set yrange[0:1000]
#set logscale
#set term x11
set output 'countryDiversityGraph.png'
set xtic 0.2
set ytic auto
set title "Country diversity frequency distribution"
set xlabel "Value"
set ylabel "Count"
set style histogram clustered gap 0.1
set style fill solid border -1
binwidth=0.1
set boxwidth binwidth
bin(x,width)=width*floor(x/width) + binwidth/2.0
plot "< cat countrydiversity/*_0" using (bin($1,binwidth)):(1.0) smooth freq with boxes
