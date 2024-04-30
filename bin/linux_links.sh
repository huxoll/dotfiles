#!/bin/bash
GHOME="${HOME}/GoogleDrive/Games"
GOOG="../../../../../GoogleDrive"
MOUL="./moulinette/images/custom"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

LN="ln"

echo "Making high level links."
pushd .
cd $GHOME/FoundryVTT/Data
${LN} -snf "$GOOG/Games/Maps" Maps/AllMaps
${LN} -snf "$GOOG/Games/Maps_Unused/Animated" Maps/Animated
${LN} -snf "${GOOG}/Games/DND/ThunderSeaAbyss/ShipTrapIsland" ./Maps/ShipTrapIsland

MUSIC=("Dungeons_and_Dragons_Soundtrack" "TabletopAudio" "Guild_Wars_2-PoF" "Ambient_Environments" "Volatile Reaction.mp3" "41 - Night Fog.mp3" "Elder_Scrolls_V_Skyrim" "Shub-Niggurath" "Pillars_of_Eternity" "Ambiance")

for target in ${MUSIC[@]}; do
  ${LN} -snf "${GOOG}/Music/DnD/${target}" "./Music/${target}"
done

DEVIN="${MOUL}/devinknight"
for target in ${GHOME}/Tokens/Devin*; do
  echo "Making link ${DEVIN}/$(basename -- $target)"
  ${LN} -snf "../../../${GOOG}/Games/Tokens/$(basename -- $target)" "${DEVIN}/$(basename -- $target)"
done

DEVINETC=("TP17HairyOrcsGoblins" "TP5DMEssentials1" "TP14DMEssentials2" \
"TP8WetCaverns" "Forged Kin - 27" "Temp-Ship" "TP9TheCamp" "Vampire's Curse" \
"TP10Townsfolk" "Creature Codex 1 Aatxe - Cueyatl" \
"Creature Codex 2 Dakini – Dragonborn")
for target in ${DEVINETC[@]}; do
  ${LN} -snf "../../../${GOOG}/Games/Tokens/${target}" "${DEVIN}/${target}"
done

${LN} -snf "../../../${GOOG}/Games/Maps/Assets/FA_Assets" "${MOUL}/ForgottenAdventures/MapMaking"
${LN} -snf "../../../${GOOG}/Games/Tokens/Objects 01 - Dungeon Items" "${MOUL}/roll20/Objects 01 - Dungeon Items"

for target in ${GHOME}/Tokens/Jans*; do
  ${LN} -snf "../../../${GOOG}/Games/Tokens/$(basename -- $target)" "${MOUL}/janloos/$(basename -- $target)"
done

