class OrdersController < ApplicationController
	before_action :find_order, only:[:update, :show, :destroy]

	def index
			@user = current_user
			@orders = @user.orders.all
	end

	def piggy_index
		@user = current_user
		@orders = Order.where.not(user_id:@user.id)
	end

	def new
		@user = current_user
		@order = @user.orders.new
	end

	def create
		@user = current_user
		@user.orders.new(order_params)
			
		if @user.save
			redirect_to("/users/#{@user.id}/orders")
		else
			@order = @user.orders.new
			redirect_to "new"
		end

	end

  def update
		@user = current_user

			if @order.update(order_params)
				 	redirect_to "/users/#{@user.id}/orders/#{@order.id}"
			else
					render "/users/profile"
			end	

	end

  def show
  	@user = current_user

			if @order
				@user_orderer = User.find_by(id: @order.user_id)
			end
			unless @order
				render "order_not_found"
			end

	end

	def destroy
		@user = current_user
		@order.destroy

		redirect_to "/users/#{@user.id}/orders/new"
	end

	def piggy_order
		@user = current_user
		@user.orders.new(order_params)
			
		if @user.save
			redirect_to("/users/#{@user.id}/orders/:id")
		else
			@order = @user.orders.new
			render "new"
		end

	end

private

	def find_order
		@order = Order.find_by(id: params[:id])
	end

	def order_params
		params.require(:order).permit(:amount,:source,:minutes)
	end

end


