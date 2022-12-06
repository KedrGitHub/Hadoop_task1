/*************************************/
• После того, как файлы окажутся на HDFS попробуйте выполнить команду, которая выводит содержимое папки. Особенно обратите внимание на права доступа к вашим файлам.
• Далее сожмите все 4 тома в 1 файл.
• Теперь давайте изменим права доступа к нашему файлу. Чтобы с нашим файлом могли взаимодействовать коллеги, установите режим доступа, который дает полный доступ для владельца файла, а для сторонних пользователей возможность читать и выполнять.
• Попробуйте заново использовать команду для вывода содержимого папки и обратите внимание как изменились права доступа к файлу.
• Теперь попробуем вывести на экран информацию о том, сколько места на диске занимает наш файл. Желательно, чтобы размер файла был удобночитаемым.
• На экране вы можете заметить 2 числа. Первое число – это фактический размер файла, а второе – это занимаемое файлом место на диске с учетом репликации. По умолчанию в данной версии HDFS эти числа будут одинаковы – это означает, что никакой репликации нет – нас это не очень устраивает, мы хотели бы, чтобы у наших файлов существовали резервные копии, поэтому напишите команду, которая изменит фактор репликации на 2.
• Повторите команду, которая выводит информацию о том, какое место на диске занимает файл и убедитесь, что изменения произошли.
• Напишите команду, которая подсчитывает количество строк в вашем файле
• В качестве результатов вашей работы, запишите ваши команды и вывод этих команд в отдельный файл и выложите его на github.


/*************************************/
[cloudera@quickstart Desktop]$ hdfs dfs -copyFromLocal vim1.txt /user/cloudera
[cloudera@quickstart Desktop]$ hdfs dfs -copyFromLocal vim2.txt /user/cloudera
[cloudera@quickstart Desktop]$ hdfs dfs -copyFromLocal vim3.txt /user/cloudera
[cloudera@quickstart Desktop]$ hdfs dfs -copyFromLocal vim4.txt /user/cloudera

[cloudera@quickstart Desktop]$ hdfs dfs -ls
Found 4 items
-rw-r--r--   1 cloudera cloudera     736519 2022-12-06 00:26 vim1.txt
-rw-r--r--   1 cloudera cloudera     770324 2022-12-06 00:30 vim2.txt
-rw-r--r--   1 cloudera cloudera     843205 2022-12-06 00:30 vim3.txt
-rw-r--r--   1 cloudera cloudera     697960 2022-12-06 00:30 vim4.txt

hdfs dfs -getmerge -nl /user/cloudera/vim1.txt /user/cloudera/vim2.txt /user/cloudera/vim3.txt /user/cloudera/vim4.txt \vim_all.txt
hdfs dfs -copyFromLocal vim_all.txt /user/cloudera

[cloudera@quickstart Desktop]$ hdfs dfs -ls
Found 5 items
-rw-r--r--   1 cloudera cloudera     736519 2022-12-06 00:26 vim1.txt
-rw-r--r--   1 cloudera cloudera     770324 2022-12-06 00:30 vim2.txt
-rw-r--r--   1 cloudera cloudera     843205 2022-12-06 00:30 vim3.txt
-rw-r--r--   1 cloudera cloudera     697960 2022-12-06 00:30 vim4.txt
-rw-r--r--   1 cloudera cloudera    3048012 2022-12-06 01:05 vim_all.txt

[cloudera@quickstart Desktop]$ hdfs dfs -chmod 764 vim_all.txt 
[cloudera@quickstart Desktop]$ hdfs dfs -ls
Found 5 items
-rw-r--r--   1 cloudera cloudera     736519 2022-12-06 00:26 vim1.txt
-rw-r--r--   1 cloudera cloudera     770324 2022-12-06 00:30 vim2.txt
-rw-r--r--   1 cloudera cloudera     843205 2022-12-06 00:30 vim3.txt
-rw-r--r--   1 cloudera cloudera     697960 2022-12-06 00:30 vim4.txt
-rwxrw-r--   1 cloudera cloudera    3048012 2022-12-06 01:05 vim_all.txt

[cloudera@quickstart Desktop]$ hdfs dfs -du vim_all.txt
3048012  3048012  vim_all.txt

[cloudera@quickstart Desktop]$ hdfs dfs -du -h vim_all.txt
2.9 M  2.9 M  vim_all.txt

[cloudera@quickstart Desktop]$ hdfs dfs -setrep 2 vim_all.txt
Replication 2 set: vim_all.txt

[cloudera@quickstart Desktop]$ hdfs dfs -du -h vim_all.txt
2.9 M  5.8 M  vim_all.txt

[cloudera@quickstart Desktop]$ hdfs dfs -cat vim_all.txt |wc -l
10276

