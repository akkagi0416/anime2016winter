# db初期化

dbを初期化してタイトル一覧のdbを作成

```
$ sqlite3 anime.db < anime.sql
$ ruby makedb.rb
```

# title.mdの作成

タイトル一覧は下のページからhtml取得してpickup.rbを使って取得。
title.mdが作成されます。

* [2016冬アニメ】今期の新作アニメ情報が満載! - あにぽた](https://akiba-souken.com/special/tv_anime/)

```
$ wget https://akiba-souken.com/special/tv_anime/
$ ruby pickup.rb
```

デュララのscreen_nameがおかしかったので、手動でtitle.mdを加工
