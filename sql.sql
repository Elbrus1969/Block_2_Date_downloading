-- Active: 1694724992522@@84.201.134.129@5432@skillfactory@sql
/*1/6  1. Получаем все данные из таблицы*/
SELECT *
FROM sql.kinopoisk

SELECT /*выбор столбцов*/
    movie_title, /*столбец movie_title*/
    2020 - year, /*столбец, каждое из значений которого ровно разнице 2020 и соответствующего значения столбца year*/
    rating /*столбец rating*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/

SELECT /*Напишите запрос, который выведет из таблицы kinopoisk следующие столбцы:
имя режиссёра (director),
название фильма (movie_title),
разница между максимально возможным рейтингом (10) и рейтингом этого фильма.*/
    director,
    movie_title,
    10 - rating
FROM sql.kinopoisk

SELECT /*выбрать столбцы*/
    director, /*столбец director*/
    movie_title, /*столбец movie_title*/
    10 - rating AS difference /*столбец, значения в котором равны разнице 10 и каждого соответствующего значения столбца rating; присвоить столбцу алиас difference*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/

SELECT /*Напишите запрос, который выведет столбцы с именем режиссёра, названием фильма, 
рейтингом по 100-балльной шкале (столбец rating_100). 
Рейтинг по 100-балльной шкале определите как оценку по 10-балльной, умноженную на 10.*/
    director,
    movie_title,
    10 * rating AS rating_100
FROM sql.kinopoisk

SELECT /*выбрать столбцы*/
    movie_title, /*столбец movie_title*/
    year / rating /*столбец, значения которого равны результату деления значений столбца year на соответствующие значения столбца rating*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/

/*2. Фильтруем строки*/
SELECT * /*выбор всех столбцов*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE position = 1 /*с позицией 1*/

SELECT * /*выбор всех столбцов*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE year = 1999 /*год 1999*/

SELECT /*выбор всех полей*/
    position, /*столбец position*/
    movie_title, /*столбец movie_title*/
    year, /*столбец year*/
    director /*столбец director*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE year < 1984 /*при условии, что год создания меньше 1984*/

SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE year <> 2000 /*если год создания не 2000*/

SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE year >= 2000 /*при условии, что год создания больше или равен 2000*/
AND rating >= 8 /*и с рейтингом от 8 и выше*/

SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sqk.kinopoisk*/
WHERE year >= 1975 /*при условии, что год создания 1975 и позднее*/
    AND year <= 1985 /*и ранее 1985*/

SELECT *
FROM sql.kinopoisk
WHERE year BETWEEN 1975 AND 1985

SELECT /*выбор всех полей*/
    director, /*столбец director*/
    movie_title /*столбец movie_title*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE rating >= 8.5

SELECT *
FROM sql.kinopoisk
WHERE year NOT BETWEEN 1965 AND 1980

SELECT /*выбор*/
    year, /*столбец year*/
    movie_title, /*столбец movie_title*/
    director /*столбец director*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE (rating > 8.5 AND year < 2000) /*при условии, что рейтинг больше 8.5 и год создания до 2000*/
    OR year >= 2000 /*или год создания — 2000 и позднее*/

SELECT
    movie_title
FROM sql.kinopoisk
where year IN (2000, 1985, 1939)

SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE director = 'Леонид Гайдай' /*где режиссёр Леонид Гайдай*/

SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE movie_title LIKE 'А%' /*если название фильма начинается на А*/

SELECT
    movie_title,
    year
FROM sql.kinopoisk
WHERE director LIKE 'Дэвид%'
    AND rating > 8

SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE overview IS NULL /*если у фильма отсутствует описание*/

/* 3. Сортировка*/
SELECT *
FROM sql.kinopoisk
ORDER BY movie_title

SELECT *
FROM sql.kinopoisk
ORDER BY rating ASC

SELECT *
FROM sql.kinopoisk
ORDER BY rating DESC

SELECT /*выбор*/
    movie_title, /*столбец movie_title*/
    director, /*столбец director*/
    screenwriter, /*столбец screenwriter*/
    year /*столбец year*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE country = 'СССР' /*при условии, что страна производства — СССР*/
