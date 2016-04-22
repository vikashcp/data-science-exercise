# Gnuplot for data file "countryDiversity.csv"
clear
reset
set key off
set border 3
set autoscale
set xrange[0:3]
#set yrange[0:1000]
#set logscale
set xtic 0.2
set ytic auto
set title "frequency distribution"
set xlabel "Value"
set ylabel "Count"
ft="png"
set output "countryDivHist.".ft
#set term x11
set style histogram clustered gap 0.1
set style fill solid border -1
binwidth=0.1
set boxwidth binwidth
bin(x,width)=width*floor(x/width) + binwidth/2.0
plot "< cat misc/countryDiversity*.csv" using (bin($1,binwidth)):(1.0) smooth freq with boxes
