class UserTicketsController < ApplicationController
    
    before_action :find_user
    
    def index
      @tickets = @user.tickets
    end 
    
    def new 
      @ticket = @user.tickets.new 
    end 
    
    def create 
      @ticket = @user.tickets.new(ticket_params)
      if @ticket.save
          redirect_to user_tickets_path(@user)
      else 
          render "new"
      end 
    end 
    
    def edit 
      @ticket = @user.tickets.find(params[:id])
      
    end
    
    def update
      @ticket = @user.tickets.find(params[:id])
        if @ticket.update(ticket_params)
            redirect_to user_tickets_path(@user)
        else 
            render "edit"
        end  
    end 
    
    def destroy
        @ticket = @user.tickets.find(params[:id])
        @ticket.destroy
        redirect_to user_tickets_path(@user)
    end 
    
    protected
    
     def find_user
      @user = User.find(params[:user_id])
     end

    
    def ticket_params
        params.require(:ticket).permit(:name, :price, :description)
    end 
    
end
