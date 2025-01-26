# Simply creates multiple versions of the same plot

ggsave2x <- function(filename, width, height, plot = last_plot(), type = c('pdf', 'png'), ...) {

  for (tt in type) {
    ggsave(filename = paste0(filename, '.', tt), width = width, height = height, plot = plot)
  }

}

