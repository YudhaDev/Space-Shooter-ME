extends Node

var isPlayerInBonfire : bool = false

var playerBasedBuffs = ["player01:hp-up", "player02:speed-up", "player03:attack-mult-up"]
var weaponBounceBasedBuffs = ["weapon-bounce01:bounce", "weapon-bounce-enhance01:base-attack-up", "weapon-bounce-enhance02:base-projectile-speed-up"]
var weaponPenetrateBasedBuff = ["weapon-penetrate01:penetrate"]

var buffs = [playerBasedBuffs, weaponBounceBasedBuffs, weaponPenetrateBasedBuff]
