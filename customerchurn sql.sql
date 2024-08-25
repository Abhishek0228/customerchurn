use datachurn;

#7 Calculation of the total charges distribution for churned and non-churned customers

SELECT 
    Customer_status,
    COUNT(*) AS CustomerCount,
    AVG(Total_charges) AS Avg_Total_Charges,
    MIN(Total_charges) AS Min_Total_Charges,
    MAX(Total_charges) AS Max_Total_Charges,
    SUM(Total_charges) AS Total_Sum_Charges
FROM 
    customer_churn
GROUP BY 
    Customer_status
ORDER BY 
    Customercount desc;
    

# 8 The average monthly charges for different contract types among churned customers

SELECT 
    Contract AS Contract_type_churned,
    AVG(Monthly_charge) AS Avg_Monthly_Charges
FROM 
    customer_churn
WHERE 
    Customer_status = 'Churned'
GROUP BY 
    Contract
ORDER BY 
    Avg_Monthly_Charges desc;    


# 11 Identification of the average total charges for customers grouped by gender and marital status
SELECT 
    Gender,
    Married,
    AVG(Total_Charges) AS Average_Charges
FROM 
    customer_churn
GROUP BY   Gender,Married;




# 12 Calculation of the average monthly charges for different age groups among churned customers
SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 20 THEN '0-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Age BETWEEN 61 AND 70 THEN '61-70'
        WHEN Age BETWEEN 71 AND 80 THEN '71-80'
        ELSE '81-100'
    END AS Age_Group,
    AVG(Monthly_Charge) AS Average_Monthly_Charge
FROM 
    customer_churn
WHERE 
    Customer_Status = 'Churned'
GROUP BY 
    Age_Group
ORDER BY 
    Age_Group;
    


# 13 Determination of the average age and total charges for customers with multiple lines and online backup
SELECT 
    AVG(Age) AS Average_age,
    AVG(Total_Charges) AS Average_Total_charges
FROM 
    customer_churn
WHERE 
    Multiple_Lines = 'Yes'
    AND Online_Backup = 'Yes';    
    

# 14 Identification of the contract types with the highest churn rate among senior citizens (age 65 and over)
SELECT 
    Contract,
    COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) * 1.0 / COUNT(*) AS churn_rate 
FROM 
    customer_churn
WHERE 
    age >= 65
GROUP BY 
    Contract
ORDER BY 
    churn_rate DESC;
    
    
# 15 Calculation of the average monthly charges for customers who have multiple lines and streaming TV
SELECT
 AVG(Monthly_Charge) AS Average_Monthly_Charge
 FROM customer_churn
 WHERE Multiple_Lines = 'Yes'
 AND Streaming_TV = 'Yes';    
 
 
# 19  Calculation of the average monthly charges and total charges for customers who have churned, grouped by contract type and internet service type
SELECT 
    Contract, Internet_Type,
    AVG(Monthly_Charge) AS Average_Monthly_Charge,
    AVG(Total_Charges) AS Average_Total_Charges
FROM 
    customer_churn
WHERE 
    Customer_Status = 'Churned'
GROUP BY 
    Contract, Internet_Type;
    

#  20 To Find the customers who have churned and are not using online services, and their average total charges
SELECT 
    AVG(Total_Charges) AS Average_Total_Charges
FROM 
    customer_churn
WHERE 
    Customer_Status = 'Churned'
    AND Online_Security = 'No'
    AND Online_Backup = 'No'
    AND Device_Protection_Plan = 'No'
    AND Premium_Tech_Support = 'No'
    AND Streaming_TV = 'No'
    AND Streaming_Movies = 'No'
    AND Streaming_Music = 'No';    
    
    
# 21 Calculation of the average monthly charges and total charges for customers who have churned, grouped by the number of dependents
SELECT 
    Number_of_Dependents,
    AVG(Monthly_charge) AS Average_Monthly_Charge,
    AVG(Total_Charges) AS Average_Total_Charges
FROM 
    customer_churn
WHERE 
    Customer_Status = 'Churned'
GROUP BY 
	Number_of_Dependents;    
    
 