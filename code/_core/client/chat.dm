/client/proc/to_chat(var/text,var/chat_type)

	text = "<div class='message'>[text]</div>"

	var/output_target_list = list()

	if(!(chat_type & CHAT_TYPE_COMBAT))
		output_target_list += "chat_all.output"

	if(chat_type & CHAT_TYPE_SAY)
		output_target_list += "chat_say.output"

	if(chat_type & CHAT_TYPE_OOC)
		output_target_list += "chat_ooc.output"

	if(chat_type & CHAT_TYPE_LOOC)
		output_target_list += "chat_looc.output"

	if(chat_type & CHAT_TYPE_COMBAT)
		output_target_list += "chat_combat.output"

	if(chat_type & CHAT_TYPE_RADIO) //Prevents radio spam if you heard it already.
		for(var/list/message_data in queued_chat_messages)
			if(message_data["text"] == text)
				return FALSE

	queued_chat_messages.Add(list(list("text" = text,"output_target_list" = output_target_list)))

	return TRUE