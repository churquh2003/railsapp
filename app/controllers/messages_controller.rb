class MessagesController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    user_message = @quiz.messages.create(content: params[:content], role: "user")

    # Call GPT-4
    gpt_response = GPTClient.ask(user_message.content, @quiz.topic)
    @quiz.messages.create(content: gpt_response, role: "system")

    redirect_to @quiz
  end
end
