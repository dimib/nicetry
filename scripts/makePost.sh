curl -X POST -H "content-type: application/json" \
-d '{"date":"2020-04-28T10:30:00+0000", "headline":"Nun funktioniert es", "summary":"Wenn das hier funktioniert, dann sollte es doch auch mit langen texten gehen.","text":"Hier steht jetzt an langer, langer langer Text. Nagut, vielleicht ist er doch nicht sooooo lang.", "images":[] }' \
http://localhost:8013/service/posts
