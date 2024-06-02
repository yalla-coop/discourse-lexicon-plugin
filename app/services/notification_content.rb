class NotificationContent
  def self.generate_notification_content(
    notification_type,
    sender,
    topic_title,
    excerpt,
    channel_name: nil,
    is_direct_message_channel: nil,
    message: nil
  )
    notification_variations = {
      Notification.types[:mentioned] => {
        text: "mentioned you",
        body: :excerpt
      },
      Notification.types[:replied] => {
        text: "replied to your post",
        body: :excerpt
      },
      Notification.types[:private_message] => {
        text: "sent you a message",
        body: :excerpt
      },
      Notification.types[:posted] => {
        text: "posted in",
        body: :excerpt
      },
      Notification.types[:linked] => {
        text: "linked to your post",
        body: :excerpt
      },
      Notification.types[:liked] => {
        text: "liked your post",
        body: :excerpt
      },
      Notification.types[:quoted] => {
        text: "quoted your post",
        body: :excerpt
      },
      Notification.types[:chat_message] => {
        text:
          (
            if is_direct_message_channel
              "sent you a message"
            else
              "sent a message in #{channel_name}"
            end
          ),
        body: :message
      }
    }

    variation =
      notification_variations[notification_type.to_i] || { text: topic_title }

    title =
      if variation[:body] == :excerpt
        "#{sender} #{variation[:text]} - #{topic_title}"
      elsif variation[:body] == :message
        "#{sender} #{variation[:text]}"
      else
        variation[:text]
      end

    body =
      if variation[:body] == :excerpt
        excerpt
      elsif variation[:body] == :message
        message[0..300]
      else
        "#{sender}: #{excerpt}"
      end

    { title: title, body: body }
  end
end
