class OrdersController < ApplicationController
	
	def index
		@user = User.find_by_id(params[:user_id])
		@orders = @user.orders.all
	end

	def piggy_index
		@user = current_user
		@orders = Order.where.not(user_id:true)
		#where(:user_id != current_user.id)
		#  - @user.orders.all
		# 
	end

	def new
		@user = User.find_by_id(params[:user_id])
		@order = @user.orders.new
	end

	def create
		@user = User.find_by_id(params[:user_id])
		@user.orders.new({
			amount: params[:order][:amount],
			source: params[:order][:source]})
			
		if @user.save
			redirect_to("/users/#{@user.id}/orders")
		else
			@order = @user.orders.new
			render "new"
		end
	end

 #  def update
	# 	@user = User.find_by(id: params[:user_id])
	# 	@order = Order.find_by(id: params[:id])

	# 	if @order.update(order_params)
	# 		redirect_to "/users/#{@user.id}/orders"
	# 	else
	# 	render "new"
	# 	end	

	# end

  def show
  	@user = current_user
		@order = Order.find_by(id: params[:id])

		unless @order
			render "order_not_found"
		end

	end

	def destroy
		@user = User.find params[:user_id]
		@order = Order.find_by(id: params[:id])
		@order.destroy

		redirect_to "/users/#{@user.id}/orders/new"
	end


end


