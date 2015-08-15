# twitter_everyword_bot

Башевый скрипт, который перебирает текстовый файл с существительными и пишет их в твиттер добавляя слово.

В твиттер пишет с помощью команды software_driven_tweet - это python-скрипт, использующий tweepy для постинга через API.

# Установка
  
    MAINDIR=/opt/softdriven/
    git clone https://github.com/hordecore/twitter_everyword_bot.git $MAINDIR

# Запуск

    MAINDIR=/opt/softdriven/
    setsid bash -c "$MAINDIR/main.sh 2>>$MAINDIR/log >>$MAINDIR/log" & disown -a
