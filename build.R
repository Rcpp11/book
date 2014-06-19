require(knitr)

rmd_files <- sprintf( "src/%s", 
    list.files( "src", pattern = "", recursive = TRUE,  include.dirs = TRUE )
    )
md_files  <- sub( "^src/(.*)[.]rmd$", "\\1.md", rmd_files )

mapply( function(rmd, md){
    knit( rmd, output = md)    
}, rmd_files, md_files )

system( "gitbook build . --output=_book" )

