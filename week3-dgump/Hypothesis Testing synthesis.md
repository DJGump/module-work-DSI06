# Hypothesis Test Notes

* I have continuous data broken into groups. How do I know what test to run?

  * Are my groups independent or related?

  * Is my data normal?

     * Independent t-test: check normality of each sample

         * Can check skewness + kurtosis, QQ plot, histogram, Shapiro test (sensitive to large sample sizes)

     * Dependent t-test: check normality of differences between paired samples (x1-x2)

      * Anova:check normality of each sample's data

  * How many groups am I comparing?

* If 2 groups:

 * Normal: ttest (ind and dep)
 * Non-normal: Mann-Whitney U (independent), Wilcoxon (dep)

* If 3+ groups:

 * Normal: Anova (independent) And Repeated Measures Anova (dep)

     * Followup with tukey
 * Non-normal: Kruskal-Wallis
     * Follow up with repeated testing of releated 2-sample test

* How can I show size of the difference between the groups?

 * t-test- Cohen's d (point estimate), confidence interval
 * 1-way Anova (ind): tukeyHSD
 * Non-parametric:
     * Common Language Effect size
     * Rank biserial correlation coefficient

* I've performed a test, how do I present it?
	* Report the result
	* If sig diff, answer: "How big is the difference?"
		* Use appropriate effect size, CI calcs, interpret in light of problem at hand.
	* Talk about in context of problem, not just hypotheses
	* 