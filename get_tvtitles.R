#Extracts all TV titles into one list
get_tvtitles <- function(TVData) {
  # Initialize a list to store prod titles
  allTVtitles <- list()
  
  # Extract titles from TVData and store in allTVtitles
  for (i in 1:length(TVData)) {
    allTVtitles[[i]] <- TVData[[i]][["title"]]
  }
  
  return(allTVtitles)
}
