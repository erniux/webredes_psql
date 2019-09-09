require 'twilio-ruby'

client = Twilio::REST::Client.new('ACdd21ffec39d68fb8160704db0eac9963', '71fd48c5faeb6ed9dc260455b1795ca0')
message = client.messages.create(
  to: 'whatsapp:+447719532208',
  from: 'whatsapp:+14155238886',
  body: 'Ahoy from Twilio!',
  media_url: 'https://tinyurl.com/ahoy-whatsapp'
)
puts "Message sent. Message SID: #{message.sid}."