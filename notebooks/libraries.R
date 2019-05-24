# Load all requirements
load_reqs <- function(reqs) {
  for(pkg in reqs) {
    # If it's not installed, install it
    if (!(pkg %in% installed.packages())) { install.packages(pkg)}
    
    # Load the package
    library(pkg, character.only = T)
  }
}

pkgs <- c("data.table", "lubridate", "DT", "ggplot2", "ggcorrplot", "ggthemes", "GGally", "grid", "gridExtra", "plotly", "leaflet", "corrplot", "plotmo","MASS","glmnet", "caret", "car", "ranger")

load_reqs(pkgs)

### data munging libraries
#library(data.table)
#library(lubridate)
#library(DT)

### plotting libraries
#library(ggplot2)
#library(ggcorrplot)
#library(ggthemes)
#library(GGally)
#library(grid)
#library(gridExtra)
options(scipen = 999)
theme_set(theme_minimal(base_size = 16))
#library(plotly)
#library(leaflet)
#library(corrplot)
#library(plotmo)
##library(ggrepel)
##library(ggiraph)

# machine learning libraries
#library(MASS)
#library(glmnet)
#library(caret)
#library(car)
#library(ranger)