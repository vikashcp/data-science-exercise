# Gnuplot for data publisherDiversity
clear
reset
set key off
set border 3
set autoscale
set xrange[0:20]
#set yrange[0:1000]
#set logscale
#set term x11
set output 'Graph.png'
set xtic 1
set ytic auto
set title "Publisher diversity frequency distribution"
set xlabel "Value"
set ylabel "Count"
set style histogram clustered gap 0.1
set style fill solid border -1
binwidth=0.1
set boxwidth binwidth
bin(x,width)=width*floor(x/width) + binwidth/2.0
plot "000000_0" using (bin($1,binwidth)):(1.0) smooth freq with boxes
