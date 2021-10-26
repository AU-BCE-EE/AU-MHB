
ggplot(dl, aes(doy, value, colour = interp)) +
  geom_point(alpha = 0.1) +
  facet_grid(decade ~ variable)
ggsave('../plots/daily.png', height = 11, width = 8.5)

ggplot(dm, aes(month, mn, colour = decade)) +
  geom_line() +
  geom_point() +
  facet_wrap(~ variable, scale = 'free')
ggsave('../plots/means.png', height = 4, width = 6)