mkdir -p "${MOUL}/tomcartos/$(basename -- $target)"
for target in ${GHOME}/Tokens/Tom_Cartos_Creatures/*; do
  ${LN} -snf "../../../${GOOG}/Games/Tokens/Tom_Cartos_Creatures/$(basename -- $target)" "${MOUL}/tomcartos/$(basename -- $target)"
done

GP="moulinette/tiles/custom/gabrielpickard"
AST="${GHOME}/Maps/Assets"
GP_SETS=("$AST/Save Vs.*" "$AST/Quick En*" "$AST/Transport*" "$AST/Vile T*" "$AST/Critical*")
GP_SETS+=("$AST/Swap*" "$AST/Slap*" "$AST/Overland*" "$AST/Ships_and_the_Sea")

for name_set in ${GP_SETS[@]}; do
  for target in $name_set; do
    TGT=$(basename -- "$target")	  
    ${LN} -snf "../../../${GOOG}/Games/Maps/Assets/${TGT}" "${GP}/${TGT}"
  done
done

FA="moulinette/images/custom/ForgottenAdventures"
TOK="${GHOME}/Tokens"
FA_SETS=("$GHOME/Tokens/Creature_Tokens_*" "$GHOME/Tokens/Hero_Tokens_*" "$GHOME/Tokens/Adversaries_Goblins" "$GHOME/Tokens/Adversaries_Pirates")

for name_set in ${FA_SETS[@]}; do
  for target in $name_set; do
    TGT=$(basename -- "$target")
    echo "Linking ${FA}/${TGT}"  
    ${LN} -snf "../../../${GOOG}/Games/Tokens/${TGT}" "${FA}/${TGT}"
  done
done


${LN} -snf "${GHOME}/Sounds" "Sounds"
${LN} -snf "${GHOME}/DND/ThunderSeaAbyss/Inspiration" "Tiles/ThunderSea/Inspiration"
${LN} -snf "${GHOME}/DND/ThunderSeaAbyss" "ThunderSeaAbyss"
${LN} -snf "${GHOME}/DND/Inspiration Images" "Inspiration Images"
${LN} -snf "${GHOME}/Tokens/Objects 01 - Dungeon Items" "Assets/Objects 01 - Dungeon Items"
${LN} -snf "${GHOME}/Maps/Assets/Bodies" "Assets/Bodies"
${LN} -snf "${GHOME}/Maps/Assets" "Assets/All Assets"
${LN} -snf "${GHOME}/Maps/Assets/FasterCaster-SpellFX" "Tokens/FasterCaster-SpellFX"
${LN} -snf "${GHOME}/Maps/Assets/FasterCaster-SpellFX2" "Tokens/FasterCaster-SpellFX2"
${LN} -snf "${GHOME}/Tokens/Devin Token Pack 74 - NPCs Middle Class" "Tokens/Devin Token Pack 74 - NPCs Middle Class"
${LN} -snf "${GHOME}/DND/ThunderSeaAbyss/Zarrov_Tokens" "Tokens/ThunderSeaAbyss/Zarrov_Tokens"
${LN} -snf "${GHOME}/DND/TerrorInThunderSea/Party Icons" "Tokens/TerrorInThunderSea"
${LN} -snf "${GHOME}/Tokens" "Tokens/All Tokens"
${LN} -snf "${GHOME}/Tokens/Smokin_Tokens_-_Skeleton_Army" "Tokens/Monsters/Smokin_Tokens_-_Skeleton_Army"

#ln -snf "${GHOME}/Tokens/Jans\ Token\ Pack\ 10\ -\ Heroes\ 3/855476-Aarakocra-Barbarian3.webp" "Tokens/By_CR/CR0_25/Aarakocra-Barbarian3.webp"\n
ln -snf "${GHOME}/Tokens/Jans\ Token\ Pack\ 10\ -\ Heroes\ 3/855476-Aarakocra-Barbarian3.webp" "${GHOME}/Tokens/By_CR/CR0_25/Aarakocra-Barbarian3.webp"

cd "${GHOME}/Tokens/By_CR"
mkdir CR12 CR13 CR20 CR21
(cd "CR0" && ln -snf "../../Familiars and Summons/FS1_Cat_Black.webp" "Cat_Black.webp")
(cd "CR0" && ln -snf "../../Familiars and Summons/FS1_Cat_2.webp" "Cat_2.webp")
(cd "CR0" && ln -snf "../../Familiars and Summons/FS1_Cat_Yellow.webp" "Cat_Yellow.webp")
(cd "CR0" && ln -snf "../../Familiars and Summons/FS1_Badger.webp" "Badger.webp")
(cd "CR0_125" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102368-Merfolk-F.webp" "merfolk_medium_humanoid_female.webp")
(cd "CR0_125" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102370-Merfolk-M.webp" "merfolk_medium_humanoid_male.webp")
(cd "CR0_25" && ln -snf "../../Jans Token Pack 10 - Heroes 3/855476-Aarakocra-Barbarian3.webp" "Aarakocra-Barbarian3.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_06/Draft_Horse_Large_Beast_01.webp" "Draft_Horse_Large_Beast_01.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_06/Constrictor_Snake_Large_Beast_01.webp" "Constrictor_Snake_Large_Beast_01.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_06/Giant_Wolf_Spider_Medium_Beast_01.webp" "Giant_Wolf_Spider_Medium_Beast_01.webp")
(cd "CR0_25" && ln -snf "../../David North - Boss Monsters 9/Hadrosaurus.webp" "Hadrosaurus.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_50-59/Panther_Large_Beast_01.webp" "Panther_Large_Beast_01.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_01.webp" "Goblin_Small_Humanoid_01.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_02.webp" "Goblin_Small_Humanoid_02.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_03.webp" "Goblin_Small_Humanoid_03.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_04.webp" "Goblin_Small_Humanoid_04.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_05.webp" "Goblin_Small_Humanoid_05.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_06.webp" "Goblin_Small_Humanoid_06.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_07.webp" "Goblin_Small_Humanoid_07.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_08.webp" "Goblin_Small_Humanoid_08.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_09.webp" "Goblin_Small_Humanoid_09.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_05/Goblin_Small_Humanoid_10.webp" "Goblin_Small_Humanoid_10.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_50-59/Zombie_A_Medium_Undead_01.webp" "Zombie_Medium_Undead_01_A.webp")
(cd "CR0_25" && ln -snf "../../Creature_Tokens_50-59/Zombie_B_Medium_Undead_01.webp" "Zombie_Medium_Undead_01_B.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_01.webp" "Orc_Medium_Humanoid_01.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_02.webp" "Orc_Medium_Humanoid_02.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_03.webp" "Orc_Medium_Humanoid_03.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_04.webp" "Orc_Medium_Humanoid_04.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_05.webp" "Orc_Medium_Humanoid_05.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_06.webp" "Orc_Medium_Humanoid_06.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_07.webp" "Orc_Medium_Humanoid_07.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Orc_Medium_Humanoid_08.webp" "Orc_Medium_Humanoid_08.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_01.webp" "Hobgoblin_Medium_Humanoid_01.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_02.webp" "Hobgoblin_Medium_Humanoid_02.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_03.webp" "Hobgoblin_Medium_Humanoid_03.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_04.webp" "Hobgoblin_Medium_Humanoid_04.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_05.webp" "Hobgoblin_Medium_Humanoid_05.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_06.webp" "Hobgoblin_Medium_Humanoid_06.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_07.webp" "Hobgoblin_Medium_Humanoid_07.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Medium_Humanoid_08.webp" "Hobgoblin_Medium_Humanoid_08.webp")
(cd "CR0_5" && ln -snf "../../David North - Dangers of the Isles Set 1/786809-Koalinth.webp" "Koalinth_medium_humanoid_01.webp")
(cd "CR0_5" && ln -snf "../../Devin Token Pack 41 - Two Legged Fiends (KS)/locathah.webp" "Locathah_medium_humanoid_01.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_01.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_02.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_03.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_04.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_05.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_06.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_07.webp")
(cd "CR0_5" && ln -snf "../../Creature_Tokens_08/Sahuagin_Medium_Humanoid_01.webp" "sahuagin_medium_humanoid_08.webp")
(cd "CR5" && ln -snf "../../Creature_Tokens_50-59/Sea_Lion_Large_Monstrosity_01.webp" "Sea_Lion_Large_Monstrosity_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_50-59/Jaguar_large_beast_01.webp" "Jaguar_large_beast_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_11/Animated_Armor_Medium_Construct_01.webp" "Animated_Armor_Medium_Construct_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_11/Animated_Armor_Medium_Construct_Headless_01.webp" "Animated_Armor_Medium_Construct_Headless_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_50-59/Leucrotta_Large_Monstrosity_01.webp" "Leucrotta_Large_Monstrosity_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_09/Brown_Bear_Large_Beast_01.webp" "Brown_Bear_Large_Beast_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_09/Brown_Bear_Large_Beast_08.webp" "Brown_Bear_Large_Beast_08.webp")
(cd "CR1" && ln -snf "../../Devin Token Pack 67 - More Monsters 3/AA_Dryad2_hi.webp" "Dryad_hi.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_11/Ghoul_Medium_Undead_A_01.webp" "Ghoul_Medium_Undead_A_01.webp")
(cd "CR1" && ln -snf "../../Creature_Tokens_11/Ghoul_Medium_Undead_B_01.webp" "Ghoul_Medium_Undead_A_01.webp")
(cd "CR1" && ln -snf "../../David North - Dangers of the Isles Set 2/791551-SahuaginCoralSmasher.webp" "sahuagin_coral_smasher_medium_humanoid_01.webp")
(cd "CR2" && ln -snf "../../Creature_Tokens_06/Giant_Elk_Huge_Beast_01.webp" "Giant_Elk_Huge_Beast_01.webp")
(cd "CR2" && ln -snf "../../Creature_Tokens_06/Giant_Elk_Huge_Beast_02.webp" "Giant_Elk_Huge_Beast_02.webp")
(cd "CR2" && ln -snf "../../Creature_Tokens_06/Giant_Elk_Huge_Beast_03.webp" "Giant_Elk_Huge_Beast_03.webp")
(cd "CR2" && ln -snf "../../Creature_Tokens_06/Giant_Elk_Huge_Beast_04.webp" "Giant_Elk_Huge_Beast_04.webp")
(cd "CR2" && ln -snf "../../Creature_Tokens_06/Giant_Elk_Huge_Beast_05.webp" "Giant_Elk_Huge_Beast_05.webp")
(cd "CR2" && ln -snf "../../Creature_Tokens_06/Giant_Elk_Huge_Beast_06.webp" "Giant_Elk_Huge_Beast_06.webp")
(cd "CR2" && ln -snf "../../David North - Dangers of the Isles Set 1/786805-KoalinthSergeant.webp" "Koalinth_Sergeant_medium_humanoid_01.webp")
(cd "CR2" && ln -snf "../../David North - Dangers of the Isles Set 1/786829-LocathahHunter.webp" "Locathah_Hunter_medium_humanoid_01.webp")
(cd "CR2" && ln -snf "../../Misc sample pack/40-Quaggoth.webp" "quaggoth.webp")
(cd "CR2" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102380-Sahuagin-Priestess.webp" "sahuagin_priestess_medium_humanoid_01.webp")
(cd "CR2" && ln -snf "../../Devin Token Pack 145 - Mythological Creatures/Hag_Sea.webp" "sea_hag_medium_fey_01.webp")
(cd "CR2" && ln -snf "../../David North - Boss Monsters 5/HookHorror.webp" "hook_horror_large_monstrosity.webp")
(cd "CR3" && ln -snf "../../Creature_Tokens_14/Killer_Whale_Huge_Beast_01.webp" "Killer_Whale_Huge_Beast_01.webp")
(cd "CR3" && ln -snf "../../Creature_Tokens_14/Killer_Whale_Huge_Beast_01.webp" "Orca_Huge_Beast_01.webp")
(cd "CR3" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102376-Sahuagin-Champion.webp" "sahuagin_champion_medium_humanoid_01.webp")
(cd "CR3" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102378-Sahuagin-Infiltrator.webp" "sahuagin_warlock_medium_humanoid_01.webp")
(cd "CR3" && ln -snf "../../Vampire's Curse/lycanthrope werewolf.webp" "werewolf_lycanthrope.webp")
(cd "CR3" && ln -snf "../../Creature_Tokens_16/Werewolf_Medium_Humanoid_A_01.webp" "Werewolf_Medium_Humanoid_A_01.webp")
(cd "CR4" && ln -snf "../../Creature_Tokens_50-59/Banshee_Medium_Undead_01.webp" "Banshee_Medium_Undead_01.webp")
(cd "CR4" && ln -snf "../../Creature_Tokens_50-59/Brown_Scavver_Large_Monstrosity_01.webp" "Brown_Scavver_Large_Monstrosity_01.webp")
(cd "CR4" && ln -snf "../../Creature_Tokens_50-59/Needle_Blight_Medium_Plant_01.webp" "Needle_Blight_Medium_Plant_01.webp")
(cd "CR5" && ln -snf "../../Pixelfig - The Undead I/Allip.webp" "Allip.webp")
(cd "CR4" && ln -snf "../../Creature_Tokens_50-59/Cambion_Medium_Scale300_Fiend_A_01.webp" "Cambion_Medium_Fiend_A_01.webp")
(cd "CR5" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102374-Sahuagin-Baron.webp" "sahuagin_baron_medium_humanoid_01.webp")
(cd "CR5" && ln -snf "../../David North - Dangers of the Isles Set 2/791557-SahuaginWaveShaper.webp" "sahuagin_wave_shaper_medium_humanoid_01.webp")
(cd "CR5" && ln -snf "../../Jans Token Pack 5 - Aquatic Creatures 1/102380-Sahuagin-Priestess.webp" "sahuagin_high_priestess_medium_humanoid_01.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_50-59/Cyclops_Huge_Giant_01.webp" "Cyclops_Huge_Giant_01.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_50-59/Dusk_Hag_Medium_Fey_01.webp" "Dusk_Hag_Medium_Fey_01.webp")
(cd "CR6" && ln -snf "../../Tome of Beasts Tokens/Ghoul_Beggar_02_hi.webp" "Bloated_Ghoul_Medium_Humanoid_01.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_01.webp" "Hobgoblin_Warlord_Medium_Humanoid_01.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_02.webp" "Hobgoblin_Warlord_Medium_Humanoid_02.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_03.webp" "Hobgoblin_Warlord_Medium_Humanoid_03.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_04.webp" "Hobgoblin_Warlord_Medium_Humanoid_04.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_05.webp" "Hobgoblin_Warlord_Medium_Humanoid_05.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_06.webp" "Hobgoblin_Warlord_Medium_Humanoid_06.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_07.webp" "Hobgoblin_Warlord_Medium_Humanoid_07.webp")
(cd "CR6" && ln -snf "../../Creature_Tokens_08/Hobgoblin_Warlord_Medium_Humanoid_08.webp" "Hobgoblin_Warlord_Medium_Humanoid_08.webp")
(cd "CR8" && ln -snf "../../Creature_Tokens_41-49/Licker_Hound_Medium_Scale300_Fiend_01.webp" "canoloth_medium_fiend_01.webp")
(cd "CR8" && ln -snf "../../Devin Token Pack 34 - Animals (KS)/squid unfaded.webp" "Monstrous_Squid_01.webp")
(cd "CR8" && ln -snf "../../Devin Token Pack 34 - Animals (KS)/squid.webp" "Monstrous_Squid_Submerged.webp")
(cd "CR10" && ln -snf "../../Vampire's Curse/Slaad_Death.webp" "Slaad_Death.webp")
(cd "CR10" && ln -snf "../../Vampire's Curse/Slaad_Death.webp" "Death_Slaad.webp")
(cd "CR12" && ln -snf "../../Creature_Tokens_41-49/Gray_Render_Large_Monstrosity_01.webp" "Gray_Render_Large_Monstrosity_01.webp")
(cd "CR11" && ln -snf "../../Devin Token Pack 67 - More Monsters 3/AA_Gyno_Sphynx_hi.webp" "GynoSphynx_large_monstrosity.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-a.webp" "Rakshasa-a.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-b.webp" "Rakshasa-b.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-c.webp" "Rakshasa-c.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-d.webp" "Rakshasa-d.webp")
(cd "CR13" && ln -snf "../../Creature_Tokens_41-49/Adult_White_Dragon_Huge_Scale233_Dragon_01.webp" "Adult_White_Dragon_Huge_Scale233_Dragon_01.webp.webp")
(cd "CR15" && ln -snf "../../Jans Token Pack 21 - Greater Undead/7a-Mummy-Lord.webp" "Mummy-Lord-a.webp")
(cd "CR15" && ln -snf "../../Jans Token Pack 21 - Greater Undead/7b-Mummy-Lord.webp" "Mummy-Lord-b.webp")
(cd "CR15" && ln -snf "../../Jans Token Pack 21 - Greater Undead/7c-Mummy-Lord.webp" "Mummy-Lord-c.webp")
(cd "CR16" && ln -snf "../../Vampire's Curse/Golem Iron.webp" "Iron_Golem.webp")
(cd "CR20" && ln -snf "../../David North - Boss Monsters 6/BrassDragon.webp" "Ancient_Brass_Dragon.webp")
(cd "CR21" && ln -snf "../../Devin Token Pack 39 - Winged Fiends (KS)/dragon_black_dragon.webp" "Ancient_Black_Dragon.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-a.webp" "Rakshasa-a.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-b.webp" "Rakshasa-b.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-c.webp" "Rakshasa-c.webp")
(cd "CR13" && ln -snf "../../Jans Token Pack 48 - Mimics, Shifters, and Tricksters/10-Rakshasa-d.webp" "Rakshasa-d.webp")
(cd "CR15" && ln -snf "../../Jans Token Pack 21 - Greater Undead/7a-Mummy-Lord.webp" "Mummy-Lord-a.webp")
(cd "CR15" && ln -snf "../../Jans Token Pack 21 - Greater Undead/7b-Mummy-Lord.webp" "Mummy-Lord-b.webp")
(cd "CR15" && ln -snf "../../Jans Token Pack 21 - Greater Undead/7c-Mummy-Lord.webp" "Mummy-Lord-c.webp")
(cd "CR16" && ln -snf "../../Vampire's Curse/Golem Iron.webp" "Iron_Golem.webp")
(cd "CR16" && ln -snf "../../Creature_Tokens_41-49/Adult_Blue_Dragon_Huge_Scale233_Dragon_01.webp" "Adult_Blue_Dragon_Huge_Scale233_Dragon_01.webp")
(cd "CR16" && ln -snf "../../Creature_Tokens_41-49/Adult_Silver_Dragon_Huge_Scale233_Dragon_01.webp" "Adult_Silver_Dragon_Huge_Scale233_Dragon_01.webp")
(cd "CR17" && ln -snf "../../Creature_Tokens_31-40/Androsphinx_Large_Scale200_Monstrosity_01.webp" "Androsphinx_Large_Scale200_Monstrosity_01.webp")
(cd "CR20" && ln -snf "../../David North - Boss Monsters 6/BrassDragon.webp" "Ancient_Brass_Dragon.webp")
(cd "CR21" && ln -snf "../../Devin Token Pack 39 - Winged Fiends (KS)/dragon_black_dragon.webp" "Ancient_Black_Dragon.webp")

echo "Broken links?"
find ../.. -xtype l
echo "Done."

IFS=$SAVEIFS
exit 0
