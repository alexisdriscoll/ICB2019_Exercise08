setwd("~/Documents/junior/ICB_HW/ICB2019_Exercise08/")

# task 1 : plotting UW v. MSU baskeball score throughout a game
game_data <- read.delim(file = "UWvMSU_1-22-13.txt")
UWplot <- c(0)
MSUplot <- c(0)
UWscore <- 0
MSUscore <- 0
times <- c(0, game_data[,1])

for (i in 1:nrow(game_data)) {
  if (game_data[i,2] == "UW") {
    UWscore <- UWscore + game_data[i,3]
  }
  if (game_data[i,2] == "MSU"){
    MSUscore <- MSUscore + game_data[i,3]
  }
  UWplot[i+1] <- UWscore
  MSUplot[i+1] <- MSUscore
}

plot(times, UWplot, type = "l", col = "red", xlab = "time (mins)", ylab = "score")
lines(times, MSUplot, type = "l", col = "green")
legend(3, 40, legend =  c("UW", "MSU"), col = c("red", "green"), lty = 1)


# task 2 : "guess my number" game
print("I'm thinking of a number 1-100...")
answer <- sample(1:100, 1)
for (i in 1:10){
  guess <- readline(prompt = "Guess: ")
  guess <- as.integer(guess)
  if (is.na(guess)){
    print("Not a valid guess. Exiting...")
    break
  }
  if (guess < answer){
    print("Higher")
  }
  if (guess > answer){
    print("Lower")
  }
  if (guess == answer){
    print("Correct!")
    break
  }
}
print("End of game")
