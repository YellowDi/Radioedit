#!/bin/bash
cd $(dirname $0)
echo -e "local me,ns = ...\n" >wowhead.lua
date +"ns.wowhead_update=%s" >>wowhead.lua
../wowhelpers/CCEquipment.php >>wowhead.lua
echo -e "ns.allReputationGain={}\n">>wowhead.lua
echo -e "ns.allArtifactPower={}\n">>wowhead.lua
