Use Case_Study;
Select * From online_retail_dataset;
SELECT COUNT(*) FROM online_retail_dataset WHERE CustomerID  IS NULL;
SELECT *            -- Copy backup purposes
INTO online_retail_copy
FROM online_retail_dataset;

SELECT *  -- all records where Quantity is less than 0
FROM online_retail_dataset
WHERE Quantity <0;

SELECT *  -- all records where Quantity is less than 0 and CustomerID is NULL
FROM online_retail_dataset
WHERE Quantity <0  AND UnitPrice < 0 AND CustomerID IS NULL;

SELECT *  -- all records where Quantity is less than 0 and CustomerID is NULL
FROM online_retail_dataset
WHERE Quantity > 0  AND UnitPrice > 0 AND CustomerID IS NULL;

SELECT Count(*)  -- Select all records where Quantity is less than 0, UnitPrice is less than 1, and CustomerID is NULL 
FROM online_retail_dataset -- Group the results by OrderPriority
WHERE Quantity < 0 AND UnitPrice < 1 AND  CustomerID IS   NULL
GROUP BY OrderPriority

SELECT InvoiceNo, COUNT(*) -- Select InvoiceNo and count of records where CustomerID is NULL 
FROM online_retail_dataset -- Group the results by InvoiceNo
WHERE CustomerID IS NULL
GROUP BY InvoiceNo;

-- Update the online_retail_dataset table
-- Set the WarehouseLocation to "Not Specified" where WarehouseLocation is NULL
UPDATE online_retail_dataset
SET WarehouseLocation = 'Not Specified'
WHERE WarehouseLocation IS NULL;



-- Set the CustomerID to "Not Available" where CustomerID  is Null becuse 
ALTER TABLE online_retail_dataset -- Change Data type of Custmoerid int to Varchar 
ALTER COLUMN CustomerID VARCHAR(255);

UPDATE online_retail_dataset
SET CustomerID ='Not Available'
WHERE CustomerID IS NULL;

-- Set ShippingCost 0 where ShippingCost is null 
UPDATE online_retail_dataset 
SET ShippingCost = 0
WHERE ShippingCost IS NULL;

ALTER TABLE online_retail_dataset  -- ADD COLUMN FOR SPLIT DATE 
ADD  Invoice_Date DATE   ;
UPDATE online_retail_dataset -- INSERT DATE IN Invoice_Date
SET Invoice_Date = CAST(InvoiceDate AS DATE);

ALTER TABLE online_retail_dataset  -- ADD COLUMN FOR SPLIT TIME
ADD  Invoice_Time TIME ;
UPDATE online_retail_dataset -- INSERT TIME IN Invoice_Time
SET Invoice_Time = FORMAT(InvoiceDate , 'HH:')

sELECT * FROM online_retail_dataset;
