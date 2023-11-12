
  
    

    create or replace table `eco-serenity-397311`.`retail`.`report_product_invoices`
    
    

    OPTIONS()
    as (
      -- report_product_invoices.sql
SELECT
  p.product_id,
  p.stock_code,
  p.description,
  SUM(fi.quantity) AS total_quantity_sold
FROM `eco-serenity-397311`.`retail`.`fct_invoices` fi
JOIN `eco-serenity-397311`.`retail`.`dim_product` p ON fi.product_id = p.product_id
GROUP BY p.product_id, p.stock_code, p.description
ORDER BY total_quantity_sold DESC
LIMIT 10
    );
  