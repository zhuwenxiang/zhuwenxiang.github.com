---
layout: post
title: hive 速成手册
date: 2015-02-15 15:11
comments: true
categories: hive
---

注：hive是在博主所在公司已经淘汰的开发语言，将当时在组内备受好评的速成手册分享在此。

###hive 介绍

* hive是什么？
  ** hive是一个基于hadoop的数据仓库系统，提供一种机制把数据映射为结构化的table；
  ** hive内含一种类SQL的Hive Query Language(HQL)语言，能够用简单的query做复杂的数据查询；

* hive应用场景是什么？
** 非实时的海量数据分析/挖掘/建模
** 非实时的海量数据分析/挖掘/建模

###hive VS hadoop mr program

* 优势
 * 内置丰富的通用操作算子和计算函数，能大幅降低开发成本，同时提高逻辑正确性；
 * 丰富数据模型可以简化数据组织、管理和访问的复杂度；
 * 类SQL描述的数据处理流程为“所思即所见，所见即所得”，便于理解和维护；

* 劣势
 * 数据操作不灵活，对于一些情况，一轮hadoop计算被迫要分成多个任务来完成；
 * 复杂数学计算实现困难，不直观 && 性能差；
 * 不适合访问外部数据，如dict和外部server；

* 个人总结
 * hive适用于业务逻辑非常复杂的场合。
 * 实现同样逻辑，hive程序的代码行数基本上是hadoop原生程序的1/10左右。

### hive 学习曲线

