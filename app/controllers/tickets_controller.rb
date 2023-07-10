class TicketsController < ApplicationController

  def index
    @number_of_open_tickets = Ticket.where(status: 'open').count
    @number_of_closed_tickets = Ticket.where(status: 'closed').count
    @tickets_by_intervenant = Ticket.where(assigned_to: current_account.id).group(:status).count
  end 

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

  def assign
    @ticket = Tickets::Operations::GetByIdfind(params[:id])
    assignee = Account.find_intervenant_with_least_tickets
    @ticket.assigned_to = assignee.id
    if @ticket.save
      redirect_to @ticket, notice: "Ticket assigned successfully."
    else
      redirect_to @ticket, alert: "Failed to assign ticket."
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

