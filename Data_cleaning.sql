-- Data cleaning

-- task:
-- 1. Remove duplicate
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. remove any columns or rows
 

SELECT *
FROM layoffs;

-- membuat tabel baru yaitu layofss_staging
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;


-- ROW_NUMBER() OVER PARTITION BY dalam SQL digunakan untuk memberikan nomor baris unik ke setiap baris dalam satu partisi data

SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging)
SELECT*
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- membuat tabel baru yaitu layoffs_staging2 agar tabel row_now bisa di delete/update

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SET SQL_SAFE_UPDATES = 0; -- => Kode ini digunakan untuk Menonaktifkan Safe Update Mode Sementara, = 1 jika ingin mengaktifkan. dilakukan agar data yang kita punya tidak sengaja delete atau uppdate
 
-- menghapus row_now yang lebih dari angka 1 
DELETE
FROM layoffs_staging2
WHERE row_num > 1;


-- STANDARIZE DATA => MENEMUKAN PERMASALAHAN DATA DAN MEMPERBAIKINYA

-- Trim menghapus spasi yang ada sebelum di huruf awal
SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- UPDATE DI KOLOM INDUSTRI YANG MEMILIKI SALAH PENULISAN
SELECT DISTINCT industry
FROM layoffs_staging2
order by 1;

SELECT industry
FROM layoffs_staging2 
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- UPDATE DI KOLOM COUNTRY YANG MEMILIKI SALAH PENULISAN
SELECT DISTINCT country
FROM layoffs_staging2 
ORDER BY country;

SELECT country
FROM layoffs_staging2 
WHERE country LIKE 'Austria%';

UPDATE layoffs_staging2
SET country = 'Australia'
WHERE country LIKE 'Austria%';

SELECT DISTINCT country, TRIM(TRAILING '.' From country)
FROM layoffs_staging2 
WHERE country LIKE 'United States%';

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' From country)
WHERE country LIKE 'United States%' ;

-- mengubah format tanggal yang dari text menjadi format tanggal
SELECT  `date`
FROM layoffs_staging2
order by 1 ; 

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE (`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


-- 3. Null values or blank values

-- mencari nilai null or kosong di kolom industri
SELECT *
FROM layoffs_staging2
;

SELECT company, location,industry
FROM layoffs_staging2
where industry IS NULL OR industry = '';

SELECT company, location,industry
FROM layoffs_staging2
where company LIKE 'Airbnb%';

-- update kolom industri yang kosong 
 update layoffs_staging2
 set industry =Null
 WHERE industry='';
 
 -- join tabel industry 1 and tabel industry 2 
 SELECT t1.industry, t2.industry
 FROM layoffs_staging2 t1
 JOIN layoffs_staging2 t2
	ON t1.company=t2.company
WHERE t1.industry IS Null 
AND t2.industry is NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company=t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS Null 
AND t2.industry is NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- ALTER TABLE digunakan untuk menambah, menghapus, atau memodifikasi kolom dalam tabel yang ada
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;





























 
