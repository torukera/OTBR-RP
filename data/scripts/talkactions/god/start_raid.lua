local startRaid = TalkAction("/raid")

function startRaid.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return true
	end

	local returnValue = Game.startRaid(param)
	if returnValue ~= RETURNVALUE_NOERROR then
		player:sendTextMessage(MESSAGE_ADMINISTRADOR, Game.getReturnMessage(returnValue))
	else
		player:sendTextMessage(MESSAGE_ADMINISTRADOR, "Raid started.")
	end
	return true
end

startRaid:separator(" ")
startRaid:groupType("normal")
startRaid:register()
