class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'chat_channel'
    end
  
    def unsubscribed; end
  
    def create(opts)
      ChatMessage.create(
        content: opts.fetch('content'),
        username: opts.fetch('username')
      )
    end

    def draw(opts)
      
      ActionCable.server.broadcast('chat_channel', { cell: opts.fetch("cell"), action: "draw" })
    end

  end