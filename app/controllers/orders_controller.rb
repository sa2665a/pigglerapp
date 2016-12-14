class OrdersController < ApplicationController
	before_action :authenticate_user!
	def index
			@user = current_user
			@orders = @user.orders.all
	end

	def piggy_index
		@user = current_user
		@orders = Order.where.not(user_id:@user.id)
	end

	def new
		@user = User.find_by_id(params[:user_id])
		@order = @user.orders.new
	end

	def create
		@user = current_user
		@user.orders.new({
			amount: params[:order][:amount],
			source: params[:order][:source]})
			
		if @user.save
			redirect_to("/users/#{@user.id}/orders")
		else
			@order = @user.orders.new
			redirect_to "new"
		end
	end

  def update
		@user = User.find_by(id: params[:user_id])
		@order = Order.find_by(id: params[:id])

			if @order.update({
				minutes: params[:order][:minutes]
				});
		redirect_to "/users/#{@user.id}/orders/#{@order.id}"
		else
		render "/users/profile"
		end	
	end

  def show
  	@user = current_user
		@order = Order.find_by(id: params[:id])
		if @order
			@user_orderer = User.find_by(id: @order.user_id)
		end
		unless @order
			render "order_not_found"
		end
	end

	def destroy
		@user = current_user
		@order = Order.find_by(id: params[:id])
		@order.destroy

		redirect_to "/users/#{@user.id}/orders/new"
	end

	def piggy_order
		@user = current_user
		@user.orders.new({
			amount: params[:order][:amount],
			source: params[:order][:source]})
			
		if @user.save
			redirect_to("/users/#{@user.id}/orders/:id")
		else
			@order = @user.orders.new
			render "new"
		end
	end


end