ORDER BY rating DESC /*сортировка по рейтингу в порядке убывания*/

SELECT /*выбор*/
    movie_title, /*столбец movie_title*/
    overview, /*столбец описание*/
    year /*столбец year*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE (rating >=8.2 AND country <> 'США') /*при условии, только те фильмы, 
у которых рейтинг не ниже 8.2 и страна производства — не США*/
ORDER BY year DESC /*сортировка по году выхода фильма в порядке убывания*/

SELECT
    movie_title,
    rating,
    overview,
    year
FROM sql.kinopoisk
ORDER BY overview NULLS FIRST

SELECT /*выбор*/
    director, /*столбец director*/
    movie_title /*столбец movie_title*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY year ASC, rating DESC /*сортировка по столбцам year и rating в порядке убывания*/

SELECT /*выбор*/
    movie_title /*столбец movie_title*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE rating > 8.3 AND country = 'Франция'
ORDER BY rating DESC, year DESC /*сортировка по столбцам year и rating в порядке убывания*/

SELECT /*выбор*/
    director, /*столбец director*/
    movie_title, /*столбец movie_title*/
    year /*столбец year*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY 1, 3 DESC /*сортировка по первому и третьему столбцам*/

/*4. Ограничение вывода*/
SELECT * /*выбор всех полей*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
LIMIT 10 /*ограничить вывод десятью значениями*/

SELECT /*выбор*/
    movie_title, /*столбец movie_title*/
    rating /*столбец rating*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY rating DESC /*сортировка по столбцу rating в порядке убывания*/
LIMIT 5 /*ограничить пятью значениями/ Обратите внимание! Ключевое слово LIMIT используется в самом конце запроса.*/

SELECT /*выбор*/
    director, /*столбец director*/
    movie_title, /*столбец movie_title*/
    actors /*столбец year*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY year
LIMIT 20

SELECT /*выбор*/
    movie_title, /*столбец movie_title*/
    rating /*столбец rating*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY rating DESC /*сортировка по столбцу rating в порядке убывания*/
OFFSET 3 LIMIT 5 /*исключить первые три строки и вывести пять следующих за ними. 
LIMIT и OFFSET можно использовать вместе, их порядок не важен.*/

SELECT /*выбор*/
    movie_title /*столбец movie_title*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE year > 1990 AND country <> 'Россия'
ORDER BY rating DESC
OFFSET 19 LIMIT 28

SELECT /*Какой режиссёр снял самый старый фильм в списке?*/
    director /*столбец movie_title*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY year
LIMIT 1

SELECT /*В каком году был выпущен фильм, который занимает 111 строку в списке, 
отсортированном по рейтингу в порядке убывания?*/
    year /*столбец movie_title*/
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
ORDER BY rating DESC
OFFSET 110 LIMIT 1

SELECT /*выбор всех полей*/
    movie_title, /*столбец movie_title*/
    director, /*столбец director*/
    screenwriter,
    actors
FROM sql.kinopoisk /*из таблицы sql.kinopoisk*/
WHERE (rating BETWEEN 8 AND 8.5 OR year < 1990) AND overview  IS NOT NULL AND movie_title NOT LIKE 'Т%' AND movie_title LIKE '____________'
ORDER BY rating DESC
LIMIT 7
/*___________________________________________________SQL-2. Агрегатные функции_______________________________________________-*/
/*1. Знакомимся с данными*/

SELECT */*выбор*/
FROM sql.pokemon /*из таблицы sql.kinopoisk*/

/*2. Убираем повторяющиеся значения*/
SELECT /*выбор*/
    type1 /*столбец type1*/
FROM sql.pokemon /*из таблицы sql.pokemon*/

SELECT DISTINCT /*выбрать уникальные значения*/
    type1 /*столбец type1*/
FROM sql.pokemon /*из таблицы sql.pokemon*/

SELECT DISTINCT /*выбрать уникальные значения*/
    type1, /*столбец type1*/
    type2 /*столбец type2*/
FROM sql.pokemon /*из таблицы sql.pokemon*/


/*3. Агрегатные функции*/
SELECT
    COUNT(*)
FROM sql.pokemon

