class MessagesController < ApplicationController
	 
	def create
		message = current_user.messages.build(messages_params)
		 
		if message.save
			#redirect_to paginas_chat_path
			ActionCable.server.broadcast "chat_channel",
										  foo: message.message
		end
	end

	private

	def messages_params
		params.require(:message).permit(:message)
	end
	
end
