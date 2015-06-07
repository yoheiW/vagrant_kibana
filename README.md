# vagrant_kibana
mysql slowlog to kibana on vagrant

```
vagrant up
```

mysqlでクエリ実行
```
vagrant ssh
```
```
mysql -uroot -pdbroot
```
```
[sql] < 何かSQLを実行
```
kibana 設定
URL
```
http:192.168.33.10:5601
```
```
kibanaのSettingでUse event times to create index names にチェック
patternに以下を入力
[slowlog-]YYYY.MM.DD

Time-field nameで
@timestampを選択

Create
```
