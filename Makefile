PROJECT = emqttd-relx
PROJECT_DESCRIPTION = Release project for the EMQ Broker
PROJECT_VERSION = 2.0

DEPS = emqttd emq_dashboard emq_recon emq_reloader emq_stomp emq_mod_rewrite \
	   emq_auth_clientid emq_auth_username emq_auth_ldap emq_auth_http \
	   emq_auth_mysql emq_auth_pgsql emq_auth_redis emq_auth_mongo \
	   emq_plugin_template emq_sn emq_coap \
	   emqttd_plugin_cassandra cqerl jsx eredis_cluster

# emq deps
dep_emqttd        = git https://github.com/emqtt/emqttd master
dep_emq_dashboard = git https://github.com/emqtt/emq_dashboard master
dep_emq_recon     = git https://github.com/emqtt/emq_recon master
dep_emq_reloader  = git https://github.com/emqtt/emq_reloader master
dep_emq_stomp     = git https://github.com/emqtt/emq_stomp master

# emq modules
dep_emq_mod_rewrite  = git https://github.com/emqtt/emq_mod_rewrite master

# emq auth plugins
dep_emq_auth_clientid   = git https://github.com/emqtt/emq_auth_clientid master
dep_emq_auth_username   = git https://github.com/emqtt/emq_auth_username master
dep_emq_auth_ldap       = git https://github.com/emqtt/emq_auth_ldap master
dep_emq_auth_http       = git https://github.com/emqtt/emq_auth_http master
dep_emq_auth_mysql      = git https://github.com/emqtt/emq_auth_mysql master
dep_emq_auth_pgsql      = git https://github.com/emqtt/emq_auth_pgsql master
dep_emq_auth_redis      = git https://github.com/emqtt/emq_auth_redis master
dep_emq_auth_mongo      = git https://github.com/emqtt/emq_auth_mongo master
dep_emq_plugin_template = git https://github.com/emqtt/emq_plugin_template master

# external plugins
dep_emqttd_plugin_cassandra = git https://github.com/ngocthinhdp/emqttd_plugin_cassandra.git master

# mqtt-sn and coap
dep_emq_sn 	= git https://github.com/emqtt/emq_sn master
dep_emq_coap = git https://github.com/emqtt/emq_coap master

# cassandra
dep_cqerl     = git https://github.com/matehat/cqerl.git master

# jsx
dep_jsx = git https://github.com/talentdeficit/jsx.git v2.8.0

# redis
dep_eredis_cluster = git https://github.com/adrienmo/eredis_cluster.git master

# COVER = true

include erlang.mk

plugins:
	@rm -rf rel
	@mkdir -p rel/conf/plugins/ rel/schema/
	@for conf in $(DEPS_DIR)/*/etc/*.conf* ; do \
		if [ "emq.conf" = "$${conf##*/}" ] ; then \
			cp $${conf} rel/conf/ ; \
		elif [ "acl.conf" = "$${conf##*/}" ] ; then \
			cp $${conf} rel/conf/ ; \
		else \
			cp $${conf} rel/conf/plugins ; \
		fi ; \
	done
	@for schema in $(DEPS_DIR)/*/priv/*.schema ; do \
		cp $${schema} rel/schema/ ; \
	done

app:: plugins

