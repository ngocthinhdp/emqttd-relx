emqttd-relx
===========

The release project for EMQ 2.0 with hooking plugins

Build
-----

1. Clone
 ```
 git clone https://github.com/emqtt/emqttd-relx.git
 ```

2. Install Rabbit's dependences
 ```
wget http://www.rabbitmq.com/releases/rabbitmq-erlang-client/v2.7.0/rabbit_common-2.7.0.ez
unzip rabbit_common-2.7.0.ez
ln -s rabbit_common-2.7.0 rabbit_common

wget http://www.rabbitmq.com/releases/rabbitmq-erlang-client/v2.7.0/amqp_client-2.7.0.ez
unzip amqp_client-2.7.0.ez
ln -s amqp_client-2.7.0 amqp_client
 ```

3. Build
 ```
cd emqttd-relx && make
 ```

 If there have any dupplicate errors(priority_queue & gen_server2) then remove them all from emqtt and rebuild:
 ```
rm deps/emqttd/ebin/gen_server2.beam 
rm deps/emqttd/ebin/priority_queue.beam 
make clean
make
 ```

4. Start eMQTT & Active plugins
 ```
cd _rel/emqttd && ./bin/emqttd start
./bin/emqttd_ctl plugins load emqttd_plugin_cassandra & ./bin/emqttd_ctl plugins load emqttd_plugin_notification
 ```

## License

Apache License Version 2.0

## Author

Feng Lee <feng@emqtt.io>

