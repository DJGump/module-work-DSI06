# Drill Set 1

## 1: Calculate the probability of flipping a balanced coin four times and getting each pattern: HTTH, HHHH and TTHH.

probability(H) = 0.5
probability(T) = 0.5

prob(HTTH) = 0.5 * 0.5 * 0.5 *0.5
    = 0.0625
prob(HHHH) = 0.5 * 0.5 * 0.5 *0.5
    = 0.0625
prob(TTHH) = 0.5 * 0.5 * 0.5 *0.5
    = 0.0625

## 2: If a list of people has 24 women and 21 men, then the probability of choosing a man from the list is 21/45. What is the probability of not choosing a man?

prob(M) = M / (M + W)
    = 21 / 45
prob(!M) = 1 - prob(M)
    = 1 - (21 / 45)
    = 24 / 45

## 3: The probability that Bernice will travel by plane sometime in the next year is 10%. The probability of a plane crash at any time is .005%. What is the probability that Bernice will be in a plane crash sometime in the next year?

prob(crash n travel) = prob(crash) * prob(travel)
    = 0.1 * 0.005
    = 0.0005

## 4: A data scientist wants to study the behavior of users on the company website. Each time a user clicks on a link on the website, there is a 5% chance that the user will be asked to complete a short survey about their behavior on the website. The data scientist uses the survey data to conclude that, on average, users spend 15 minutes surfing the company website before moving on to other things. What is wrong with this conclusion?

A: This conclusion is based on a non-representative sample. The sample is convenient, because only people who choose to fill out the survey generate data. It is reasonable to say that most people will choose not to reply to the survey, and that only the most enthusiastic users, who are also likely to spend more time on the site, will complete the survey. A more accurate conclusion would be that for users who complete the survey, their average time spent surfing is 15 minutes. 