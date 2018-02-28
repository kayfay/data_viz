task_times <- read.csv('time_m45sd_3.csv')

boxplot(task_times[1], horizontal=T, main="Time to complete tasks")

hist(task_times$x)

plot(density(task_times$x))


