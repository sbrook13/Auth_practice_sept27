class DogsController < ApplicationController
    
    def index 
        @dogs = Dog.all
        render json: {dogs: @dogs}
    end

    def create
        @dog = Dog.create({
            name: params[:name]
        })
        render json: {dog: @dog}
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        render json: {status: :no_content}
    end
end
