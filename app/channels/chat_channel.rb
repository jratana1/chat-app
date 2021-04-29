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

    def answer(opts)
      Answer.create(
        answer: opts.fetch('content')
      )
      # ActionCable.server.broadcast('chat_channel', { answer: opts.fetch("answer"), action: "answer" })

    end

  end