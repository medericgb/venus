class TicketsController < ApplicationController

  def new
    @ticket = CreateTicket.call
  end

  def create
    @ticket = CreateTicket.call
    if @ticket.save
      redirect_to @ticket, notice: "Ticket created successfully."
    else
      render :new
    end
  end

  def edit
    @ticket = Tickets::Operations::GetById(params[:id])

  end

  def update
    @ticket = Tickets::Operations::GetById(params[:id])
    current_account.close_ticket(@ticket)
    redirect_to @ticket
    if @ticket.update!
      redirect_to @ticket, notice: "Ticket updated successfully."
    else
      render :edit
    end
  end

  private

  def ticket_params
    params.require(:ticket)
  end
end

