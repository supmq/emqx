%%--------------------------------------------------------------------
%% Copyright (c) 2026 LibreMQ Contributors. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

%% @doc Enables the `replicant' node role for LibreMQ.
%%
%% Upstream EMQX gates `node.role = replicant' behind the Enterprise edition:
%% `emqx_conf_schema:node_role_symbols/0' hardcodes `[core]' and appends whatever
%% the `node.role' injection point provides, and only `emqx_enterprise_schema'
%% injects `replicant'. The underlying core/replicant replication itself lives in
%% mria (Apache-2.0) and is fully present in the community build, so the gate is
%% purely a schema-level restriction.
%%
%% This module is the community-edition counterpart of that injection, wired up
%% in `emqx_conf_schema_inject:mria/1'.
-module(emqx_conf_mria_schema).

-behaviour(emqx_schema_hooks).

-export([injected_fields/0]).

injected_fields() ->
    #{
        'node.role' => [replicant]
    }.
