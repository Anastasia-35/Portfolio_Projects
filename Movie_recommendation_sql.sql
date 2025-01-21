
--- BASIC DATA EXPLORATION ---

-- Display all records
SELECT * 
FROM PortfolioProject..cleaned1_movies;

-- Count total number of records
SELECT COUNT(*) AS total_records
FROM PortfolioProject..cleaned1_movies;

-- Get unique genres
SELECT DISTINCT listed_in
FROM PortfolioProject..cleaned1_movies
WHERE listed_in IS NOT NULL;

-- Get records with missing ratings
SELECT title, release_year
FROM PortfolioProject..cleaned1_movies
WHERE rating IS NULL;




-- CONTENT TYPE ANALYSIS

-- Number of movies vs. series
SELECT type, COUNT(*) AS content_count
FROM PortfolioProject..cleaned1_movies
GROUP BY type;


-- Countries with the highest movie-to-series ratio
SELECT 
    country, 
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movie_count,
    SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS series_count,
    CAST(SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END), 0) AS movie_to_series_ratio
FROM PortfolioProject..cleaned1_movies
WHERE country IS NOT NULL
GROUP BY country
ORDER BY movie_to_series_ratio DESC;




-- TIME-BASED ANALYSIS

-- Number of movies/series released each year
SELECT release_year, COUNT(*) AS content_count
FROM PortfolioProject..cleaned1_movies
GROUP BY release_year
ORDER BY release_year DESC;

-- Yearly release trends
SELECT release_year, COUNT(title) AS content_count
FROM PortfolioProject..cleaned1_movies
GROUP BY release_year
ORDER BY release_year;

-- Most active release months
SELECT MONTH(date_added) AS release_month, COUNT(title) AS content_count
FROM PortfolioProject..cleaned1_movies
WHERE date_added IS NOT NULL
GROUP BY MONTH(date_added)
ORDER BY content_count DESC;


-- Movies released in the same year as a specific series
SELECT m.title AS movie_title, s.title AS series_title, m.release_year
FROM PortfolioProject..cleaned1_movies m
JOIN PortfolioProject..cleaned1_movies s ON m.release_year = s.release_year
WHERE m.type = 'Movie' AND s.type = 'TV Show' AND m.release_year = 2019;




-- COUNTRY-BASED ANALYSIS

-- Top 10 countries with the most movies/series
SELECT TOP 10 country, COUNT(*) AS content_count
FROM PortfolioProject..cleaned1_movies
WHERE country IS NOT NULL
GROUP BY country
ORDER BY content_count DESC;


-- Top 10 countries producing movies
SELECT TOP 10 country, COUNT(title) AS movie_count
FROM PortfolioProject..cleaned1_movies
WHERE type = 'Movie' AND country IS NOT NULL
GROUP BY country
ORDER BY movie_count DESC;



-- GENRE AND DURATION ANALYSIS

-- Top 20 genres by popularity
SELECT TOP 20 listed_in, COUNT(title) AS content_count
FROM PortfolioProject..cleaned1_movies
WHERE listed_in IS NOT NULL
GROUP BY listed_in
ORDER BY content_count DESC;


-- Count of movies/series by genre
SELECT listed_in, COUNT(*) AS genre_count
FROM PortfolioProject..cleaned1_movies
WHERE listed_in IS NOT NULL
GROUP BY listed_in
ORDER BY genre_count DESC;


-- Find movies by specific genre
SELECT title, listed_in
FROM PortfolioProject..cleaned1_movies
WHERE listed_in LIKE '%Action%' AND type = 'Movie';





-- DIRECTOR AND CAST ANALYSIS

-- Directors with the most movies/series in each genre
SELECT listed_in, director, COUNT(title) AS content_count
FROM PortfolioProject..cleaned1_movies
WHERE listed_in IS NOT NULL AND director IS NOT NULL
GROUP BY listed_in, director
ORDER BY listed_in, content_count DESC;




-- ADVANCED AGGREGRATION

-- Number of movies/series released each year by type
SELECT release_year, type, COUNT(title) AS content_count
FROM PortfolioProject..cleaned1_movies
GROUP BY release_year, type
ORDER BY release_year ASC;


-- Top 10 countries with the most content
SELECT TOP 10 country, COUNT(title) AS content_count
FROM PortfolioProject..cleaned1_movies
WHERE country IS NOT NULL
GROUP BY country
ORDER BY content_count DESC;


-- Total content count by genre
SELECT listed_in, COUNT(title) AS total_content
FROM PortfolioProject..cleaned1_movies
GROUP BY listed_in
ORDER BY total_content DESC;
