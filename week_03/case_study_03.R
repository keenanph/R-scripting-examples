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


plot1 <- ggplot(gap_filter,aes(lifeExp,gdpPercap,color=continent,size=pop))+geom_point()+
  scale_y_continuous(trans='sqrt')+
  facet_wrap(~year,nrow=1)+labs(title = 'Wealth and Life expectancy through time',
                                x='Life Expectancy', y='GDP per capita',size='Population',
                                color= 'Continent')+theme_bw()
ggsave('Wealth_Life_exp.png', plot=plot1, width=15,units = c('in'))

gapminder_continent <- gap_filter%>%
  group_by(continent,year)%>%
  summarize(gdpPercapweighted=weighted.mean(x=gdpPercap,w=pop),pop=sum(as.numeric(pop)))

 
plot2 <- ggplot()+geom_point(data=gap_filter,aes(x=year,y=gdpPercap,color=continent,group=country))+
  geom_line(data=gap_filter,aes(x=year,y=gdpPercap,color=continent,group=country))+
  geom_point(data=gapminder_continent,aes(x=year,y=gdpPercapweighted,size=pop))+
  geom_line(data=gapminder_continent,aes(x=year,y=gdpPercapweighted))+
  facet_wrap(~continent,nrow=1)+theme_bw()+labs(title='GDP per capita growth over time', x='Time',y='GDP per capita',
                                                size='Population (100k', color='Continent')

ggsave('GDP_continent.png',plot=plot2,width=15,units = c('in'))

#########################################

# ggplot(gap_filter,aes(x=year,y=gdpPercap,color=continent,group= country))+
#   geom_point()+geom_line()+
#   facet_wrap(~continent,nrow=1)+
#   geom_point(data=gapminder_continent,size= pop)
 
#   geom_line(data=gapminder_continent,aes(gdpPercapweighted))+
#   geom_point(data=gapminder_continent,aes(pop))+facet_wrap(~year,nrow=1)+
#   theme_bw()+labs()

# ggplot()+geom_line(gap_filter, aes(x=year,y=gdpPercap,color=continent))
# geom_point(gap_filter,aes(x=year,y=gdpPercap,color=continent))
# geom_line(gapminder_continent,aes(x=year))
# geom_point(gapminder_continent,aes(x,year,y,gdpPercapweighgt, size=pop/100000))
# ylim(0,50000)
