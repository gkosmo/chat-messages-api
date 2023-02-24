class MessagesController < ApplicationController 

    def create 
       message = params[:message]
       response = HTTParty.post(
        "https://api.openai.com/v1/completions",
        headers: {
            "Content-Type" => "application/json",
            "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}",
        },
        body: {
            model: "text-davinci-003",
            prompt: "As a software developer coach, can you answer this: #{message}",
            max_tokens: 3000,
            temperature: 0.9,
        }.to_json
       )  
       render json: response
    end

end