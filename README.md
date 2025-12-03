# Data Mining Quality & Bias Analysis of the Adult Income Dataset

**University of the Fraser Valley — Faculty of Science**  
**Course:** COMP/STAT 331 – Data Quality  
**Final Project Report**  
**Student:** Shubham Mali (300217862)  
**Program:** Post-Baccalaureate Diploma in Business Analytics  
**Instructor:** Dr. Amir Daneshpajouh  
**Date Submitted:** December 4, 2025

---

## 1. Introduction

This project analyzes the **Adult Income dataset** from the UCI Machine Learning Repository.  
The dataset contains demographic and employment details commonly used to predict whether an individual earns more than **$50K per year**.

Since the dataset is widely used in data mining and machine learning applications, evaluating its data quality is essential. This report focuses on four key data quality dimensions:

- Missing Data  
- Sampling Bias  
- Labeling Issues  
- Fairness Across Demographic Groups  

All analysis was conducted in **R** using summaries, tables, and simple visual checks.

**GitHub Repository:**  
https://github.com/Shubham247-coder/COMP331-Final-Project

---

## 2. Data Quality Analysis

### 2.1 Missing Values & Completeness

- The dataset uses `"?"` instead of `NA` to represent missing entries.  
- After cleaning, most missing values occur in:  
  - **workclass**  
  - **occupation**  
  - **native_country**  
- Missing data percentages are moderate but still affect model quality.  
- Improper handling can introduce bias, especially across demographic subgroups.

---

### 2.2 Sampling Bias & Class Imbalance

- Income classes are **highly imbalanced**:  
  - ~76% earn ≤50K  
  - ~24% earn >50K  
- This imbalance skews predictive models toward the majority class.  
- Additional imbalance exists across gender and race:
  - More males than females  
  - Some racial groups have low sample representation  

These issues reduce model generalizability and introduce sampling bias.

---

### 2.3 Label Issues & Fairness Concerns

The binary label **≤50K vs. >50K** oversimplifies income categories.

Observed disparities:

- **Gender:**  
  - Only ~11% of females earn >50K  
  - ~30% of males earn >50K

- **Race:**  
  - White and Asian-Pacific-Islander groups show higher income rates  
  - Black, Amer-Indian-Eskimo, and Other groups show lower rates

Machine learning models trained on this data risk **reproducing inequalities** unless fairness measures are applied.

---

## 3. Recommendations

1. Replace `"?"` with `NA` and impute using mode or `"Unknown"`.  
2. Apply oversampling, undersampling, or class weighting to handle imbalance.  
3. Measure fairness metrics such as **false-negative gaps** across demographic groups.  
4. Prefer multi-level income brackets instead of binary classes.  
5. Maintain proper documentation for transparency and ethical practice.

---

## 4. Conclusion

The Adult Income dataset is widely used but suffers from key data quality issues:
- Missing values  
- Class imbalance  
- Oversimplified labels  
- Fairness concerns across gender and race  

These issues can greatly impact model accuracy and fairness. Concepts from Weeks 10–11 emphasize that **data quality directly influences model outcomes**. Proper cleaning, balancing, and fairness evaluation are essential before modeling.

---

## 5. References

- Dua, D., & Graff, C. (2019). *UCI Machine Learning Repository: Adult Data Set*.  
- UFV COMP/STAT 331 Lecture Slides (2025), Week 10–11.  
- Barocas, S., Hardt, M., & Narayanan, A. (2019). *Fairness and Machine Learning*.  
- Friedler, S. A., Scheidegger, C., & Venkatasubramanian, S. (2016). *On the (im)possibility of fairness*.  
- Suresh, H., & Guttag, J. (2021). *A framework for understanding unintended consequences of machine learning*.  
