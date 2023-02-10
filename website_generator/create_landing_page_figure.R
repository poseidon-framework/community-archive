# This script assumes that the total_janno object is in the global environment

library(ggplot2)
library(magrittr)

#### prepare input data ####

poseidon_ancient <- total_janno %>%
  dplyr::filter(
    Date_Type %in% c("C14", "contextual") &
      !is.na(Date_BC_AD_Median) &
      !is.na(Latitude) & !is.na(Longitude)
  ) #%>%
  # poseidonR::process_age() %>%
  # dplyr::filter(
  #   !is.na(Date_BC_AD_Median_Derived)
  # )

#### prepare spatial data objects ####

world <- rnaturalearth::ne_countries(scale = "small", returnclass = "sf")
world_6933 <- sf::st_transform(world, 6933) %>%
  sf::st_make_valid() %>%
  sf::st_union()
extent_world_6933 <- world_6933 %>%
  sf::st_bbox() %>%
  sf::st_as_sfc() %>%
  sf::st_segmentize(dfMaxLength = 10000)
world_grid_6933 <- sf::st_make_grid(
  world_6933,
  n = c(36,18),
  what = 'polygons',
  flat_topped = TRUE
) %>% sf::st_as_sf() %>%
  dplyr::mutate(
    area_id = seq_along(x)
  ) %>% sf::st_segmentize(dfMaxLength = 10000)

poseidon_sf_6933 <- poseidon_ancient %>%
  sf::st_as_sf(coords = c('Longitude', 'Latitude'), crs = 4326) %>%
  sf::st_transform(6933)

#### perform counting in spatial bins ####

inter_world <- function(x) {
  x %>% sf::st_intersects(world_grid_6933, .) %>% lengths()
}

world_with_count <- world_grid_6933 %>%
  dplyr::mutate(
    count = poseidon_sf_6933 %>% inter_world(),
  ) %>%
  dplyr::filter(count != 0)


#### create world plot ####

p_map <- ggplot() +
  geom_sf(data = extent_world_6933, fill = "#c2eeff", color = NA, alpha = 0.5) +
  geom_sf(data = world_6933, fill = "white", color = NA) +
  geom_sf(
    data = world_with_count, 
    mapping = aes(fill = count), color = NA, size = 0.1
  ) +
  geom_sf(data = world_6933, fill = NA, color = "black", cex = 0.2) +
  geom_sf_text(
    data = world_with_count, 
    mapping = aes(label = count), color = "white", size = 3.4
  ) +
  coord_sf(expand = F, crs = "+proj=natearth") +
  scale_fill_gradientn(
    colours = c("darkgrey", "red"),
    guide = "colorbar"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.background = element_blank(),
    panel.grid.major = element_line(colour = "grey", size = 0.3),
    axis.title = element_blank(),
    plot.title = element_text(face = "bold", size = 14)
  ) +
  guides(
    fill = guide_colorbar(
      title = "Poseidon individuals count",
      barwidth = 20, barheight = 1.5
    )
  ) +
  ggtitle(
    paste("Spatial and temporal distribution of ancient human individuals in the merged Poseidon dataset"),
    paste0(Sys.Date(), ", this only counts ancient samples with dating and coordinates, World in Natural Earth projection")
  )

#### 

p_hist <- poseidon_ancient %>%
  dplyr::mutate(
    age_cut = cut(
      Date_BC_AD_Median, 
      breaks = c(
        min(poseidon_ancient$Date_BC_AD_Median), 
        seq(-10000, 2000, 500)
      ),
      labels = c("< -10000", paste0("> ", seq(-10000, 1500, 500))),
      include.lowest = T
    )
  ) %>%
  ggplot() +
  geom_histogram(
    aes(x = age_cut),
    fill = "red",
    color = "white",
    stat = "count"
  ) +
  coord_flip() +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  ) +
  xlab("age [years calBC/AD]")

p <- cowplot::plot_grid(p_map, p_hist, ncol = 2, rel_widths = c(0.82, 0.2))

ggsave(
  "website_source/landing_page_figure.png",
  plot = p,
  device = "png",
  scale = 2,
  height = 3.6,
  width = 7
)
