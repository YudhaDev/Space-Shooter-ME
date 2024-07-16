extends Node

var isPlayerInBonfire : bool = false
var updateBuff : bool = false

var _current_level = 1

#formatnya idbuff:namabuff:totalstagenya:stage1buff,stage2buff,stage3buff... so on. jika ada tanda $ berrti peningkatan stagenya sama untuk semua sisa stagenya. contoh pada buff player-hp-up, dengan total stage 5 dan 10$. berrti tiap stage akan menambah 10hp terus dengan sama. jika ada tanda "stack" diakhir brrti tipe buffnya itu stacking, misal stage 1 nambah hp 10, upgrade ke stage 2 yg mana hp +10 juga brrti total penambahan hpnya skrg +20
var playerBasedBuffs = ["player01:player-hp-up:5:10$:stack", 
"player02:player-movspeed-up:5:2,3,4,5,6", 
"player03:player-attack-mult-up:3:5,10,15"]

var weaponBounceBasedBuffs = ["weapon-bounce01:bounce", 
"weapon-bounce-enhance01:base-attack-up", 
"weapon-bounce-enhance02:base-projectile-speed-up"]

var weaponPenetrateBasedBuff = ["weapon-penetrate01:penetrate"]

var weaponSpreadBasedBuff = ["weapon-spread01:spread-shoot:4:2,3,4,5"]

var registered_buffs = [playerBasedBuffs, weaponBounceBasedBuffs, weaponPenetrateBasedBuff]

#formatnya -> idbuff:stagenya example: player01:3 brrti buff player01 dengan stage/level 3
#var player_added_buffs = ["player03:5","weapon-penetrate01:5", "player01:5", ]
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

func pickBuff() -> Array:
	updateBuff = true
	#cek terlebih dahulu mana buff yg uda max
	var exclusion_arr : Array = maxedBuffExclusion()
	#lalu masukan ke array baru pertiap kategori
	#random angka index dari array tersebut untuk tiap kategor, hasil angka itu merupakan index buff terpilih. buff terpilih tersebut dimasukan ke array baru
	var filteredbuff = []
	var buffraw = []
	var selectedBuff = []
	
	
	###################PROGRESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
	if exclusion_arr.size() != 0:
		var i=0
		for buff_category in registered_buffs:
			#untuk menghasilkan buff yg filtered atau yg tidak max ke dalam array
			filteredbuff.append(filterBuff(buff_category, exclusion_arr[i]))
			i+=1
		print("filtered buff: "+str(filteredbuff))
		
	
		#memasukan semua buff ke ssatu array
		for buff in filteredbuff:
			if buff.size() >1:
				for singlebuff in buff:
					buffraw.append(singlebuff)
			elif buff.size() != 0 :
				buffraw.append(buff[0])
	
	else :
		for buffcategory in registered_buffs:
			for buff in buffcategory:
				buffraw.append(buff)
				#print("eee: "+ str(buff))
	
	#merandom dengan exclusion
	var exclusion_index = []
	var a = 0 
	print("buffraw size: "+str(buffraw.size()))
	if(buffraw.size()<4):
		for bufflagi in buffraw:
			selectedBuff.append(bufflagi)
	else :
		print("masuk else")
		while a<3:
			while true:
				var randomindex = randi() %  buffraw.size()
				print("randomindex "+str(randomindex))
				if randomindex not in exclusion_index:
					exclusion_index.append(randomindex)
					selectedBuff.append(buffraw[randomindex])
					break
			a+=1
		#for index in buffraw:
			#if index not in exclusion_index:
	return selectedBuff

func findPlayerBuff(idbuff:String) -> String:
	for buff_category in registered_buffs:
		for buff in buff_category:
			var splitted_string = buff.split(":")
			if idbuff == splitted_string[0]:
				return buff
	print("buff tidak ditemukan")
	return "-1"


func maxedBuffExclusion() -> Array:
	var maxed_buff = []
	var return_array = []
	if player_added_buffs.size()==0:
		#return array kosong
		return []
	else :
		for buff in player_added_buffs:
			var splitted = buff.split(":")
			var idbuff = splitted[0]
			var stage_buff = splitted[1]
			var result = findPlayerBuff(idbuff)
			if result != "-1":
				if result.split(":").size() <3:
					if int(stage_buff) >= 5:
						maxed_buff.append(idbuff)
				elif int(stage_buff) >= int(result.split(":")[2]):
					maxed_buff.append(idbuff)
	#print("maxed: "+str(maxed_buff))
	### generate array string buff yg sudah max
	var i = 0
	for buff_category in registered_buffs:
		var j = 0
		var arr = []
		for buff in buff_category:
			#bandingkan dgn array maxed buff
			for index in maxed_buff.size():
				if buff.split(":")[0] == maxed_buff[index]:
					arr.append(str(j))
			j+=1
		return_array.append(arr)
		i+=1
	return return_array 

func filterBuff(buff:Array, exclusion:Array) -> Array:
	var array = []
	var arrExclusionInt = []
	
	for index in exclusion.size():
		arrExclusionInt.append(int(exclusion[index]))
	
	for index in range(buff.size()):
		if index not in arrExclusionInt:
			array.append(buff[index])
	return array

func calculatePlayerBuff():
	
	updateBuff = false
	pass
