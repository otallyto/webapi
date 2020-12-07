echo "\nrequest all heroes"
curl localhost:3000/heroes

echo '\n\nresquest first hero'
curl localhost:3000/heroes/1 

echo "\n\nrequest with wrong body" 
curl --silent -X POST \
  --data-binary '{"invalid": "data"}' \
  localhost:3000/heroes

echo "\n\ncreate hero" 
CREATE=$(curl --silent -X POST \
  --data-binary '{"name": "Chapolim", "age":100, "power": "Super Força"}' \
  localhost:3000/heroes)

echo $CREATE

ID=$(echo $CREATE | jq '.id')

echo '\n\nresquest last hero'
curl localhost:3000/heroes/$ID