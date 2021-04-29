class ChatMessageCreationEventBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(chat_message)
      if (chat_message.content == Answer.last.answer)
        winner= "true"
      else
        winner= "false"
      end
      ActionCable
        .server
        .broadcast('chat_channel',
                   id: chat_message.id,
                   created_at: chat_message.created_at.strftime('%H:%M'),
                   content: chat_message.content,
                   username: chat_message.username,
                   action: "chat",
                   winner: "#{winner}")
    end

  end