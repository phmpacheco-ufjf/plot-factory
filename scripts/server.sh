pkill -f "/usr/lib/R/bin/exec/R --slave --no-restore --file=app.R"
# pkill -f "/usr/lib/R/bin/exec/R -e library(shiny);~+~runApp('app.R')"
nohup Rscript app.R &