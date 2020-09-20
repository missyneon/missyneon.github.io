let humanScore = 0;
let computerScore = 0;
let currentRoundNumber = 1;

// Write your code below:
const generateTarget = () => {
    return Math.floor(Math.random()*9);
}

const getAbsoluteDistance = (firstNumber,secondNumber) => {
    return Math.abs((firstNumber - secondNumber));
}


const compareGuesses = (userGuess,computerGuess,targetNumber) => {
    if ((getAbsoluteDistance(userGuess,targetNumber) < getAbsoluteDistance(computerGuess,targetNumber) || userGuess === computerGuess) && (userGuess => 0 || userGuess <= 9)) {
            return true;
    } else if ((getAbsoluteDistance(userGuess,targetNumber) > getAbsoluteDistance(computerGuess,targetNumber)) && (userGuess => 0 || userGuess <= 9)){
            return false;
    }
    
    
        

    
    
}

const updateScore = winner => {
    switch (winner) {
        case 'human': humanScore++;
        break;
        case 'computer': computerScore++;
        break;
        default: break;
    }
} 

const advanceRound = () => {
    currentRoundNumber++;
}

