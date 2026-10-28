-- selectva neshtata koito ni trqbva, kato subira home score-a i away score-a w edno
-- joinva s imenata ot teams iii filtrira da ima 11A w edin ot dvata otbora
SELECT 
    m.match_date AS date,
    ht.name AS home_team,
    m.home_score || '-' || m.away_score AS score,
    at.name AS away_team
FROM matches m
JOIN teams ht ON m.home_team_id = ht.id
JOIN teams at ON m.away_team_id = at.id
WHERE ht.name = '11B' OR at.name = '11B'
ORDER BY m.match_date;

SELECT 
    m.match_date AS date,
    ht.name AS home_team,
    m.home_score,
    m.away_score,
    at.name AS away_team
     --ones score, ne sym smqtala tochno kakto trqbva, nenuzhen algoritm w bazata e
	-- po skoro smetkata da se pravi v backend-a (spored men)
FROM matches m
JOIN teams ht ON m.home_team_id = ht.id
JOIN teams at ON m.away_team_id = at.id
WHERE (ht.name = '11A' OR at.name = '11A')
  AND m.home_score IS NOT NULL 
  AND m.away_score IS NOT NULL
ORDER BY m.match_date;
