# 1 
# load data into matrix
setwd ("/Users/ashlynwang/Biocomputing2020_Tutorial10")
gameData <- read.table("UWvMSU_1-22-13.txt", header = TRUE, stringsAsFactors = FALSE)

#create variable to store the sums
UWSum=0
MSUSum=0

# create matrix for cumulative sums for each team
# time, UWcumulativesum, MSUcumulativesum
# rbind looks at (matrix you want to look at, columns u want to add to matrix)

G <- matrix(0,nrow=0,ncol=3)

for(i in 1:nrow(gameData)){
  if(gameData$team[i]=="UW"){
    UWSum=UWSum+gameData$score[i]
  }
  else{
    MSUSum=MSUSum+gameData$score[i]
  }
  G <- rbind(G,c(gameData$time[i],UWSum,MSUSum))
}
colnames(G) <- c("time","UW","MSU")

# plot the graph, where x=time elapsed, y=cumulativescore of each team
# green line = UW
# red line = MSU

plot(G[,1],G[,2],type='l',col="green")
lines(G[,1],G[,3],col="red")

#2 

# generate a random integer between 1 and 100
randomNumber = sample(1:100,1,replace=FALSE)

# assign variable for user's guess
userinput <- -1

# initialize the number of guesses
maxGuess = 0

# as long as user's guess is wrong, continue asking prompt
# maximum number of guesses must be no greater than 10
# prompt for users to enter a guess

while (userinput != randomNumber && maxGuess < 10){
 userinput <- readline(prompt = "Please enter your guess: ")
 if (userinput == randomNumber){
   cat ("You are correct!")
 } else 
    if (userinput < randomNumber){
     cat("Too low, guess again!")
  } else {(userinput > randomNumber)
    cat("Too high, guess again!")
  }
 maxGuess = maxGuess+1
  }
 
