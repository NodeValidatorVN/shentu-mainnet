#!/bin/bash

sed -i '/index-events = /a\ \n# IavlCacheSize set the size of the iavl tree cache..\n# Default cache size is 50mb.\niavl-cache-size = 781250\n \n# IAVLDisableFastNode enables or disables the fast node feature of IAVL..\n# Default is true.\niavl-disable-fastnode = false\n' /opt/chain/.shentud/config/app.toml

sed -i  '/max_subscriptions_per_client =/a\ \n# Experimental parameter to specify the maximum number of events a node will\n# buffer, per subscription, before returning an error and closing the\n# subscription. Must be set to at least 100, but higher values will accommodate\n# higher event throughput rates (and will use more memory).\nexperimental_subscription_buffer_size = 200\n\n# Experimental parameter to specify the maximum number of RPC responses that\n# can be buffered per WebSocket client. If clients cannot read from the\n# WebSocket endpoint fast enough, they will be disconnected, so increasing this\n# parameter may reduce the chances of them being disconnected (but will cause\n# the node to use more memory).\n#\n# Must be at least the same as "experimental_subscription_buffer_size",\n# otherwise connections could be dropped unnecessarily. This value should\n# ideally be somewhat higher than "experimental_subscription_buffer_size" to\n# accommodate non-subscription-related RPC responses.\nexperimental_websocket_write_buffer_size = 200\n\n# If a WebSocket client cannot read fast enough, at present we may\n# silently drop events instead of generating an error or disconnecting the\n# client.\n#\n# Enabling this experimental parameter will cause the WebSocket connection to\n# be closed instead if it cannot read fast enough, allowing for greater\n# predictability in subscription behaviour.\nexperimental_close_on_slow_client = false\n' /opt/chain/.shentud/config/config.toml

sed -i  '/\[mempool\]/a\ \n# Mempool version to use:\n#   1) "v0" - (default) FIFO mempool.\n#   2) "v1" - prioritized mempool.\nversion = "v0"\n' /opt/chain/.shentud/config/config.toml

sed -i  "/max_batch_bytes =/a\ \n# ttl-duration, if non-zero, defines the maximum amount of time a transaction\n# can exist for in the mempool.\n#\n# Note, if ttl-num-blocks is also defined, a transaction will be removed if it\n# has existed in the mempool at least ttl-num-blocks number of blocks or if it's\n# insertion time into the mempool is beyond ttl-duration.\nttl-duration = \"0s\"\n\n# ttl-num-blocks, if non-zero, defines the maximum number of blocks a transaction\n# can exist for in the mempool.\n#\n# Note, if ttl-duration is also defined, a transaction will be removed if it\n# has existed in the mempool at least ttl-num-blocks number of blocks or if\n# it's insertion time into the mempool is beyond ttl-duration.\nttl-num-blocks = 0\n" /opt/chain/.shentud/config/config.toml

sed -i  '/peer_query_maj23_sleep_duration =/a\ \n#######################################################\n###         Storage Configuration Options           ###\n#######################################################\n\n# Set to true to discard ABCI responses from the state store, which can save a\n# considerable amount of disk space. Set to false to ensure ABCI responses are\n# persisted. ABCI responses are required for /block_results RPC queries, and to\n# reindex events in the command-line tool.\ndiscard_abci_responses = false\n' /opt/chain/.shentud/config/config.toml

sed -i  '/indexer =/a\ \n# The PostgreSQL connection configuration, the connection format:\n#   postgresql://<user>:<password>@<host>:<port>/<db>?<opts>\npsql-conn = ""\n' /opt/chain/.shentud/config/config.toml