SELECT
    COUNT(type2)
FROM sql.pokemon

SELECT /*выбор*/
    COUNT(DISTINCT type1) /*функция подсчёта строк; уникальные значения столбца type1*/
FROM sql.pokemon /*из таблицы sql.pokemon*/

SELECT /*выбор*/
    COUNT(DISTINCT type2) /*функция подсчёта строк; уникальные значения столбца type1*/
FROM sql.pokemon /*из таблицы sql.pokemon*/

SELECT /*выбор*/
    MAX(attack) /*функция подсчёта строк; уникальные значения столбца type1*/
FROM sql.pokemon /*из таблицы sql.pokemon*/

SELECT /*выбор*/
    AVG(hp) /*функция подсчёта строк; уникальные значения столбца type1*/
FROM sql.pokemon /*из таблицы sql.pokemon*/
WHERE type1 = 'Dragon'

SELECT /*выбор*/
    COUNT(*) AS "всего травяных покемонов", /*подсчёт всех строк; назначить алиас "всего травяных покемонов"*/
    COUNT(type2) AS "покемонов с дополнительным типом", /*подсчёт непустых строк в столбце type2; назначить алиас "покемонов с дополнительным типом"*/
    AVG(attack) AS "средняя атака", /*среднее значение столбца attack; назначить алиас "средняя атака"*/
    AVG(defense) AS "средняя защита" /*среднее значение столбца defense; назначить алиас "средняя защита"*/
FROM sql.pokemon /*из таблицы sql.pokemon*/
WHERE type1 = 'Grass'/*при условии, что значение столбца type1 содержит grass*/

SELECT /*выбор*/
    COUNT(*) AS "pokemon_count", /*подсчёт всех строк; назначить алиас "всего травяных покемонов"*/
    AVG(speed) AS "avg_speed", /*среднее значение столбца attack; назначить алиас "средняя атака"*/
    MAX(hp) AS "max_hp", /*среднее значение столбца defense; назначить алиас "средняя защита"*/
    MIN(hp) AS "min_hp"
FROM sql.pokemon /*из таблицы sql.pokemon*/
WHERE type1 = 'Electric' AND type2 IS NOT NULL AND defense > 50 /*при условии, что значение столбца type1 содержит grass*/

/*4. Группировка*/
SELECT /*выбор*/
    type1 AS pokemon_type, /*столбец type1; присвоить алиас pokemon_type*/
    COUNT(*) AS pokemon_count /*подсчёт всех строк; присвоить алиас pokemon_count*/
FROM sql.pokemon /*из таблицы sql.pokemon*/
GROUP BY type1 /*группировка по столбцу type1*/
ORDER BY type1 /*сортировка по столбцу type1*/

SELECT /*выбор*/
    type1 AS pokemon_type, /*столбец type1; присвоить алиас pokemon_type*/
    COUNT(*) AS pokemon_count /*подсчёт всех строк; присвоить алиас pokemon_count*/
FROM sql.pokemon /*из таблицы sql.pokemon*/
GROUP BY pokemon_type /*группировка по столбцу pokemon_type*/
ORDER BY COUNT(*) DESC /*сортировка в порядке убывания*/

/*Задание 4.1*/
SELECT 
    type1 AS primary_type,
    COUNT(DISTINCT type2) AS additional_types_count,
    AVG(hp) AS avg_hp,
    SUM(attack) AS attack_sum
FROM sql.pokemon /*из таблицы sql.pokemon*/
GROUP BY type1/*группировка по столбцу pokemon_type*/
ORDER BY additional_types_count DESC, primary_type  /*сортировка в порядке убывания*/

SELECT /*выбор*/
    type1 AS primary_type, /*столбец type1; присвоить алиас primary_type*/
    type2 AS additional_type, /*столбец type2; присвоить алиас additional_type*/
    COUNT(*) AS pokemon_count /*подсчёт всех строк присвоить алиас pokemon_count*/
FROM sql.pokemon /*из таблицы sql.pokemon*/
GROUP BY 1, 2 /*группировка по столбцам 1 и 2*/
ORDER BY 1, 2 NULLS FIRST /*сортировка по столбцам 1 и 2; сначала нули*/