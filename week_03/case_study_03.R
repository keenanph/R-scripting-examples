#Keenan Phillips
#University at Buffalo
#GEO 511 Spatial Data Science
#Wealth over time (Hans Rosling Ted Talk)
##################################################

library(ggplot2)
library(gapminder)
library(dplyr)
data("gapminder")

gap_filter <- gapminder %>%
  filter(country!='Kuwait')%>% #Filters out Kuwait by saying countries not equal to Kuwait
  mutate(pop=pop/100000)


ggplot(gap_filter,aes(lifeExp,gdpPercap,color=continent,size=pop))+geom_point()+
  scale_y_continuous(trans='sqrt')+
  facet_wrap(~year,nrow=1)+labs(title = 'Wealth and Life expectancy through time',
                                x='Life Expectancy', y='GDP per capita',size='Population',
                                color= 'Continent')+theme_bw()

gapminder_continent <- gap_filter%>%
  group_by(continent,year)%>%
  summarize(gdpPercapweighted=weighted.mean(x=gdpPercap,w=pop),pop=sum(as.numeric(pop)))

# ggplot(gap_filter,aes(year,gdpPercap))+geom_line()+geom_point()+
#   geom_line(data=gapminder_continent,aes(gdpPercapweighted))+
#   geom_point(data=gapminder_continent,aes(pop))+facet_wrap(~year,nrow=1)+
#   theme_bw()+labs()


# ggplot()+geom_line(gap_filter,aes(x=year,y=gdpPercap,color=continent))
# geom_point(gap_filter,aes(x=year,y=gdpPercap,color=continent))
# geom_line(gapminder_continent,aes(x=year))
# geom_point(gapminder_continent,aes(x,year,y,gdpPercapweighgt, size=pop/100000))
# ylim(0,50000)
