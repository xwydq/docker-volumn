### build

```
docker build -t test_volume .
```



### run

```
docker run --rm -e LOCAL_USER_ID=`id -u $USER` -v "$PWD/models":/project/models test_volume sh -c "touch tmp.txt && touch models/model.txt"
```



### 查看创建结果

```
ls -l models/model.txt
```

