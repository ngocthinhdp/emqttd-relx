emqttd-relx
===========

<<<<<<< HEAD
The release project for EMQ 2.0 with hooking plugins (support cassandra, redis, rabbitmq)
=======
The release project for the EMQ Broker.
>>>>>>> 2d3372b7ab1901376359c441d84632c39d9adc05

Build
-----

1. Clone
 ```
 git clone https://github.com/ngocthinhdp/emqttd-relx.git
 ```

2. Install Rabbit's dependences

 Go to Erlang Library Home(Linux: /usr/lib64/erlang/lib or macOS: /usr/local/Cellar/erlang/19.1/lib/erlang) and run
 ```
 wget http://www.rabbitmq.com/releases/rabbitmq-erlang-client/v2.7.0/rabbit_common-2.7.0.ez 
 unzip rabbit_common-2.7.0.ez

 wget http://www.rabbitmq.com/releases/rabbitmq-erlang-client/v2.7.0/amqp_client-2.7.0.ez
 unzip amqp_client-2.7.0.ez
 ```

3. Build
 ```
 cd emqttd-relx && make
 ```

 Error: `Duplicated modules`(priority_queue & gen_server2) -> remove them all from emqtt.app and rebuild:
 ```
 Go to deps/emqttd/ebin/emqttd.app and remove those from [modules
 ```
 ```
 make clean
 make
 ```
 
 Error: `redefining macro` -> just need to remove defining macro from this sources and rebuild

 Ex:
 ```
 % -define(PROTOCOL_VERSION, "AMQP 0-9-1 / 0-9 / 0-8").
 % -define(ERTS_MINIMUM, "5.6.3").
 ```
 ```
 make clean
 make
 ```

4. Start eMQTT & Active plugins
 ```
cd _rel/emqttd && ./bin/emqttd start
./bin/emqttd_ctl plugins load emqttd_plugin_cassandra & ./bin/emqttd_ctl plugins load emqttd_plugin_notification
 ```

License
-------

Apache License Version 2.0

Author
------

Feng Lee <feng@emqtt.io>

Thinh <ngocthinhdp@gmail.com>


