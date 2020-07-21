# Drill Set 1

## 1: Calculate the probability of flipping a balanced coin four times and getting each pattern: HTTH, HHHH and TTHH.
A:
p(H) = 0.5
p(T) = 0.5

p(HTTH) = 0.5 * 0.5 * 0.5 *0.5
  * = 0.0625

p(HHHH) = 0.5 * 0.5 * 0.5 *0.5
  * = 0.0625

p(TTHH) = 0.5 * 0.5 * 0.5 *0.5
  * = 0.0625

## 2: If a list of people has 24 women and 21 men, then the probability of choosing a man from the list is 21/45. What is the probability of not choosing a man?

p(M) = M / (M + W)\
  * = 21 / 45\
p(!M) = 1 - p(M)
  * = 1 - (21 / 45)
  * = 24 / 45

## 3: The probability that Bernice will travel by plane sometime in the next year is 10%. The probability of a plane crash at any time is .005%. What is the probability that Bernice will be in a plane crash sometime in the next year?

p(crash n travel) = p(crash) * p(travel)
  * = 0.1 * 0.005
  * = 0.0005

## 4: A data scientist wants to study the behavior of users on the company website. Each time a user clicks on a link on the website, there is a 5% chance that the user will be asked to complete a short survey about their behavior on the website. The data scientist uses the survey data to conclude that, on average, users spend 15 minutes surfing the company website before moving on to other things. What is wrong with this conclusion?

A: This conclusion is based on a non-representative sample. The sample is convenient, because only people who choose to fill out the survey generate data. It is reasonable to say that most people will choose not to reply to the survey, and that only the most enthusiastic users, who are also likely to spend more time on the site, will complete the survey (and more likely to get the survey). A more accurate conclusion would be that for users who complete the survey, their average time spent surfing is 15 minutes. 

# Drill Set 2

## Now it's time to use Bayes' rule to compute some conditional probabilities. First, look over the numbers and estimate each of the four probabilities, using your intuition. Then, calculate the probabilities using Bayes' rule. Keep track of your work in a Google document or markdown file that you can share with your mentor.

##  A diagnostic test has a 98% probability of giving a positive result when applied to a person suffering from Thripshaw's Disease, and 10% probability of giving a (false) positive when applied to a non-sufferer. It is estimated that 0.5% of the population are sufferers. Suppose that the test is now administered to a person whose disease status is unknown. 

## Calculate the probability that the test will:
1. Be positive
2. Correctly diagnose a sufferer of Thripshaw's
3. Correctly identify a non-sufferer of Thripshaw's
4. Misclassify the person

A:
1. Be positive
    Guess: 98% of 0.5% sufferers plus 10% of 95% non-sufferer false positives 
    * = (.98 * 0.5%) + (.1 * 99.5%)
    * = 10.44% probability of any test being positive
    
    Bayes: 
2. Correctly diagnose a sufferer of Thripshaw's
Guess: 98% probability of test diagnosing sufferer correctly

3. Correctly identify a non-sufferer of Thripshaw's
    Guess: 
        p(id_non_sufferer) = 1 - p(false_positive)
    * = 1 - 0.1
    * = 0.9
    * =90% probability of correctly identifying non-sufferer

4. Misclassify the person
    Guess(Revised after checking): 
    * p(misclassify) = 1 - ((p(true_positive) *
            sufferer_proportion) + (p(true_negative) *
            non_suff_proportion))
    * = 1 - ((0.98 * 0.005) + (0.9 * 0.995))
      * previously used percentages, but must use decimals to use 1 - X principle
      * 0.9 is `1 - 0.1', the inverse of the false positive rate
    * = 0.0996 * 100
    * = 9.96% chance the test misclassifies any given person. 
      * Almost 10%. Definitely warrants a second test to validate. Since it's not too bad, a small number of multiple tests with matching results will becoming increasingly unlikely due to chance. 
  * I was comfortable with these topics, and made minor logic aadjustments based on the answer key provided.