![hive学习曲线](http://img2.tbcdn.cn/L1/461/1/56d8eb15c66264c5a5c119a53b6b9daccd0adf0e)

### hive 架构

![hive_Architecture](http://img3.tbcdn.cn/L1/461/1/80351f94c7529a39cf39e36d904d0a852681fd19)

### hive 元信息

* hive元信息是“数据的数据”，用来描述table、partition、index以及其他信息的数据。

* hive元信息存储在RDBMS中，常见访问方式如下：
 * signle user mode：本地连接并访问in-memory数据库------derby，用于单测；
 * multi user mode：网络连接并访问传统关系数据库------mysql，最常用；
 * remote server mode：通过thrift协议访问thrift server，并由server中转访问元数据库，用于非java客户端；

### hive 数据模型

hive支持四种数据模型

* external table
* table
* partition
* bucket

为了避免table名称冲突，hive用database作为顶层域名，如果不设定database，就采用default database。

### hive 索引

hive索引

* hive索引数据保存在另外一个table中，会继承于被索引的table属性，意味着partition、file formatter等特性都与被索引table保持一致;
* hive索引是一个新特性，目前提升操作速度的效果不太明显；

hive索引构建

* hive索引以lazy rebuild方式建立或重建；
* hive索引建立过程是atomic；

### hive 视图

hive视图可以把一个query保存下来，并以table的形式进行使用，可以降低query语句的复杂度。

hive视图特性：

* 只支持逻辑视图，不支持物化视图；
* 在视图定义时要指明各个字段的名称，否则会赋予默认值 \_cN，N为自然数
* 在一个查询语句中，视图对应的query总是会先执行，之后才会执行其余部分；

### hive 数据类型

hive支持多种数据类型：

* 基本类型：tinyint, smallint, int,bigint, boolean, float, double, string
* 复杂类型：struct，map，array

hive对类型异常的处理：

* 数据导入时不进行类型检查，即不支持schema on write；
* 数据读取时会进行类型检查，即支持schema on read，如果类型异常，会为查询字段赋予NULL值；

###hive DDL

* create语句，创建table，可以指定数据模型，如table是否为外部表、分区、文件格式、列分隔符等，

```js
 create table if not exists test_table (field_1 int, field_2 string, field_3 double, field_4 map<int, array<string>>)
 partitioned by (data_date string)
 clustered by (field_1) sorted by (field_2) into 4 buckets
 row format delimited fields terminated by '\t'
 stored as textfile;
```

* alter语句，修改数据模型, 包括table重命名、partition增删、存储格式修改、列修改等，

```js
 alter table test_table rename to new_table;
 alter table test_table drop partition (data_date='20121106');
 alter table test_table clustered by (field_1) sorted by (field_2) into 8 buckets;
 alter table test_table add columns (field_5 float);
```

* drop语句，删除table、partition、index等，

```js
drop table test_table;
drop index field_1_index on test_table;
alter table drop test_table partiton (data_date='20121106');
```

* show语句，列出database、table和partition信息，

```js
show functions [like "str*"];
show databases [like "impl*"];
show tables [like "diradv*"];
show partitions test_table;
```

* describe语句，显示database、table、partition元信息，

```js
describe database default;
describe [extended|formatted] test_table;
describe test_table partition (data_date='20121106');
```

### hive 函数

hive内置丰富的操作符和通用函数：

1. 操作符
 * 关系操作符，如=、\!=、>、<、is null、is not null、like、rlike
 * 数学操作符，如+、-、*、/、%、&、\|、^、\~
 * 逻辑操作符，如and、or、not、&&、\|、\!
 * 复杂类型操作符，如array\[iter\]、map\[key\]、struct.sub_item

2. 函数
 * 数学函数，如rand()、ln()、sqrt()、abs()、sin()
 * 字符串函数，如concat_ws()、length()、lower()、ltrim()、reverse()
 * 日期函数，如year()、unix_timestamp()
 * 聚合函数，如count([distinct])、sum()、avg()、max()
 * 条件函数，if(condition, value_true, value_false)、case when a then b when c then d else e end、case a when b then c when d  then e else f end
 * 类型转换函数，如binary()、cast()
 * 复杂类型函数，如size()、sort_array()

3. 相关命令行
```js
SHOW FUNCTIONS -- 列出目前hive中所有函数
DESCRIBE FUNCTION function_name  -- 显示函数简单描述
DESCRIBE FUNCTION EXTENDED function_name -- 获取函数详细描述
```

###hive DML


####hive dml 数据导入

* 建立external table

```js
create external table one_test_table (id string, account_id bigint, weight float)
row format delimited fields terminated by '\t'
location '/group/one_test_table';
```

* insert语句

```js
from one_test_table
insert overwrite table two_test_table
select id, accound_id, weight
 where weight >= 0.5;
```

* load本地数据到hdfs上

```js
load data local inpath /home/work/data/tmp/\* into table one_test_table;
```

* load hdfs一处数据到另外一处

```js
load data inpath '/group/tmp_table_name/*' into table one_test_table;
```

####hive dml 数据查询

* from ... insert ... select ... where ...

```js
from one_test_table
insert overwrite table two_test_table
select *
limit 10;
```

* [left, right, full outer/semi] join

```js
from one_test_table left outer join two_test_table on (one_test_table.id = two_test_table.winfo_id)
select one_test_table.id, one_test_table.accound_id, two_test_table.id, two_test_table.accound_id
where two_test_table.account_id is null;
```

* group by

```js
from one_test_table
select id, account_id, sum(weight)
group by id, account_id;
```

* union all

```js
from (
  from one_test_table
  select *

  union all

  from two_test_table
  select *
) union_table
select *
where weight >= 0.5;
```

* sub query

```js
from (
  from one_test_table
  select id, account_id, sum(weight) as sum_weight
  group by id, account_id
) sum_table
select *
where sum_weight >= 1;
```

* order by **VS** sort by
 * sort by是每个reduce做排序；
 * order by是对结果集合做排序，所以只有一个reduce；

* distributed by **VS** cluster by
 * distribute by对map结果按指定key做distribute，但reduce结果不会排序；
 * cluster by对map结果按指定key做distribute，同时会按key对reduce结果做排序；
 * 对于同一个key，cluster by == distribute by + order by，但distribute by和order by可以作用于不同字段，组合更加灵活；

* map reduce方式 custom user script

```js
add file ./top_n_map.py;
add file ./top_n_red.py;
add cachearchive ./python26.tar.gz; -- 你需要的python版本源文件

from (
  from log_table
  map query as query, winfo_id as winfo_id, clk as clk
  using 'python26.tar.gz/bin/python26.sh top_n_map.py'
  as query, winfo_id, clk
  cluster by query
) map_table
reduce map_table.query, map_table.winfo_id, map_table.clk
using 'python26.tar.gz/bin/python26.sh top_n_red.py'
as query, winfo_id, clk;
```

 * streaming方式 custom user script

```js
add file ./page_url_to_id.py;
add file ./my_python_session_cutter.py;

from (
    select transform(user_id, page_url, unix_time)
    using 'page_url_to_id.py' as (user_id, page_id, unix_time)
    from mylog
    distribute by user_id sort by user_id, unix_time
) mylog2
select transform(user_id, page_id, unix_time)
using 'my_python_session_cutter.py' as (user_id, session_info);
```

### hive 调优

类似于其他语言编写的程序，hive脚本也需要进行性能调优，但需要注意的是：

* 优化业务或策略逻辑才是最重要的；
* 无需特意使用高级技术，只需遵循常规写法即可；

如果之后性能还有问题，可以对query的执行计划进行分析：

* 从减少job数量和i/o数量的方向进行优化；
* 具体分析可以使用explain命令；

能提升性能的任务设置方式：

* 构建合适的数据模型，如partition，bucket，index，rcfile；
* 合理建立partition和bucket，可以明显降低计算过程中的数据量，提高性能；
* 目前index主要应用于条件过滤场景，但功能还比较新，与index构建消耗的成本相比，获得的收益不大；
* rcfile属于混合存储格式，对于只需要整个数据中某些列的场景会对性能提升；
* 选择合适的map和reduce数目；
 * map任务数目可以就用默认值；reduce任务数目比较关键，对整体时间起关键作用：
 * 对数据量比较小的场景，可以设置每个reduce处理的数据量，命令为set hive.exec.reducers.bytes.per.reducer=xxx；
 * 对数据量比较大的场景，一般限于公司资源，会设置为1000，命令为set mapred.reduce.tasks=xxx；
 * 在hive中会默认合并大量的输入小文件；

能提升性能的hive语言写法：

* 对同一个table做union all，可以只读取一次数据，但需要注意的对于嵌套query会读取多次，并不会减少i/o；

```js
from (
  from one_test_table
  select id, account_id, weight

  union all

  from two_test_table
  select id, account_id, weight
) union_table
select *
where weight >= 0.5;
```

* 同一个table做多路输出，会只读一次数据；

```js
from one_test_table

insert overwrite table a_table
select *
where src = 'a'

insert overwrite table b_table
select *
where src = 'b';
```

* join是一个使用频繁、同时又比较耗时的操作，使用时需要注意：
 * 如果join时两个table都比较大，可以把较小的、或者key比较均匀的放在join左侧；
 * 如果join时一个table大，一个table小到可以放入内存，可以使用mapjoin，所有操作都会在map阶段完成；

```js
from user_table join winfo_table on (user_table.user_id = winfo_table.user_id)
insert overwrite table valid_winfo_table
select /*\+ mapjoin(user_table) \*/ winfo_table.winfo_id, winfo_table.bidword;
```

* join时可以把过滤条件放在on语句中，而不是where语句；

```js
from user_table join winfo_table on (user_table.user_id = winfo_table.user_id and winfo_table.date = '20121106')
insert overwrite table valid_winfo_table
select /*\+ mapjoin(user_table) \*/ winfo_table.winfo_id, winfo_table.bidword;
```

* 如果可以，推荐在一个sql语句中使用连续join；

```js
from user_table
join winfo_table on (user_table.user_id = winfo_table.user_id and winfo_table.date = '20121106')
join idea_table on (user_table.user_id = idea_table.user_id and idea_table.date = '20121106')
insert overwrite table valid_winfo_idea_table
select winfo_table.winfo_id, idea_table.idea_id;
```

* 全排序只会产生一个reduce任务，执行会特别慢，所以一般都会与limit一起使用，如果非要对全部结果做排序，可以使用TotalOrderPartitioner；
* hive不太适合做笛卡尔积，因为计算时只会使用一个reduce任务，所以需要尽力避免，如果避不可避，可以参见上页的join部分；
* 数据倾斜是map-reduce任务的一个大问题，同时也是一个很难解决的问题；
 * map端聚合，hive已经默认打开；
 * 设置参数 set hive.groupby.skewindata=true，可以把map结果随机分配到多个reduce中，之后再把输出结果输入到下一轮map-reduce任务；
 * 小表mapjoin，大表单独处理+union all；
 * sum() group by代替count distinct；

* 对输出使用压缩，有利于降低硬盘I/O和网络负载；
 * 对map output，建议使用lzo或snappy；
 * 对reduce output，建议使用gzip或bzip2，同时必须使用sequence file作为table存储方式；

### hive 扩展功能

hive扩展功能主要包括：

* custom python script
* udf（udf、udtf、udaf）
* serde

其中udf的类型有：

* UDF -- 以每行中的一列或多列为入参，返回单个值或对象。如：concat(col1, col2)
* UDTF -- 返回多列或者多行。如：explode()
* Macros -- 使用其他Hive函数的函数

### hive udf 开发

* 引入hive-exec包；
* 继承org.apache.hadoop.hive.ql.exec.UDF类；
* 实现evaluate方法，方法的输入和输出参数类型就是在hive中调用时的输入和返回值。

```js
package org.apache.hadoop.hive.contrib.udf.example;
import java.util.Date;
import java.text.SimpleDateFormat;
import org.apache.hadoop.hive.ql.exec.UDF;

@Description(name = "YourUDFName",
    value = "_FUNC_(InputDataType) - using the input datatype X argument, "+
            "returns YYY.",
    extended = "Example:\n"
             + "  > SELECT _FUNC_(InputDataType) FROM tablename;")

public class YourUDFName extends UDF{
..
  public YourUDFName( InputDataType InputValue ){
    ..;
  }

  public String evaluate( InputDataType InputValue ){
    ..;
  }
}
```

开发UDFs, GenericUDFs, UDAFs, and UDTFs

```js
public class YourUDFName extends UDF{
public class YourGenericUDFName extends GenericUDF {..}
public class YourGenericUDAFName extends AbstractGenericUDAFResolver {..}
public class YourGenericUDTFName extends GenericUDTF {..}
```

加载和卸载UDFs

```js
ADD JAR /full_path_to_jar/YourUDFName.jar;
CREATE TEMPORARY FUNCTION YourUDFName AS 'org.apache.hadoop.hive.contrib.udf.example.YourUDFName'; --加载
DROP TEMPORARY FUNCTION IF EXISTS YourUDFName; -- 卸载
```


### hive tips

* hive内置函数是基于utf-8编码的，因此使用gbk编码或者其他编码格式的数据用hive函数处理之后，得不到预期的结果。
* hive运行时需要临时空间/tmp，默认值是/tmp/hive-$\{user.name\}，如果这个空间满了的话，会使得hive任务失败。修改hive.exec.scratchdir配置项可解决。
* 当多个session执行hive任务并且add cachearchive同名文件的时候，有任务失败的风险，因为覆盖hdfs上的文件使得文件时间戳改变就会报错。
* hive没有not in函数，实现方式可以
```js
select a.key from a left outer join b on a.key=b.key where b.key1 is null;
```

* 一次执行多个count可以 
```js
select count(case when type = 1 then 1 end), count(case when type = 2 then 1 end) from one_test_table;
```

* 标准日期变成分区日期格式 regexp_replace(substr(a.gmt_create,1,10),'-','')=substr(a.pt,1,8)
* 带分隔符的字符串弄成数组 split(acm,'\\\.')\[0\] 获取acm的app_id
* 当数据倾斜时的计数 group by比count(distinct xx)要快得多
* join操作时，分区过滤需要放到子查询或on语句中，不能放到on后面的where里。
* 查看表的物理地址
```js
Describe extended one_test_table; 
```

* 下载表的物理数据
```js
--step1 hive 步骤
hive -e "set hive.exec.compress.output = false;
insert overwrite directory '/group/hive/one_test_table/tmp'
select * from one_test_table where pt = '${bizdate}';" 
--step2 shell 步骤
hadoop fs -cat /group/one_test_table/tmp/* |
sed -e 's/\x01/\t/g' |
awk '{print $1"\t"$2;}' > ~/one_test_table.txt 
```

* 行转列使用的group_concat函数 

* 列转行使用explode函数
```js
select id, item_id from (
    select id, split(get_json_object(features, '$.items'),',') as itemlist
    from tmp_table_name
    where status = 0
    and get_json_object(features, '$.items') is not null
    ) t
lateral view explode(itemlist) tmp_table_name as item_id;
```

### hive 资料

[hive官网](https://cwiki.apache.org/confluence/display/Hive/Home)
