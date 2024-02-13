# Produce Cost

### Project Overview

This project's objective is to provide insights on the nutritional values from various restaurants and their menu items. By analyzing some KPIs from the dataset, we look to identify which restaurants have the most optimal nutrition values for daily consumption and to help provide consumers with better/alternative eating options. Daily nutritional values can be found at <https://www.fda.gov/food/nutrition-facts-label/daily-value-nutrition-and-supplement-facts-labels>. For further information, please visit the provided site.

### About the Data

The primary dataset can be found on <https://www.menustat.org/data.html>. This dataset contains many restaurants, their respective menu items, and different food categories. Also, this dataset contains many nutritional categories, such as calories, total fats, sodium, and proteins. 

### Tools Used

- SQL - Data Cleaning & Data Analysis
- Tableau - Data Visualization

### Data Cleaning/Preparation

1. Data Cleaning
2. Data Sorting and Filtering
3. Data Formatting and Transforming

### Exploratory Data Analysis (EDA)

EDA was performed to answer key questions, such as, but not limited to:

1. What are each restaurant's average calories per food items? excluding nulls and 0s
2. What are each restaurant's average total fats per food items? excluding nulls and 0s
3. What are each restaurant's average sodium per food items? excluding nulls and 0s
4. What are each restaurant's average proteins per food items? excluding nulls and 0s
5. Which resturant has highest calorie per food category?
6. Which resturant has lowest calorie per food category
   

### Results/Findings

1. Famous Dave's has the highest average calories with 5,635 calories, followed by Sbarro at 2,138 calories and Romano's Macaroni & Grill at 1639 calories.
2. Famous Dave's has the highest average total fats with 280g, followed by Sbarro at 107g and Wingstop at 81g.
3. Famous Dave's has the highest average sodium levels at 9575mg, followed by Sbarro at 4727mg and Dickey's Barbeque at 3082mg.
4. Famous Dave's has the highest average protein at 323g, followed by Sbarro at 92g and Little Caesar's at 54g.
5. Dickey's Barbeque has the highest 'Entree' item at 13734 calories, followed by Red Lobster having the highest 'Desserts' item at 13020 calories, and Chick Fil A with the highest 'Appetizers & Sides' at 9850 calories.

   ![22222222](https://github.com/DavidsDatabase/Restaurant_Nutrition_2022/assets/156726833/64e60498-1833-400b-a936-92040278817c)

6. Krystal has the lowest calorie 'Burgers' item at 130 calories, followed by Golden Corral and Panera Bread with the lowest calorie 'Soup' items, then by Arby's 'Fried Potatoes' item at 45 calories.

   ![324](https://github.com/DavidsDatabase/Restaurant_Nutrition_2022/assets/156726833/d890f050-85e7-4c2c-a365-450d41b8e807)


### Recommendations

Based on the analysis, we recommend the following actions:

Considering the daily nutritional values recommendations, we advise consumers to look for food items that are relatively close to the recommended values. This is for health reasons and to avoid health problems down the line if there is overconsumption. But, items that are soaringly high in values does not neccessarily mean avoid these items altogether, people can still consume them, just at a moderate level. 

### Limitations

Many items have NULLs as values so calculations may seem very high or low. This is due to missing information, further investigation or data collecting would be needed for a more thorough analysis. Some restaurants have many items so their nutritional value's averages are more well-rounded, while some restaurants only had a few items so their averages are very skewed, either really high or low. Some item's nutritional values are accurate while there are some that are not. Another analysis may be needed after reconfirming the nutritional facts for each item from multiple sources. Categorization for several items are misleading and/or doesn't make the most logical sense. Item names have actual food items labelled correctly, but some are toppings/ingredients added on top of actual food, but treated to have a suprisingly high calories count, etc. 

### Complimentary Visualization

<https://public.tableau.com/app/profile/david.lee7724/viz/R2_17077971674920/Front>











