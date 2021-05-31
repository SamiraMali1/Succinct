###################################################################
# Path to this script
###################################################################

# Cached directory to script
# https://stackoverflow.com/questions/3452086/getting-path-of-an-r-script
TAD_CLEAN_SCRIPT_DIR = getSrcDirectory(function(x) {
  x
})

# getSrcDirectory trick will not work via Rscript. If this is the
# case, then TAD_CLEAN_SCRIPT_DIR will be length zero.
# http://stackoverflow.com/questions/1815606/rscript-determine-path-of-the-executing-script
if (length(TAD_CLEAN_SCRIPT_DIR) == 0) {
  TAD_CLEAN_SCRIPT_DIR = dirname(scriptName::current_filename())
}

# @return Path to directory containing this script
get_tad_clean_script_dir <- function() {
  return(TAD_CLEAN_SCRIPT_DIR)
}
#path1 <- "C:/Users/samir/Documents/chr-sam/loci/chr-loc-mbi-mam/gm12878/fractal2d.hic5kb.tad2mb/null"
path1 = file.path(get_tad_clean_script_dir(),"..", "output", "folder.arch.rd11184.20Mb")
i=0

get_locus <- function() {
set.seed(123)
#s =c(1000,1200,1300,1700)
s = floor (runif(300000, min=0, max=3877))
filenames = dir(path= paste(path1,"ligc.csv.gz", sep="/"),pattern="*.csv")
for (file1 in filenames){
  i =i+1
  headers = read.csv(paste(path1,"ligc.csv.gz",file1, sep="/"),  header = F, nrows = 1, as.is = T)
  headers$V2=NA
  df = read.csv(paste(path1,"ligc.csv.gz",file1, sep="/"), skip = 1, header = F)
  data3 = df[(s[i] < df$V1) & (df$V1 < s[i]+ 126) & (s[i] <df$V2) & (df$V2 < s[i]+ 126),]
  data3 = data3 - (s[i])-1
  
  total <- rbind(headers, data3)
  #sub(".gz","","jkasbkb.csv.gz")
  write.table(total,paste(path1,"ligc.csv.gz1",sub(".gz","",file1), sep="/"),sep = ",",row.names=FALSE,col.names=FALSE,na = "")
}

}
get_locus()