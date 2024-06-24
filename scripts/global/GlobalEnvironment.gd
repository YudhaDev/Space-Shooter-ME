extends Node

var isPlayerInBonfire : bool = false
var updateBuff : bool = false

#formatnya idbuff:namabuff:totalstagenya:stage1buff,stage2buff,stage3buff... so on. jika ada tanda $ berrti peningkatan stagenya sama untuk semua sisa stagenya. contoh pada buff player-hp-up, dengan total stage 5 dan 10$. berrti tiap stage akan menambah 10hp terus dengan sama. jika ada tanda "stack" diakhir brrti tipe buffnya itu stacking, misal stage 1 nambah hp 10, upgrade ke stage 2 yg mana hp +10 juga brrti total penambahan hpnya skrg +20
var playerBasedBuffs = ["player01:player-hp-up:5:10$:stack", 
"player02:player-movspeed-up:5:2,3,4,5,6", 
"player03:player-attack-mult-up:5"]

var weaponBounceBasedBuffs = ["weapon-bounce01:bounce", 
"weapon-bounce-enhance01:base-attack-up", 
"weapon-bounce-enhance02:base-projectile-speed-up"]

var weaponPenetrateBasedBuff = ["weapon-penetrate01:penetrate"]

var weaponSpreadBasedBuff = ["weapon-spread01:spread-shoot:4:2,3,4,5"]

var registered_buffs = [playerBasedBuffs, weaponBounceBasedBuffs, weaponPenetrateBasedBuff]

#formatnya -> idbuff:stagenya example: player01:3 brrti buff player01 dengan stage/level 3
var player_added_buffs = []

func playerAddBuff(idbuff):
	var stringbuff = str(idbuff)+":1"
	player_added_buffs.append(stringbuff)
	print("buff "+idbuff+" added.")
	updateBuff = false

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
	updateBuff = false	
		
func playerUpdateBuff(idbuff, stagenya):
	var index = 0 
	for buff in player_added_buffs:
		var splitted_str = str(buff).split(":")
		if idbuff == splitted_str[0]:
			splitted_str[1] = str(stagenya)
			player_added_buffs[index] = splitted_str.join(":")
			break
		index +=1
	updateBuff = false

func pickBuff():
	updateBuff = true
	#cek terlebih dahulu mana buff yg uda max
	var exclusion_arr : Array = maxedBuffExclusion()
	
	#lalu masukan ke array baru pertiap kategori
	#random angka index dari array tersebut untuk tiap kategor, hasil angka itu merupakan index buff terpilih. buff terpilih tersebut dimasukan ke array baru
	var selectedbuff = []
	for buff_category in registered_buffs:
		for buff:Array in buff_category:
			random_i_with_exclusion(buff, exclusion_arr)
			var random_index = randi_range(0,buff.size())
			
	#

func findPlayerBuff(idbuff:String) -> String:
	for buff_category in registered_buffs:
		for buff in buff_category:
			var splitted_string = buff.split(":")
			if idbuff == splitted_string[0]:
				return buff
	print("buff tidak ditemukan")
	return "-1"

###################PROGRESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
func maxedBuffExclusion() -> Array:
	var tempArray = []
	if player_added_buffs.size()==0:
		#kosong
		return tempArray
	else :
		for buff in player_added_buffs:
			var splitted = buff.split(":")
			var idbuff = splitted[0]
			var result = findPlayerBuff(idbuff)
			if result != "-1":
				if splitted[2] >= result.split(":")[2]:
					tempArray.append(idbuff)
		return tempArray

func random_i_with_exclusion(buff:Array, exclusion:Array) -> int:
	return -1

func calculatePlayerBuff():
	pass
