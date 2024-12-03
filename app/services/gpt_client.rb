# app/services/gpt_client.rb

require 'openai'

class GptClient
  def self.ask(prompt, topic)
    client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])

    response = client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You are a #{topic} tutor. Ask questions to assess proficiency." },
          { role: "user", content: prompt }
        ]
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end

