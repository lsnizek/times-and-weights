set terminal png size 1200,300 small
set output '/tmp/{lift}.png'
set title '{lift}'
set ylabel 'kg for 5'
set xlabel 'date'
set xdata time
set timefmt '%Y-%m-%d'
set format x '%Y-%m'
set grid
plot '/dev/stdin' using 1:2 notitle
