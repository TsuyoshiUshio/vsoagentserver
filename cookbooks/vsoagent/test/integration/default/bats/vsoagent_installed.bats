#!/usr/bin/env bats

@test "vsoagent.js has been installed" {
    run cat /home/vagrant/myagent/agent/vsoagent.js
    [ "$status" -eq 0 ]
}