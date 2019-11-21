setwd("~/Documents/junior/ICB_HW/ICB2019_Exercise08/")

# task 1 : plotting UW v. MSU basketball score throughout a game
game_data <- read.delim(file = "UWvMSU_1-22-13.txt")
UWplot <- c(0)
MSUplot <- c(0)
UWscore <- 0
MSUscore <- 0
#creating a vector of all of the times at which points are scored throughout the game
times <- c(0, game_data[,1])

#iterating through the game data and adding the points scored by each team to their respective vector
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

#plotting the scores of the two teams against the game time
plot(times, UWplot, type = "l", col = "red", xlab = "time (mins)", ylab = "score")
lines(times, MSUplot, type = "l", col = "green")
title(main="MSU vs. UW basketball game score")
legend(3, 40, legend =  c("UW", "MSU"), col = c("red", "green"), lty = 1)


# task 2 : "guess my number" game
answer <- sample(1:100, 1)
print("I'm thinking of a number 1-100...")
print("You have 10 guesses")
for (i in 1:10){
  guess <- readline(prompt = paste0("Guess ", i, ": "))
  guess <- as.integer(guess)
  if (is.na(guess)){
    print("Not a valid guess. Exiting...")
    break
  }
  if (guess < answer){
    if (i == 10){
      print(paste("You're out of guesses. The correct answer was: ", answer))
    }
    else{
      print("Higher")
    }
  }
  if (guess > answer){
    if (i == 10){
      print(paste("You're out of guesses. The correct answer was:", answer))
    }
    else{
      print("Lower")
    }
  }
  if (guess == answer){
    print("Correct!")
    print("End of game")
    break
  }
}
