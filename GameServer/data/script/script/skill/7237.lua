--破魔斩
function OnUseSkill_7237(level,etype1,eid1,etype2,eid2)
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	--[[--击退概率
	local percent = {15,15,15,16,16,16,17,17,18,18,19,19,19,19,19,20}
	]]
	--百分比伤害
	local percent1 = 140                  -----初始
	local percent2 = 0.5*level-0.5        -----每级提升

	local value = damage * (percent1+percent2)/100

	--符文相关
	if s_getRuneDur(eid1,7237) > 0 then
		value = math.floor(value + dadd[level]*0.2)
		s_reduceRuneDur(eid1,7237)
	end
	MagicAttack(7237,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,value)

	--[[
	local blv = s_getbufflevel(etype1,eid1,10104)
	if blv ~= 0 and math.random(1,100) <= percent[blv] then
	s_addbuff(etype2,eid2,20,1,1)
	end
	]]
end
