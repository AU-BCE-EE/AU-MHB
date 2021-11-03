
ggplot(dat, aes(date2, temp)) +
  geom_line() +
  facet_wrap(~ station)
ggsave('../plots/temp.png', height = 4, width = 6)

ggplot(dat, aes(date2, wind.2m)) +
  geom_line() +
  facet_wrap(~ station)
ggsave('../plots/wind.png', height = 4, width = 6)

ggplot(dat, aes(date2, rain.rate)) +
  geom_line() +
  facet_wrap(~ station)
ggsave('../plots/rain.png', height = 4, width = 6)

ggplot(dat.all, aes(date2, rain.rate)) +
  geom_line() +
  facet_wrap(~ station)
ggsave('../plots/rain_all.png', height = 4, width = 6)
