extends Node

var isPlayerInBonfire : bool = false
var playerBasedBuffs = ["player01:hp-up", "player02:speed-up", "player03:attack-mult-up"]
var weaponBounceBasedBuffs = ["weapon-bounce01:bounce", "weapon-bounce-enhance01:base-attack-up", "weapon-bounce-enhance02:base-projectile-speed-up"]
var weaponPenetrateBasedBuff = ["weapon-penetrate01:penetrate"]
var registered_buffs = [playerBasedBuffs, weaponBounceBasedBuffs, weaponPenetrateBasedBuff]
#formatnya -> idbuff:stagenya example: player01:3 brrti buff player01 dengan stage/level 3
var player_added_buffs = []

func playerAddBuff(idbuff):
	var stringbuff = str(idbuff)+":1"
	player_added_buffs.append(stringbuff)
	print("buff "+idbuff+" added.")
	pass

func playerRemoveBuff(idbuff):
	var index = 0
	for buff in player_added_buffs:
		var splitted_str = str(buff).split(":")
		if idbuff == splitted_str[0]:
			#removing buff
			player_added_buffs.remove_at(index)
			print("buff "+str(idbuff)+" deleted.")
			break
		index +=1
		
		
func playerUpdateBuff(idbuff, stagenya):
	var index = 0 
	for buff in player_added_buffs:
		var splitted_str = str(buff).split(":")
		if idbuff == splitted_str[0]:
			splitted_str[1] = str(stagenya)
			player_added_buffs[index] = splitted_str.join(":")
			break
		index +=1
	pass

func pickBuff():
	#cek terlebih dahulu mana buff yg belum max
	#lalu masukan ke array baru pertiap kategori
	#random angka index dari array tersebut untuk tiap kategor, hasil angka itu merupakan index buff terpilih. buff terpilih tersebut dimasukan ke array baru
	#
	pass

func calculatePlayerBuff():
	pass
